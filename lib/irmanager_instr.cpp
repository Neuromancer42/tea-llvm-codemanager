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

void IRManager_Instr::prepare_test_env(const std::string &content_dir) {
    // create environment
    std::filesystem::path content_path = content_dir;
    if (filesystem::is_directory(content_path)) {
        filesystem::copy(content_path, test_path, 
                         std::filesystem::copy_options::recursive | 
                         std::filesystem::copy_options::update_existing);
    } else {
        cerr << "*** test contents directory does not exist" << content_dir << endl;
    }
    bool succ = filesystem::is_directory(test_path) || filesystem::create_directories(test_path);
    if (!succ) {
        cerr << "*** failed to create testing directory " << test_path << endl;
        return;
    } else {
        clog << "*** prepare testing environment in " << filesystem::absolute(test_path) << endl;
    }
    
    // dump instrumented code
    std::filesystem::path src_path = test_path / "instrumented.ll";
    string outstring;
    raw_string_ostream os(outstring);
    ofstream outfile;
    module->print(os, nullptr);
    outfile.open(src_path);
    outfile << outstring;
    outfile.close();
    // dump auxiliary instrument functions
    std::filesystem::path instr_path = test_path / "instr_funcs.c";
    ofstream instrfile;
    instrfile.open(instr_path);
    instrfile << instr_code.str();
    instrfile.close();
//    // compile and link them
//    std::filesystem::path obj_path = test_path / "instrumented.o";
//    std::ostringstream exe_oss;
//    exe_oss << CLANG_EXE << " " << src_path << " " << instr_path;
//    // add linker flags if necessary
//    for (const auto& ldflag : ldflags) {
//        exe_oss << " " << ldflag;
//    }
//    exe_oss << " -o " << obj_path;
//    cout << "*** compiling instrumented program: " << exe_oss.str() << endl;
//    int rc = system(exe_oss.str().c_str());
//    assert(rc == 0 && "compilation failed");
}

void IRManager_Instr::run_test(const std::vector<std::string> & test_ids, const std::vector<std::string> &append_args) {
    std::ostringstream exe_oss;
    exe_oss << "make";
    for (const auto & test_id : test_ids) {
        exe_oss << " " << test_id;
    }
    for (const auto & arg : append_args) {
        exe_oss << " " << arg;
    }
    exe_oss << " -C " << filesystem::absolute(test_path);
    exe_oss << " -i"; // ignore errors in case some of the tests failed
    cout << "*** running tests: " << exe_oss.str() << endl;
    system(exe_oss.str().c_str());
}

void IRManager_Instr::collect_test_results(const std::string &test_id, std::vector<Tuple> &triggered_tuples,
                                           std::vector<Tuple> &negated_tuples) {
    std::filesystem::path logpath = test_path / ("tea." + test_id + ".log");
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
            instr_map[type]->process(trace);
        } else {
            assert(false && "unknown instr type");
        }
    }
    for (const auto & instr_pair : instr_map) {
        auto res_map = instr_pair.second->collect();
        for (const auto & [instr_id, res] : res_map) {
            if (res)
                triggered.insert(instr_id);
            else
                negated.insert(instr_id);
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