//
// Created by Yifan Chen on 2023/1/12.
//
// Contributors: Yifan Chen, Tianyu Zhang

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_H

#include "trgt.h"

#include <llvm/IR/Module.h>
#include <vector>
#include <map>
#include <string>
#include <utility>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Instructions.h>
#include <sstream>
#include <llvm/Support/Format.h>
#include <llvm/Support/FormatVariadic.h>
#include <iomanip>

namespace tea {
    class IRManager {
    private:
        std::string name;
        std::unique_ptr<llvm::Module> module;
        // containing cfg index
        std::vector<std::pair<std::string,std::string> > cfg;
        std::map<std::string,llvm::BasicBlock*> bb_map;
        std::map<llvm::BasicBlock*, std::string> rev_bb_map;
        std::map<std::string,llvm::Instruction*> inst_map;
        std::map<llvm::Instruction*, std::string> rev_inst_map;
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
        std::map<std::string,llvm::CastInst*> conversion_inst_ref;
        //other operation inst
        std::map<std::string,llvm::ICmpInst*> icmp_inst_ref;
        std::map<std::string,llvm::FCmpInst*> fcmp_inst_ref;
        std::map<std::string,llvm::SelectInst*> sel_inst_ref;
        std::map<std::string,llvm::CallInst*> call_inst_ref;
        std::map<std::string,llvm::PHINode*> phi_inst_ref;
        std::map<std::string,llvm::VAArgInst*> va_arg_inst_ref;

        std::map<std::string, int> imm_dom_ref;

    public:
        IRManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit IRManager(const std::string& filename);

        static std::string get_value_type(llvm::Type* a);
        static std::string get_inst_id(llvm::Instruction *i, const std::map<std::string, llvm::Instruction*>& inst_m);
        static std::string get_ordering_kind(llvm::AtomicOrdering ao);
        static std::string get_conv_kind(llvm::CallingConv::ID id);
        static std::string get_visibility_string(llvm::GlobalValue::VisibilityTypes gv_ty);
        static std::string get_linkage_string(llvm::GlobalValue::LinkageTypes gv_ty);
        static std::string get_mode_string(llvm::GlobalValue::ThreadLocalMode gv_ty);
        std::string get_name();
        void get_function_names(char * parsed_domain, char * parsed_relation);
        void buid_controlflow_rels();
        void get_types(char * parsed_domain, char * parsed_relation);
        void get_global_var(char * parsed_domain, char * parsed_relation);
        void get_aliases(char * parsed_domain, char * parsed_relation);
        void get_functions(char * parsed_domain, char * parsed_relation);
        void parse_insts();
        void get_terminate_insts(char * parsed_domain, char * parsed_relation);
        void get_binary_insts(char * parsed_domain, char * parsed_relation);
        void get_vector_insts(char * parsed_domain, char * parsed_relation);
        void get_aggregate_insts(char * parsed_domain, char * parsed_relation);
        void get_memory_insts(char * parsed_domain, char * parsed_relation);
        void get_conversion_insts(char * parsed_domain, char * parsed_relation);
        void get_other_insts(char * parsed_domain, char * parsed_relation);

        // TODO: traverse the module, generating doms&rels
    public:
        ProgramDom dom_B {"B", "basic blocks"};
        ProgramDom dom_P {"P", "instructions"};
        ProgramDom dom_T {"T", "llvm types"};
        ProgramRel rel_basicblock_entry;
        ProgramRel rel_basicblock_exit;
        ProgramRel rel_basicblock_pred;
        ProgramRel rel_instruction_basicblock;
        ProgramRel rel_instruction_next;
    };
}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_H
