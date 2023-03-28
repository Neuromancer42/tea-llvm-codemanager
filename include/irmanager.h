//
// Created by Yifan Chen on 2023/1/12.
//

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_H

#include <llvm/IR/Module.h>
#include <vector>
#include <map>
#include <string>
#include <utility>
#include <llvm/IR/CFG.h>

namespace tea {
    class IRManager {
    private:
        std::string name;
        std::string name1;
        std::string name2;
        std::string name3;
        std::string name4;
        unsigned int name5;
        unsigned int name6;
        // containing cfg index
        std::vector<std::pair<std::string,std::string> > cfg;
        std::map<std::string,llvm::BasicBlock*> cfg_map;
        std::map<std::string,llvm::Instruction*> inst_map;
        std::map<std::string,int> bb_inum;
        std::unique_ptr<llvm::LLVMContext> ctx;
        std::map<std::string,llvm::Value*> void_ref;
        std::map<std::string,llvm::Function*> func_ref;
        std::map<std::string,llvm::Value*> int_ref;
        std::map<std::string,llvm::Value*> float_ref;
        std::map<std::string,llvm::Value*> pointer_ref;
        std::map<std::string,llvm::Value*> vector_ref;
        std::map<std::string,llvm::Value*> label_ref;
        std::map<std::string,llvm::Value*> array_ref;
        std::map<std::string,llvm::Value*> structure_ref;
        std::unique_ptr<llvm::Module> mod;

    public:
        IRManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit IRManager(const std::string& filename);

        std::string get_name();
        void get_function_names();
        void get_cfg_contents();
        void get_types();

        // TODO: traverse the module, generating doms&rels
    };
    class CFGManager {
    private:
        int id;
        llvm::BasicBlock *bb;
        llvm::Instruction *entry_inst;
        llvm::Instruction *exit_inst;
        std::vector<llvm::BasicBlock> succbb;
        std::vector<llvm::BasicBlock> predbb;

    public:
        CFGManager(llvm::BasicBlock &b) ;   
    };
}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_H
