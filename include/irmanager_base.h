//
// Created by Yifan Chen on 2023/1/12.
//
// Contributors: Yifan Chen, Tianyu Zhang

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_BASE_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_BASE_H

#include "trgt.h"

#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Constants.h>
#include <map>
#include <set>
#include <string>
#include <iostream>
#include <utility>

namespace tea {
    typedef std::pair<std::vector<std::string>, std::string> RelInfo;
    class IRManager {
    public:
        inline static std::string ANALYSIS = "irmanager";
        static IRManager* createFromFile(const std::string& filename, llvm::SMDiagnostic & diag, llvm::LLVMContext & ctx, const std::string & workdir) {
            auto mod = llvm::parseIRFile(filename, diag, ctx);
            if (mod == nullptr) {
                std::cerr << "IRManager: failed to read from " << filename << ":" << std::endl
                    << diag.getMessage().str() << std::endl;
                return nullptr;
            }
            return new IRManager(filename, std::move(mod), workdir);
        }

        IRManager(std::string name, std::unique_ptr<llvm::Module> mod, const std::string & workdir)
            : name(std::move(name)), module(std::move(mod)), workpath(workdir)
            {}

        ~IRManager() = default;

        std::string get_name();

        inline void build_doms() {
            collect_element_maps();
            for (auto & rev_bb_pair : rev_bb_map)
                dom_B.add(rev_bb_pair.second);
            for (auto & rev_inst_pair : rev_inst_map)
                dom_P.add(rev_inst_pair.second);
            for (auto & rev_value_pair : rev_value_map)
                dom_V.add(rev_value_pair.second);
            for (auto & rev_type_pair : rev_type_map)
                dom_T.add(rev_type_pair.second);
            for (auto & rev_func_pair : rev_func_map)
                dom_M.add(rev_func_pair.second);
            for (unsigned z = 0; z <= max_z; ++z) {
                dom_Z.add(std::to_string(z));
            }
            for (unsigned c : const_sizealign_set) {
                dom_C.add(std::to_string(c));
            }
            for (auto & const_int_pair : rev_constint_map) {
                dom_C.add(const_int_pair.second);
            }
            for (auto & const_fp_pair : rev_constfp_map) {
                dom_C.add(const_fp_pair.second);
            }
//            ProgramDom dom_ORD{"ORD", "atomic orderings"};
//            ProgramDom dom_AS {"AS", "address space"};
        }

        inline void build_rels() {
            build_type_rels();
            build_value_rels();
            build_function_rels();
            build_controlflow_rels();
            build_instruction_rels();
        }

        void save_all();

        [[nodiscard]] inline const std::string & get_dom_loc(const std::string & dom_name) {
            return dom_loc_map[dom_name];
        }

        [[nodiscard]] inline const std::string & get_rel_loc(const std::string & rel_name) {
            return rel_loc_map[rel_name];
        }

    protected:
        std::string name;
        std::unique_ptr<llvm::Module> module;
        std::filesystem::path workpath;

    private:
        /* helper functions for run analysis and generate doms and rels*/
        void collect_element_maps();
        void collect_type(llvm::Type *);
        void collect_value(llvm::Value * pVal);
        void build_type_rels();
        void build_value_rels();
        void build_function_rels();
        void build_controlflow_rels();
        void build_instruction_rels();

        void add_op_rel(llvm::Value * pRes, llvm::Instruction * pInst);
        void add_op_unary(unsigned op, llvm::Value * pRes, llvm::Value * pInner);
        void add_op_binary(unsigned op, llvm::Value * pRes, llvm::Value * pLeft, llvm::Value * pRight);
        void add_op_cast(unsigned op, llvm::Value * pRes, llvm::Value * pSrc, llvm::Type * pFromTy, llvm::Type * pToTy);
        void add_op_icmp(unsigned pred, llvm::Value * pRes, llvm::Value * pLeft, llvm::Value * pRight);
        void add_op_fcmp(unsigned pred, llvm::Value * pRes, llvm::Value * pLeft, llvm::Value * pRight);

//        static std::string get_ordering_kind(llvm::AtomicOrdering ao);
//        static std::string get_conv_kind(llvm::CallingConv::ID id);
//        static std::string get_visibility_string(llvm::GlobalValue::VisibilityTypes gv_ty);
//        static std::string get_linkage_string(llvm::GlobalValue::LinkageTypes gv_ty);
//        static std::string get_mode_string(llvm::GlobalValue::ThreadLocalMode gv_ty);

    public:
        unsigned max_z = 0;
        std::map<std::string,llvm::Type*> type_map;
        std::map<llvm::Type*, std::string> rev_type_map;
        // containing cfg index
        std::map<std::string,llvm::BasicBlock*> bb_map;
        std::map<llvm::BasicBlock*, std::string> rev_bb_map;
        std::map<std::string,llvm::Instruction*> inst_map;
        std::map<llvm::Instruction*, std::string> rev_inst_map;
        // values
        std::map<std::string, llvm::Value*> value_map;
        std::map<llvm::Value*, std::string> rev_value_map;
        // TODO: collect constants
        std::set<uint64_t> const_sizealign_set;
        std::map<llvm::ConstantInt*, std::string> rev_constint_map;
        std::map<llvm::ConstantFP*, std::string> rev_constfp_map;
        // functions
        std::map<std::string,llvm::Function*> func_map;
        std::map<llvm::Function*, std::string> rev_func_map;

        std::map<std::string, std::string> dom_loc_map;
        std::map<std::string, std::string> rel_loc_map;

    public:
#define HANDLE_PRODUCE_DOM(name, desc) ProgramDom dom_ ##name { #name, desc };
#include "irmanager_trgts.def"

#define ATTR(name, dname) &dom_ ##dname
#define HANDLE_PRODUCE_REL(name, desc, ...) ProgramRel<std::tuple_size<decltype(std::make_tuple(__VA_ARGS__))>::value> rel_ ##name { #name, { __VA_ARGS__ }, desc };
#include "irmanager_trgts.def"

        static const std::map<std::string, std::string> consumed_doms_info;
        static const std::map<std::string, RelInfo> consumed_rels_info;
        static const std::map<std::string, std::string> produced_doms_info;
        static const std::map<std::string, RelInfo> produced_rels_info;
    };
}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_BASE_H
