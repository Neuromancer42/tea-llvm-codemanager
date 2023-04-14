#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include "irmanager.h"
#include "instrumentmng.h"
#include "testManager.h"
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>
#include "llvm/IR/IRBuilder.h"

using namespace std;
using namespace tea;
using namespace llvm;
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


    unique_ptr<llvm::LLVMContext> ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    unique_ptr<llvm::Module> mod = parseIRFile(filename, diag, *ctx);
    
    InstrumentMgr *ism = new InstrumentMgr(filename);

    map<string, string> options;
    vector<analysis::Tuple> tuples;

    analysis::Tuple tuple0;
    tuple0.set_rel_name("ReachableM");
    tuple0.add_attribute("main");
    tuples.push_back(tuple0);

    analysis::Tuple tuple1;
    tuple1.set_rel_name("CI-IM");
    tuple1.add_attribute("p");
    tuple1.add_attribute("foo");
    tuples.push_back(tuple1);

    analysis::Tuple tuple2;
    tuple2.set_rel_name("PHVal");
    tuple2.add_attribute("  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef @__func__.main)");
    tuple2.add_attribute("c");
    tuples.push_back(tuple2);
    
    analysis::Tuple tuple3;
    tuple3.set_rel_name("CI-IM");
    tuple3.add_attribute("p");
    tuple3.add_attribute("main");
    tuples.push_back(tuple3);

    printf("Instrumenting...\n");
    ism->handleInstrumentReq(options, tuples);

    Module *M = ism->get_mod();
    string outstring;
    raw_string_ostream os(outstring);
    ofstream outfile;
    M->print(os, NULL);
    outfile.open("test/test_out.ll");
    outfile << outstring;
    outfile.close();

    printf("Instrumentation Finished!\n");
    
    system("rm -f tea_log.txt");

    system("clang -emit-llvm -c test/test_out.ll -o test/test_out.bc");
    printf("Bitcode Generated!\n");

    system("clang src/infs.bc test/test_out.bc -o testfile");
    printf("Program Compiled and Linked!\n");

    TestManager *tsm = new TestManager(filename);

    vector<string> args;

    if(!tsm->handleTestReq(options, args)){
        printf("Test Failed!\n");
        return 0;
    }
    vector<analysis::Tuple> triggeredTuples = tsm->getTriggeredTuples();
    for(int i = 0; i < (int)triggeredTuples.size(); ++i){
        printf("%s ", triggeredTuples[i].rel_name().c_str());
        for(int j = 0; j < triggeredTuples[i].attribute_size(); ++j) printf("%s ", triggeredTuples[i].attribute(j).c_str());
        printf("\n");
    }
    return 0;
}