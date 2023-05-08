//
// Created by Yifan Chen on 2023/5/4.
//
// Contributors: Yunhao Xin, Yifan Chen

#include "irmanager_instr.h"
#include <fstream>
#include <sstream>

#ifndef CLANG_EXE
#define CLANG_EXE "clang"
#endif

using namespace tea;
using namespace std;
using namespace llvm;

bool IRManager_Instr::handle_instrument_req(const string & rel_name, const vector<string>& tuple) {
    bool succ = false;
    if (instr_map.find(rel_name) != instr_map.end())
        succ = instr_map[rel_name]->instrument(instrumented_tuples.size(), tuple);
    if (succ)
        instrumented_tuples.emplace_back(rel_name, tuple);
    return succ;
}

void IRManager_Instr::gen_instrumented_exe() {
    // dump instrumented code
    std::filesystem::path src_path = workpath / "instrumented.ll";
    string outstring;
    raw_string_ostream os(outstring);
    ofstream outfile;
    module->print(os, nullptr);
    outfile.open(src_path);
    outfile << outstring;
    outfile.close();
    // dump auxiliary instrument functions
    std::filesystem::path instr_path = workpath / "instr_funcs.c";
    ofstream instrfile;
    instrfile.open(instr_path);
    instrfile << instr_code.str();
    instrfile.close();
    // compile and link them
    std::ostringstream exe_oss;
    exe_oss << CLANG_EXE << " " << src_path << " " << instr_path;
    exe_oss << " -o " << exe_path;
    int rc = system(exe_oss.str().c_str());
    assert(rc == 0 && "compilation failed");
}

void IRManager_Instr::handle_test_req(const vector<string>& args, vector<Tuple> & triggered_tuples, vector<Tuple> & negated_tuples){
    std::ostringstream exe_oss;
    exe_oss << exe_path;
    for (auto & arg : args) {
        exe_oss << " " << arg;
    }
    exe_oss << " >test.out 2>test.err";
    system(exe_oss.str().c_str());
    ifstream trace_ifs;
    trace_ifs.open(log_path);
    string trace_line;
    std::set<unsigned> triggered, negated;
    while (getline(trace_ifs, trace_line)) {
        istringstream trace_iss(trace_line);
        string type;
        trace_iss >> type;
        vector<int> trace;
        int x;
        while (trace_iss >> x) {
            trace.push_back(x);
        }
        if (instr_map.find(type) != instr_map.end()) {
            auto res = instr_map[type]->process(trace);
            if (res.second)
                triggered.insert(res.first);
            else
                negated.insert(res.first);
        } else {
            assert(false && "unknown instr type");
        }
    }
    for (unsigned i = 0; i < instrumented_tuples.size(); ++i) {
        if (triggered.find(i) != triggered.end())
            triggered_tuples.push_back(instrumented_tuples[i]);
        else if (negated.find(i) != negated.end())
            negated_tuples.push_back(instrumented_tuples[i]);
    }
}

void IRManager_Instr::register_instr(const string &name, unique_ptr<AbstractInstr> instr) {
    instr_code << instr->gen_instr_code() << endl;
    instr_map.emplace(name, std::move(instr));
}