#include <iostream>
#include <fstream>
#include "irmanager.h"

using namespace std;
using namespace tea;
int main(int argc, char** argv) {
    if (argc < 2) {
        cerr << "Usage: " << argv[0] << " <bitcode file>" << " (<output file>) " << endl;
        return 1;
    }
    string filename(argv[1]);
    cout << "Parsing file: " << filename << endl;

    // parsing IR from file
    cout << "Using LLVM version: " << LLVM_VERSION_STRING << endl;
    auto irm = unique_ptr<IRManager>(IRManager::createFromFile(filename));

    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;

    irm->build_doms();
    irm->build_rels();

    return 0;
}