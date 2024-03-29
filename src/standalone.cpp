#include <iostream>
#include <filesystem>
#include "irmanager_instr.h"
#include "instr_factory.h"
#include "instr_examples/reachableM.inc"
#include "instr_examples/ci_IM.inc"
#include "instr_examples/ci_Vval.inc"

using namespace std;
using namespace tea;
int main(int argc, char** argv) {
    if (argc < 4) {
        cerr << "Usage: " << argv[0] << " <bitcode file> <workdir> <testdir> [<test_ids>]" << endl;
        return 1;
    }
    string filename(argv[1]);
    string workdir(argv[2]);
    string testdir(argv[3]);
    vector<string> test_ids;
    vector<string> append_args;
    cout << "Parsing file: " << filename << endl;
    cout << "Setting workdir: " << workdir << endl;
    cout << "Make args:";
    for (int i = 4; i < argc; ++i) {
        test_ids.emplace_back(argv[i]);
        cout << " " << test_ids.back();
    }
    cout << endl;
    filesystem::create_directories(workdir);

    // parsing IR from file
    cout << "Using LLVM version: " << LLVM_VERSION_STRING << endl;
    cout << "Consumed doms of IRManger: " << endl;
    for (const auto & c_dom_info : IRManager::consumed_doms_info) {
        cout << "\t" << c_dom_info.first << ":\t" << c_dom_info.second << endl;
    }
    cout << "Consumed rels of IRManger: " << endl;
    for (const auto & c_rel_info : IRManager::consumed_rels_info) {
        cout << "\t" << c_rel_info.first;
        for (const auto & p_rel_dom : c_rel_info.second.first)
            cout << ",\t" << p_rel_dom;
        cout << "\t" << c_rel_info.second.second << endl;
    }
    cout << "Produced doms of IRManger: " << endl;
    for (const auto & p_dom_info : IRManager::produced_doms_info) {
        cout << "\t" << p_dom_info.first << ":\t" << p_dom_info.second << endl;
    }
    cout << "Produced rels of IRManger: " << endl;
    for (const auto & p_rel_info : IRManager::produced_rels_info) {
        cout << "\t" << p_rel_info.first;
        for (const auto & p_rel_dom : p_rel_info.second.first)
            cout << ",\t" << p_rel_dom;
        cout << "\t" << p_rel_info.second.second << endl;
    }
    cout << "Instrumentable rels of IRManager_Instr: " << endl;
    for (const auto & instr_rel_info : InstrFactory::info_map) {
        cout << "\t" << instr_rel_info.first;
        for (const auto & instr_rel_dom : instr_rel_info.second.first) {
            cout << ",\t" << instr_rel_dom;
        }
        cout << "\t" << instr_rel_info.second.second << endl;
    }

    llvm::LLVMContext ctx;
    llvm::SMDiagnostic diag;

    auto irm = unique_ptr<IRManager_Instr>(IRManager_Instr::createFromFile(filename, diag, ctx, workdir));
    irm->build_doms();
    irm->build_rels();
    cout << "Parsed module: " << irm->get_name() << endl;

    irm->save_all();
    cout << "Produced doms: " << endl;
    for (const auto & p_dom_info : IRManager::produced_doms_info) {
        const string & dom_name = p_dom_info.first;
        cout << "\t" << dom_name << ":\t" << irm->get_dom_loc(dom_name) << endl;
    }
    cout << "Produced rels: " << endl;
    for (const auto & p_rel_info : IRManager::produced_rels_info) {
        const string & rel_name = p_rel_info.first;
        cout << "\t" << rel_name << ":\t" << irm->get_rel_loc(rel_name) << endl;
    }
    for (auto & instr_pair : InstrFactory::factory_map) {
        irm->register_instr(instr_pair.first, instr_pair.second->create(irm.get()));
        cout << "Registered instr: " << instr_pair.first << endl;
    }
    cout << "Run tests: " << endl;
    irm->prepare_test_env(testdir);
    irm->run_test(test_ids, append_args);
    for (const auto & test_id : test_ids) {
        std::vector<IRManager_Instr::Tuple> triggered, negated;
        irm->collect_test_results(test_id, triggered, negated);
        cout << "Triggered: " << triggered.size() << endl;
        cout << "Negated: " << negated.size() << endl;
    }
    return 0;
}
