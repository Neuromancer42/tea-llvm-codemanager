//
// Created by Yifan Chen on 2023/1/12.
//

#include "irmanager.h"
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>

using namespace tea;
using namespace std;
using namespace llvm;

IRManager::IRManager(const string& name, std::unique_ptr<llvm::Module> mod) {
    this->name = name;
    this->mod = move(mod);
}

IRManager::IRManager(const string& filename) {
    ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    mod = parseIRFile(filename, diag, *ctx);
    name = string(mod->getName().data());
}

string IRManager::get_name() {
    return name;
}
