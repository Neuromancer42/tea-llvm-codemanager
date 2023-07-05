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

bool IRManager_Instr::handle_instrument_req(const string & rel_name, const vector<int>& tuple, const map<string, ProgramDom>& dom_map) {
    bool succ = false;
    if (instr_map.find(rel_name) != instr_map.end())
        succ = instr_map[rel_name]->instrument(instrumented_tuples.size(), tuple, dom_map);
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
    // add linker flags if necessary
    for (const auto& ldflag : ldflags) {
        exe_oss << " " << ldflag;
    }
    exe_oss << " -o " << exe_path;
    cout << "*** compiling instrumented program: " << exe_oss.str() << endl;
    int rc = system(exe_oss.str().c_str());
    assert(rc == 0 && "compilation failed");
}

void IRManager_Instr::handle_test_req(const vector<string>& args, vector<Tuple> & triggered_tuples, vector<Tuple> & negated_tuples){
    if (!compiled) {
        gen_instrumented_exe();
        compiled = true;
    }
    std::ostringstream exe_oss;
    exe_oss << exe_path;
    for (auto & arg : args) {
        exe_oss << " " << arg;
    }
    std::filesystem::path outpath = workpath / ("test." + to_string(test_id) + ".out");
    std::filesystem::path errpath = workpath / ("test." + to_string(test_id) + ".err");
    std::filesystem::path logpath = workpath / ("test." + to_string(test_id) + ".log");
    if (std::filesystem::exists(log_path))
        std::filesystem::remove(log_path);
    exe_oss << " >" << outpath << " 2>" << errpath;
    test_id++;
    cout << "*** running test " << test_id <<  " for instrumented program: " << exe_oss.str() << endl;
    system(exe_oss.str().c_str());
    if (std::filesystem::exists(log_path))
        std::filesystem::rename(log_path, logpath);

    cout << "*** reading instr log: " << logpath << endl;
    std::set<unsigned> triggered, negated;
    ifstream trace_ifs(logpath);
    if (trace_ifs.fail()) {
        cout << "*** no instr log found!" << endl;
        return;
    }
    string trace_line;
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
            auto res_map = instr_map[type]->process(trace);
            for (const auto & [instr_id, res] : res_map) {
                if (res)
                    triggered.insert(instr_id);
                else
                    negated.insert(instr_id);
            }
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