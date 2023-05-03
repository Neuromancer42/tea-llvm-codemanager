//
// Created by Yifan Chen on 2023/1/12.
//

#include "analysis/analysis.grpc.pb.h"
#include "irmanager.h"
#include <google/protobuf/message.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>

using namespace tea;
using namespace std;

class LLVMProvider final : public analysis::Provider::Service {
private:
    map<string, unique_ptr<IRManager>> map_manager;
    map<string, unique_ptr<llvm::LLVMContext>> map_ctx;
    map<string, llvm::SMDiagnostic> map_diag;

public:
    ~LLVMProvider() override = default;

    grpc::Status GetFeature(::grpc::ServerContext *context, const analysis::Configs *request,
                            analysis::ProviderInfo *response) override {
        // TODO print analysis info
        return Service::GetFeature(context, request, response);
    }

    grpc::Status RunAnalysis(::grpc::ServerContext *context, const analysis::RunRequest *request,
                             analysis::RunResults *response) override {
        clog << "Processing RunAnalysis request: " << request->ShortDebugString() << endl;
        if (request->analysis_name() == "llvmcmanager") {
            if (request->option().property().find("tea.source") == request->option().property().end()) {
                response->set_msg("FAIL: No source file specified");
            } else {
                const string& proj_id = request->project_id();
                map_ctx.try_emplace(proj_id, make_unique<llvm::LLVMContext>());
                string src_name = request->option().property().at("tea.source");

                // TODO set workdir of provider
                map_manager[proj_id] = unique_ptr<IRManager>(IRManager::createFromFile(src_name, map_diag[proj_id], *map_ctx[proj_id], proj_id));
                // TODO: run analysis
                response->set_msg("SUCCESS");
            }
        }
        return grpc::Status::OK;
    }



    grpc::Status Instrument(::grpc::ServerContext *context, const analysis::InstrumentRequest *request,
                            analysis::InstrumentResponse *response) override {
        return Service::Instrument(context, request, response);
    }

    grpc::Status Test(::grpc::ServerContext *context, const analysis::TestRequest *request,
                      analysis::TestResponse *response) override {
        return Service::Test(context, request, response);
    }

    grpc::Status Shutdown(::grpc::ServerContext *context, const analysis::ShutdownRequest *request,
                          analysis::ShutdownResponse *response) override {
        return Service::Shutdown(context, request, response);
    }
};

int main(int argc, char** argv) {
    // TODO read from ini config
    string server_port = "10001";
    string server_addr("localhost:" + server_port);
    LLVMProvider provider;

    grpc::ServerBuilder builder;
    builder.AddListeningPort(server_addr, grpc::InsecureServerCredentials());
    builder.RegisterService(&provider);
    unique_ptr<grpc::Server> server(builder.BuildAndStart());
    cerr << "*** llvm server started on port " << server_port << endl;
    server->Wait();
    return 0;
}