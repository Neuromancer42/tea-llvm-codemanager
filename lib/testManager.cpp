#include "testManager.h"
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>

using namespace tea;
using namespace std;
using namespace llvm;

TestManager::TestManager(const string& name, unique_ptr<Module> mod){
    this->name = name;
    this->mod = move(mod);
    this->tuples = (analysis::Tuple**)malloc(BASIC_TUPLE_NUM * sizeof(analysis::Tuple*));
}

TestManager::TestManager(const string& filename){
    ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    mod = parseIRFile(filename, diag, *ctx);
    name = string(mod->getName().data());
    tuples = (analysis::Tuple**)malloc(BASIC_TUPLE_NUM * sizeof(analysis::Tuple*));
}

bool TestManager::handleTestReq(map<string, string> options, vector<string> args){
    system("./testfile > test/test_out.log");
    FILE *f = fopen("tea_log.txt", "a+");
    fprintf(f, "----------------------------------------------------------------");
    fclose(f);
    FILE *fp = fopen("tea_log.txt", "r");
    char line[MAX_LINE];
    memset(tuples, 0, sizeof(analysis::Tuple*) * BASIC_TUPLE_NUM);
    while(fscanf(fp, "%[^\n]%*c", line)){
        if(line[0] == '-') break;
        int tid;
        sscanf(line, "%d,%s", &tid, line);
        int typeID;
        sscanf(line, "%d,%s", &typeID, line);
        if(tid >= tuples_size){
            tuples = (analysis::Tuple**)realloc(tuples, tuples_size + BASIC_TUPLE_NUM);
            memset(tuples + sizeof(analysis::Tuple*) * tuples_size, 0, sizeof(analysis::Tuple*) * BASIC_TUPLE_NUM);
            tuples_size += BASIC_TUPLE_NUM;
        }
        tuples_count = tid >= tuples_count ? tid : tuples_count;
        if(typeID == Reachable){
            char methName[MAX_LINE];
            sscanf(line, "%s", methName);
            if(tuples[tid] && tuples[tid]->rel_name() == "Reachable")
                tuples[tid]->set_attribute(0, to_string(stoi(tuples[tid]->attribute(0)) + 1));
            else{
                analysis::Tuple *tuple = new analysis::Tuple();
                tuple->set_rel_name("Reachable");
                tuple->add_attribute("1");
                tuple->add_attribute(methName);
                tuples[tid] = tuple;
            }
        }
        else if(typeID == CI){
            unsigned long ci_addr;
            sscanf(line, "%lu", &ci_addr);
            if(tuples[tid] && tuples[tid]->rel_name() == "CI-IM")
                tuples[tid]->set_attribute(1, to_string(ci_addr));
            else{
                analysis::Tuple *tuple = new analysis::Tuple();
                tuple->set_rel_name("CI-IM");
                tuple->add_attribute("0");
                tuple->add_attribute(to_string(ci_addr));
                tuples[tid] = tuple;
            }
        }
        else if(typeID == IM){
            unsigned long im_addr;
            sscanf(line, "%lu", &im_addr);
            if(tuples[tid] && tuples[tid]->rel_name() == "CI-IM"){
                unsigned long ci_addr = stoul(tuples[tid]->attribute(1));
                if(ci_addr == im_addr) tuples[tid]->set_attribute(0, to_string(stoi(tuples[tid]->attribute(0)) + 1));
            }
            else{
                analysis::Tuple *tuple = new analysis::Tuple();
                tuple->set_rel_name("CI-IM");
                tuple->add_attribute("0");
                tuple->add_attribute(to_string(im_addr));
                tuples[tid] = tuple;
            }
        }
        else if(typeID == PHVal){
            char varName[MAX_LINE];
            int varVal;
            sscanf(line, "%d,%s", &varVal, varName);
            if(tuples[tid] && tuples[tid]->rel_name() == "PHVal")
                tuples[tid]->set_attribute(0, to_string(stoi(tuples[tid]->attribute(0)) + 1));
            else{
                analysis::Tuple *tuple = new analysis::Tuple();
                tuple->set_rel_name("PHVal");
                tuple->add_attribute("1");
                tuple->add_attribute(varName);
                tuple->add_attribute(to_string(varVal));
                tuples[tid] = tuple;
            }
        }
        else{
            assert("error type");
            return false;
        }
    }
    return true;
}

vector<analysis::Tuple> TestManager::getTriggeredTuples(){
    vector<analysis::Tuple> triggeredTuples;
    for(int i = 0; i < tuples_count; ++i){
        if(!tuples[i]) continue;
        if(stoi(tuples[i]->attribute(0))){
            tuples[i]->add_attribute(to_string(i));
            triggeredTuples.push_back(*tuples[i]);
        }
    }
    return triggeredTuples;
}

vector<analysis::Tuple> TestManager::getNegatedTuples(){
    vector<analysis::Tuple> nagatedTuples;
    for(int i = 0; i < tuples_count; ++i){
        if(!tuples[i]||
           !stoi(tuples[i]->attribute(0))){
            tuples[i]->add_attribute(to_string(i));
            nagatedTuples.push_back(*tuples[i]);
        }
    }
    return nagatedTuples;
}