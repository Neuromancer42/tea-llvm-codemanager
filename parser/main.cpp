#include <iostream>
#include <fstream>
#include <sstream>
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
    unique_ptr<IRManager> irm = make_unique<IRManager>(filename);

    // get information from IR module
    cout << "Parsed module: " << irm->get_name() << endl;

    ofstream out_file;
    if(argc == 2){
        out_file.open("./output.txt", ios::trunc);
        cout << "Using default output file ./output.txt" << endl;
    }
    else{
        out_file.open(argv[2], ios::trunc);
        cout << "Using personal output file" <<  argv[2] << endl;
    }

    char parsed_domain[100000];
    char parsed_relation[100000];
    irm->get_function_names(parsed_domain, parsed_relation);
    irm->get_cfg_contents(parsed_domain, parsed_relation);
    irm->get_types(parsed_domain, parsed_relation);
    irm->get_global_var(parsed_domain, parsed_relation);
    irm->get_functions(parsed_domain, parsed_relation);
    irm->parse_insts();
    irm->get_terminate_insts(parsed_domain, parsed_relation);
    irm->get_binary_insts(parsed_domain, parsed_relation);
    irm->get_vector_insts(parsed_domain, parsed_relation);
    irm->get_aggregate_insts(parsed_domain, parsed_relation);
    irm->get_memory_insts(parsed_domain, parsed_relation);
    irm->get_conversion_insts(parsed_domain, parsed_relation);
    irm->get_other_insts(parsed_domain, parsed_relation);

    cout << parsed_domain << parsed_relation << endl;

    out_file << parsed_domain << parsed_relation << endl;

    out_file.close();

    return 0;
}