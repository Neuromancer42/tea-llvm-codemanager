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
    unique_ptr<IRManager> irm = make_unique<IRManager>(filename);

    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;
    irm->get_function_names();
    irm->get_cfg_contents();
    irm->get_types();
    irm->get_global_var();
    irm->get_functions();
    irm->parse_insts();
    irm->get_terminate_insts();
    irm->get_binary_insts();
    return 0;
}