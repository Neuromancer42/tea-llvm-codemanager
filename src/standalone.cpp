#include <iostream>
#include "irmanager.h"

using namespace std;
using namespace tea;
int main(int argc, char** argv) {
    if (argc < 2) {
        cerr << "Usage: " << argv[0] << " <bitcode file>" << endl;
        return 1;
    }
    string filename(argv[1]);
    cout << "Parsing file: " << filename << endl;

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

    llvm::LLVMContext ctx;
    llvm::SMDiagnostic diag;
    auto irm = unique_ptr<IRManager>(IRManager::createFromFile(filename, diag, ctx));
    irm->build_doms();
    irm->build_rels();
    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;
    return 0;
}
