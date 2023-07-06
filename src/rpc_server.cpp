//
// Created by Yifan Chen on 2023/1/12.
//

#include <irmanager_instr.h>
#include <instr_factory.h>
#include "instr_examples/reachableM.inc"
#include "instr_examples/ci_IM.inc"
#include "instr_examples/ci_Vval.inc"
#include <analysis/analysis.grpc.pb.h>
#include <google/protobuf/message.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>

using namespace tea;
using namespace std;

class LLVMProvider final : public analysis::Provider::Service {
private:
    map<string, unique_ptr<IRManager_Instr>> map_manager;
    map<string, unique_ptr<llvm::LLVMContext>> map_ctx;
    map<string, llvm::SMDiagnostic> map_diag;
    filesystem::path workpath;

public:
    inline static const string NAME = "llvmmanager";

    explicit LLVMProvider(const string& workdir) : workpath(workdir) {}
    ~LLVMProvider() override = default;

    grpc::Status GetFeature(::grpc::ServerContext *context, const analysis::Configs *request,
                            analysis::ProviderInfo *response) override {
        clog << "*** processing GetFeature request: " << request->ShortDebugString() << endl;
        response->set_name(NAME);
        {   // set analysis info of irmmanager
            auto *analysis_info = response->add_analysis();
            analysis_info->set_name(IRManager::ANALYSIS);
            for (auto &dom_pair: IRManager::produced_doms_info) {
                auto *dom_info = analysis_info->add_producing_dom();
                dom_info->set_name(dom_pair.first);
                dom_info->set_description(dom_pair.second);
            }
            for (auto &rel_pair: IRManager::produced_rels_info) {
                auto *rel_info = analysis_info->add_producing_rel();
                rel_info->set_name(rel_pair.first);
                *rel_info->mutable_dom() = {rel_pair.second.first.begin(), rel_pair.second.first.end()};
                rel_info->set_description(rel_pair.second.second);
            }
        }
        {   // set instrument-able rels info
            for (auto &instr_rel_pair: InstrFactory::info_map) {
                auto *rel_info = response->add_observable_rel();
                rel_info->set_name(instr_rel_pair.first);
                *rel_info->mutable_dom() = {instr_rel_pair.second.first.begin(), instr_rel_pair.second.first.end()};
                rel_info->set_description(instr_rel_pair.second.second);
            }
        }
        return grpc::Status::OK;
    }

    grpc::Status RunAnalysis(::grpc::ServerContext *context, const analysis::RunRequest *request,
                             analysis::RunResults *response) override {
        clog << "*** processing RunAnalysis request: " << request->ShortDebugString() << endl;
        if (request->analysis_name() == IRManager::ANALYSIS) {
            if (request->option().property().find("tea.source") == request->option().property().end()) {
                response->set_msg("FAIL: No source file specified");
            } else {
                const string& proj_id = request->project_id();
                map_ctx.try_emplace(proj_id, make_unique<llvm::LLVMContext>());
                string src_name = request->option().property().at("tea.source");

                filesystem::path proj_path = workpath / proj_id;
                bool succ = filesystem::is_directory(proj_path) || filesystem::create_directories(proj_path);
                if (!succ) {
                    string msg = "failed to create working directory for project " + proj_id + ": " + proj_path.string();
                    cerr << "*** " << msg << endl;
                    response->set_msg("FAIL: " + msg);
                } else {
                    string ldflags;
                    if (request->option().property().find("tea.source.cmd") != request->option().property().end()) {
                        ldflags = request->option().property().at("tea.source.cmd");
                        cout << "*** appending linker flags:" << ldflags << endl;
                    }
                    map_manager[proj_id] = unique_ptr<IRManager_Instr>(
                            IRManager_Instr::createFromFile(src_name, map_diag[proj_id], *map_ctx[proj_id], proj_path, ldflags));
                    auto &irm = map_manager[proj_id];
                    irm->build_doms();
                    irm->build_rels();
                    irm->save_all();
                    response->set_msg("SUCCESS");
                    for (auto &dom_info: IRManager::produced_doms_info) {
                        string dom_name = dom_info.first;
                        string dom_loc = irm->get_dom_loc(dom_name);
                        auto *dom = response->add_dom_output();
                        dom->mutable_info()->set_name(dom_name);
                        dom->mutable_info()->set_description(dom_info.second);
                        dom->set_location(dom_loc);
                    }
                    for (auto &rel_info: IRManager::produced_rels_info) {
                        string rel_name = rel_info.first;
                        string rel_loc = irm->get_rel_loc(rel_name);
                        auto *rel = response->add_rel_output();
                        rel->mutable_info()->set_name(rel_name);
                        *rel->mutable_info()->mutable_dom() = {rel_info.second.first.begin(), rel_info.second.first.end()};
                        rel->mutable_info()->set_description(rel_info.second.second);
                        rel->set_location(rel_loc);
                    }
                    for (auto & instr_pair : InstrFactory::factory_map) {
                        irm->register_instr(instr_pair.first, instr_pair.second->create(irm.get()));
                        cout << "*** register instr " << instr_pair.first << " to proj " << proj_id << endl;
                    }
                }
            }
        }
        return grpc::Status::OK;
    }

    grpc::Status Instrument(::grpc::ServerContext *context, const analysis::InstrumentRequest *request,
                            analysis::InstrumentResponse *response) override {
        clog << "*** processing Instrument request: " << request->ShortDebugString() << endl;
        const string &proj_id = request->project_id();
        if (map_manager.find(proj_id) == map_manager.end()) {
            cerr << "*** project " << proj_id << " never parsed before instrumenting" << endl;
        } else {
            auto & irm = map_manager[proj_id];
            map<string, ProgramDom> dom_map;
            for (auto & dom : request->dom()) {
                string dom_name = dom.info().name();
                dom_map.emplace(dom_name, string(dom_name)).first->second.load(dom.location());
            }
            for (auto & tuple : request->instr_tuple()) {
                string rel_name = tuple.rel_name();
                vector<int> attrs(tuple.attr_id().begin(), tuple.attr_id().end());
                bool succ = irm->handle_instrument_req(rel_name, attrs, dom_map);
                if (succ) {
                    auto * succ_tuple = response->add_succ_tuple();
                    succ_tuple->set_rel_name(rel_name);
                    *succ_tuple->mutable_attr_id() = {attrs.begin(), attrs.end()};
                }
            }
        }
        return grpc::Status::OK;
    }

    grpc::Status Prove(::grpc::ServerContext *context, const ::tea::analysis::ProveRequest *request,
                       ::grpc::ServerWriter<::tea::analysis::ProveResponse> *writer) override {
        return grpc::Status::OK;
    }

    grpc::Status Test(::grpc::ServerContext *context, const analysis::TestRequest *request,
                      analysis::TestResponse *response) override {
        clog << "*** processing Test request: " << request->ShortDebugString() << endl;
        const string &proj_id = request->project_id();
        if (map_manager.find(proj_id) == map_manager.end()) {
            cerr << "*** project " << proj_id << " never parsed before testing" << endl;
        } else {
            vector<string> args(request->arg().begin(), request->arg().end());
            vector<pair<string, vector<int>>> triggered, negated;
            map_manager[proj_id]->handle_test_req(args, triggered, negated);
            for (auto & t : triggered) {
                auto * tuple = response->add_triggered_tuple();
                tuple->set_rel_name(t.first);
                *tuple->mutable_attr_id() = {t.second.begin(), t.second.end()};
            }
            for (auto & t : negated) {
                auto * tuple = response->add_negated_tuple();
                tuple->set_rel_name(t.first);
                *tuple->mutable_attr_id() = {t.second.begin(), t.second.end()};
            }
        }
        return grpc::Status::OK;
    }

    grpc::Status Shutdown(::grpc::ServerContext *context, const analysis::ShutdownRequest *request,
                          analysis::ShutdownResponse *response) override {
        clog << "*** processing Shutdown request: " << request->ShortDebugString() << endl;
        const string &proj_id = request->project_id();
        if (map_manager.find(proj_id) == map_manager.end()) {
            cerr << "*** project " << proj_id << " never parsed before shutdown" << endl;
        } else {
            map_manager.erase(proj_id);
            map_ctx.erase(proj_id);
            map_diag.erase(proj_id);
            clog << "*** release project " << proj_id << endl;
        }
        return grpc::Status::OK;
    }
};

inline void usage() {
    cerr << "options:" << endl
        << "-h\t--help\tshow this message" << endl
        << "-p\t--port\tlistening to port" << endl
        << "-d\t--workdir\tworking directory" << endl
        << endl;
}

int main(int argc, char** argv) {
    // TODO read from ini config
    string workdir;
    string server_port;
    if (argc != 5) {
        usage();
        return -1;
    }
    bool consumed = false;
    for (unsigned i = 1; i < argc; ++i) {
        if (consumed) {
            consumed = false;
            continue;
        }
        string optstr = argv[i];
        if (optstr == "-p" || optstr == "--port") {
            if (i + 1 < argc) {
                server_port = argv[i + 1];
                consumed = true;
            }
        } else if (optstr == "-d" || optstr == "--workdir") {
            if (i + 1 < argc) {
                workdir = argv[i + 1];
                consumed = true;
            }
        } else {
            usage();
            return -1;
        }
    }
    if (server_port.empty() || workdir.empty()) {
        usage();
        return -1;
    }
    workdir = workdir + "/" + LLVMProvider::NAME;
    bool succ = filesystem::is_directory(workdir) || filesystem::create_directories(workdir);
    if (!succ) {
        cerr << "*** failed to create working directory " << workdir << endl;
        return -1;
    } else {
        clog << "*** llvm server works in directory " << filesystem::absolute(workdir) << endl;
    }
    LLVMProvider provider(workdir);

    string server_addr("0.0.0.0:" + server_port);
    grpc::ServerBuilder builder;
    builder.AddListeningPort(server_addr, grpc::InsecureServerCredentials());
    builder.RegisterService(&provider);
    unique_ptr<grpc::Server> server(builder.BuildAndStart());
    clog << "*** llvm server started on port " << server_port << endl;
    server->Wait();
    return 0;
}