#include <iostream>
#include <llvm/Config/llvm-config.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>

using namespace llvm;
using namespace std;
int main(int argc, char** argv) {
    if (argc < 2) {
        cerr << "Usage: " << argv[0] << " <bitcode file>" << endl;
        return 1;
    }
    string filename(argv[1]);
    cout << "Parsing file: " << filename << endl;

    // parsing IR from file
    cout << "Using LLVM version: " << LLVM_VERSION_STRING << endl;
    unique_ptr<LLVMContext> ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    shared_ptr<Module> mod = parseIRFile(filename, diag, *ctx);

    // get information from IR module
    cout << "Parsed module: " << mod->getName().data() << endl;
    return 0;
}
