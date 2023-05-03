#include <iostream>
#include "irmanager.h"

using namespace std;
using namespace tea;
int main(int argc, char** argv) {
    if (argc < 3) {
        cerr << "Usage: " << argv[0] << " <bitcode file>" << " <workdir>" << endl;
        return 1;
    }
    string filename(argv[1]);
    string workdir(argv[2]);
    cout << "Parsing file: " << filename << endl;
    cout << "Setting workdir: " << workdir << endl;
    filesystem::create_directories(workdir);

    // parsing IR from file
    cout << "Using LLVM version: " << LLVM_VERSION_STRING << endl;
    llvm::LLVMContext ctx;
    llvm::SMDiagnostic diag;

    auto irm = unique_ptr<IRManager>(IRManager::createFromFile(filename, diag, ctx, workdir));

    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;

    irm->build_doms();
    irm->build_rels();

    return 0;
}