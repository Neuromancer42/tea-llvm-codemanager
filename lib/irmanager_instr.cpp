//
// Created by Yifan Chen on 2023/5/4.
//
// Contributors: Yunhao Xin, Yifan Chen

#include "irmanager_instr.h"

using namespace tea;
using namespace std;
using namespace llvm;

#include <fstream>
#include <sstream>

bool IRManager_Instr::handle_instrument_req(const string & rel_name, const vector<string>& tuple) {
    bool succ = false;
    if (instr_map.find(rel_name) != instr_map.end())
        succ = instr_map[rel_name]->instrument(instrumented_tuples.size(), tuple);
    if (succ)
        instrumented_tuples.emplace_back(rel_name, tuple);
    return succ;
}

void IRManager_Instr::gen_instrumented_exe() {
    // TODO dump to file directly?
    string outstring;
    raw_string_ostream os(outstring);
    ofstream outfile;
    module->print(os, NULL);
    outfile.open(workpath / "tea_instrumented.ll");
    outfile << outstring;
    outfile.close();
    // TODO compile it ?
}

void IRManager_Instr::handle_test_req(const vector<string>& args, vector<Tuple> & triggered_tuples, vector<Tuple> & negated_tuples){
    system("./testfile > test/test_out.log");
    FILE *f = fopen("tea_log.txt", "a+");
    fprintf(f, "----------------------------------------------------------------");
    fclose(f);
    ifstream trace_ifs;
    trace_ifs.open("tea_log.txt");
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
}

