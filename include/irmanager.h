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
#include <llvm/IR/Instructions.h>

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
        std::map<std::string,llvm::GlobalValue*> global_ref;
        std::map<std::string,llvm::GlobalAlias*> alias_ref;
        std::map<std::string,llvm::Argument*> arg_ref;
        std::map<std::string,llvm::Value*> void_ref;
        std::map<std::string,llvm::Function*> func_ref;
        std::map<std::string,llvm::Value*> int_ref;
        std::map<std::string,llvm::Value*> float_ref;
        std::map<std::string,llvm::Value*> pointer_ref;
        std::map<std::string,llvm::Value*> vector_ref;
        std::map<std::string,llvm::Value*> label_ref;
        std::map<std::string,llvm::Value*> array_ref;
        std::map<std::string,llvm::Value*> structure_ref;
        //terminate inst
        std::map<std::string,llvm::ReturnInst*> ret_inst_ref;
        std::map<std::string,llvm::BranchInst*> br_inst_ref;
        std::map<std::string,llvm::SwitchInst*> switch_inst_ref;
        std::map<std::string,llvm::IndirectBrInst*> inbr_inst_ref;
        std::map<std::string,llvm::UnreachableInst*> unre_inst_ref;
        //binary inst
        std::map<std::string,llvm::Instruction*> binary_inst_ref;
        //vector operation inst
        std::map<std::string,llvm::ExtractElementInst*> ex_ele_inst_ref;
        std::map<std::string,llvm::InsertElementInst*> in_ele_inst_ref;
        std::map<std::string,llvm::ShuffleVectorInst*> shu_vec_inst_ref;
        //aggregate operation inst
        std::map<std::string,llvm::ExtractValueInst*> ex_val_inst_ref;
        std::map<std::string,llvm::InsertValueInst*> in_val_inst_ref;
        //memory operation inst
        std::map<std::string,llvm::AllocaInst*> alloc_inst_ref;
        std::map<std::string,llvm::LoadInst*> load_inst_ref;
        std::map<std::string,llvm::StoreInst*> store_inst_ref;
        std::map<std::string,llvm::FenceInst*> fence_inst_ref;
        std::map<std::string,llvm::AtomicCmpXchgInst*> cmpx_inst_ref;
        std::map<std::string,llvm::AtomicRMWInst*> atom_inst_ref;
        std::map<std::string,llvm::GetElementPtrInst*> get_ele_ptr_inst_ref;
        //conversion operation inst
        std::map<std::string,llvm::Instruction*> conversion_inst_ref;
        //other operation inst
        std::map<std::string,llvm::ICmpInst*> icmp_inst_ref;
        std::map<std::string,llvm::FCmpInst*> fcmp_inst_ref;
        std::map<std::string,llvm::SelectInst*> sel_inst_ref;
        std::map<std::string,llvm::CallInst*> call_inst_ref;
        std::map<std::string,llvm::VAArgInst*> va_arg_inst_ref;


        std::unique_ptr<llvm::Module> mod;

    public:
        IRManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit IRManager(const std::string& filename);

        static std::string get_value_type(llvm::Type* a);
        static std::string get_inst_id(llvm::Instruction *i, std::map<std::string, llvm::Instruction*> inst_m);
        static std::string get_ordering_kind(llvm::AtomicOrdering ao);
        std::string get_name();
        void get_function_names();
        void get_cfg_contents();
        void get_types();
        void get_global_var();
        void get_aliases();
        void get_functions();
        void parse_insts();
        void get_terminate_insts();
        void get_binary_insts();
        void get_vector_insts();
        void get_aggregate_insts();
        void get_memory_insts();
        void get_conversion_insts();
        void get_other_insts();

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
