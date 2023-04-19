//
// Created by Yifan Chen on 2023/1/12.
//
// Contributors: Yifan Chen, Tianyu Zhang

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_H

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

namespace tea {
    class IRManager {
    public:
        static IRManager* createFromFile(const std::string& filename, llvm::SMDiagnostic & diag, llvm::LLVMContext & ctx) {
            auto mod = llvm::parseIRFile(filename, diag, ctx);
            if (mod == nullptr) {
                std::cerr << "IRManager: failed to read from " << filename << ":" << std::endl
                    << diag.getMessage().str() << std::endl;
                return nullptr;
            }
            return new IRManager(filename, std::move(mod));
        }
        IRManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        std::string get_name();
        // TODO: get analysis infos
        inline void build_doms() {
            collect_element_maps();
            for (auto & bb_pair : rev_bb_map)
                dom_B.add(bb_pair.second);
            for (auto & inst_pair : rev_inst_map)
                dom_P.add(inst_pair.second);
            for (auto & rev_type_pair : rev_type_map)
                dom_T.add(rev_type_pair.second);
            for (auto & func_pair : rev_func_map)
                dom_M.add(func_pair.second);
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

    private:
        std::string name;
        std::unique_ptr<llvm::Module> module;

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

        static std::string get_ordering_kind(llvm::AtomicOrdering ao);
        static std::string get_conv_kind(llvm::CallingConv::ID id);
        static std::string get_visibility_string(llvm::GlobalValue::VisibilityTypes gv_ty);
        static std::string get_linkage_string(llvm::GlobalValue::LinkageTypes gv_ty);
        static std::string get_mode_string(llvm::GlobalValue::ThreadLocalMode gv_ty);

    public:
        ProgramDom dom_B {"B", "basic blocks"};
        ProgramDom dom_P {"P", "instructions"};
        ProgramDom dom_T {"T", "llvm types"};
        ProgramDom dom_M {"M", "functions"};
        ProgramDom dom_C {"C", "constants"};
        ProgramDom dom_Z {"Z", "cardinals"};
        ProgramDom dom_ORD{"ORD", "atomic orderings"};
        ProgramDom dom_AS {"AS", "address space"};
        // control flow
        ProgramRel<2> rel_basicblock_pred{"basicblock_pred", {"B", "B"}, "basicblock_pred(bb_pred:B, bb_next:B)"};
        ProgramRel<2> rel_basicblock_entry{"basicblock_entry", {"B", "P"}, "basicblock_entry(bb:B, entry_inst:P)"};
        ProgramRel<2> rel_basicblock_exit{"basicblock_exit", {"B", "P"}, "basicblock_exit(bb:B, exit_inst:P)"};
        ProgramRel<2> rel_instruction_basicblock{"instruction_basicblcok", {"P", "B"}, "instruction_basicblock(inst:P, bb:B), an instruction `inst` belongs to a basicblock `bb`"};
        ProgramRel<2> rel_instruction_next{"instruction_next", {"P", "P"}, "instruction_next(inst:P, next:P)"};
        // types
        ProgramRel<1> rel_void_type{"void_type", {"T"}};
        ProgramRel<1> rel_fn_type{"fn_type", {"T"}};
        ProgramRel<1> rel_fn_type_varargs{"fn_type_varargs", {"T"}, "fn_type_varargs(ty:T), this function type `ty` can accept variable arguments"};
        ProgramRel<2> rel_fn_type_return{"fn_type_return", {"T", "T"}, "fn_type_return(fn_ty:T, ret_ty:T), this function type `fn_ty` has return type `ret_ty`"};
        ProgramRel<2> rel_fn_type_nparams{"fn_type_nparams", {"T", "Z"}, "fn_type_nparams(fn_ty:T, n:Z), this function type `fn_ty` has `n` parameters"};
        ProgramRel<3> rel_fn_type_param{"fn_type_param", {"T", "Z", "T"}, "fn_type_param(fn_ty:T, i:Z, param_ty:T), the `i`-th parameter of function type `fn_ty` has type `param_ty`"};
        ProgramRel<1> rel_integer_type{"fn_integer_type", {"T"}};
        ProgramRel<1> rel_floatingpoint_type{"floatingpoint_type", {"T"}};
        ProgramRel<1> rel_pointer_type{"pointer_type", {"T"}};
        ProgramRel<1> rel_pointer_type_opaque{"pointer_type_opaque", {"T"}, "pointer_type_opaque(ty:T), the pointer type `ty` is opaque."};
        ProgramRel<2> rel_pointer_type_component{"pointer_type_component", {"T", "T"}, "pointer_type_component(ty:T, pointee_ty:T)"}; // Warning: as of LLVM >= 15, typed-pointers are deprecated
        ProgramRel<2> rel_pointer_type_addrspace{"pointer_type_addrspace", {"T", "AS"}};
        ProgramRel<1> rel_vector_type{"vector_type", {"T"}};
        ProgramRel<2> rel_vector_type_size{"vector_type_size", {"T", "C"}, "vector_type_size(ty:T, size:C), a fixed-length vector type `ty` has length `size`"};
        ProgramRel<2> rel_vector_type_min_size{"vector_type_min_size", {"T", "C"}, "vector_type_min_size(ty:T, min_size:C), a scalable vector type `ty` has minimum length `min_size`"}; // TODO: learn more about scalable vector
        ProgramRel<2> rel_vector_type_component{"vector_type_component", {"T", "T"}, "vector_type_component(ty:T, comp_ty:T)"};
        ProgramRel<1> rel_array_type{"array_type", {"T"}};
        ProgramRel<2> rel_array_type_size{"array_type_size", {"T", "C"}};
        ProgramRel<2> rel_array_type_component{"array_type_component", {"T, T"}, "array_type_component(ty:T, comp_ty:T)"};
        ProgramRel<1> rel_struct_type{"struct_type", {"T"}};
        ProgramRel<2> rel_struct_type_name{"struct_type_name", {"T", "AS"}, "struct_type_name(ty:T, name:AS), a struct type my have a name"};
        ProgramRel<1> rel_opaque_struct_type{"opaque_struct_type", {"T"}, "opaque_struct_type(ty:T), a struct type may be opaque"};
        ProgramRel<2> rel_struct_type_nfields{"struct_type_nfields", {"T", "Z"}, "struct_type_nfields(ty:T, n:Z), a struct type `ty` has `n` fields"};
        ProgramRel<3> rel_struct_type_field{"struct_type_field", {"T", "Z","T"}, "struct_type_field(ty:T, i:Z, f_ty:T)"};
        ProgramRel<1> rel_label{"label", {"T"}};
        ProgramRel<1> rel_token{"token", {"T"}};
        ProgramRel<1> rel_metadata{"metadata", {"T"}};
        ProgramRel<1> rel_x86mmx{"x86mmx", {"T"}};
        ProgramRel<1> rel_x86amx{"x86amx", {"T"}};
        // variables
        ProgramRel<2> rel_variable_type{"variable_type", {"V", "T"}};
        ProgramRel<2> rel_variable_const_int{"variable_const_int", {"V", "C"}};
        ProgramRel<2> rel_variable_const_fp{"variable_const_fp", {"V", "C"}};
        ProgramRel<1> rel_variable_const_ptr_null{"variable_const_ptr_null", {"V"}};
        ProgramRel<1> rel_variable_const_token_none{"variable_const_token_none", {"V"}};
        ProgramRel<1> rel_variable_const_struct{"variable_const_struct", {"V"}};
        ProgramRel<2> rel_variable_const_struct_nfields{"variable_const_struct_nfileds", {"V", "Z"}};
        ProgramRel<3> rel_variable_const_struct_field{"variable_const_struct_filed", {"V", "Z", "V"}};
        ProgramRel<1> rel_variable_const_array{"variable_const_array", {"V"}};
        ProgramRel<2> rel_variable_const_array_len{"variable_const_array_len", {"V", "C"}};
        ProgramRel<2> rel_variable_const_array_elem{"variable_const_array_elem", {"V", "V"}};
        ProgramRel<1> rel_variable_const_vector{"variable_const_vector", {"V"}};
        ProgramRel<2> rel_variable_const_vector_len{"variable_const_vector_len", {"V", "C"}};
        ProgramRel<2> rel_variable_const_vector_elem{"variable_const_vector_elem", {"V", "V"}};
        ProgramRel<1> rel_variable_const_aggzero{"variable_const_aggzero", {"V"}};
        ProgramRel<1> rel_variable_undef{"variable_undef", {"V"}};
        ProgramRel<1> rel_variable_undef_poison{"variable_undef_poison", {"V"}};
        ProgramRel<1> rel_variable_global{"variable_global", {"V"}};
        ProgramRel<2> rel_variable_global_type{"variable_global_type", {"V", "T"}};
        ProgramRel<2> rel_variable_global_linkage{"variable_global_linkage", {"V", "L"}};
        ProgramRel<2> rel_variable_global_align{"variable_global_align", {"V", "C"}};
        ProgramRel<2> rel_variable_global_init{"variable_global_init", {"V", "V"}};
        ProgramRel<1> rel_variable_alias{"variable_alias", {"V"}};
        ProgramRel<2> rel_variable_alias_aliasee{"variable_alias_aliasee", {"V", "V"}};
        ProgramRel<1> rel_variable_ifunc{"variable_ifunc", {"V"}};
        ProgramRel<2> rel_variable_ifunc_resolver{"variable_ifunc_resolver", {"V", "M"}};
        ProgramRel<2> rel_variable_func{"variable_func", {"V", "M"}};
        ProgramRel<2> rel_variable_blockaddr{"variable_blockaddr", {"V", "B"}};
        ProgramRel<1> rel_variable_constexpr{"variable_constexpr", {"V"}};
        ProgramRel<2> rel_operation_unary_fneg              {"operation_unary_fneg",            {"V", "V"},             "operation_unary_fneg(res:V, inner:V)"};
        ProgramRel<3> rel_operation_binary_add              {"operation_binary_add",            {"V", "V", "V"},        "operation_binary_add(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_fadd             {"operation_binary_fadd",           {"V", "V", "V"},        "operation_binary_fadd(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_sub              {"operation_binary_sub",            {"V", "V", "V"},        "operation_binary_sub(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_fsub             {"operation_binary_fsub",           {"V", "V", "V"},        "operation_binary_fsub(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_mul              {"operation_binary_mul",            {"V", "V", "V"},        "operation_binary_mul(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_fmul             {"operation_binary_fmul",           {"V", "V", "V"},        "operation_binary_fmul(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_udiv             {"operation_binary_udiv",           {"V", "V", "V"},        "operation_binary_udiv(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_sdiv             {"operation_binary_sdiv",           {"V", "V", "V"},        "operation_binary_sdiv(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_fdiv             {"operation_binary_fdiv",           {"V", "V", "V"},        "operation_binary_fdiv(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_urem             {"operation_binary_urem",           {"V", "V", "V"},        "operation_binary_urem(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_srem             {"operation_binary_srem",           {"V", "V", "V"},        "operation_binary_srem(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_frem             {"operation_binary_frem",           {"V", "V", "V"},        "operation_binary_frem(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_shl              {"operation_binary_shl",            {"V", "V", "V"},        "operation_binary_shl(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_lshr             {"operation_binary_lshr",           {"V", "V", "V"},        "operation_binary_lshr(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_ashr             {"operation_binary_ashr",           {"V", "V", "V"},        "operation_binary_ashr(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_and              {"operation_binary_and",            {"V", "V", "V"},        "operation_binary_and(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_or               {"operation_binary_or",             {"V", "V", "V"},        "operation_binary_or(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_binary_xor              {"operation_binary_xor",            {"V", "V", "V"},        "operation_binary_xor(res:V, left:V, right:V)"};
        ProgramRel<3> rel_operation_extractelement          {"operation_extractelement",        {"V", "V", "V"},        "operation_extractelement(inst:P, res:V, base:V, idx:V)"};
        ProgramRel<4> rel_operation_insertelement           {"operation_insertelement",         {"V", "V", "V", "V"},   "operation_insertelement_expr(res:V, base:V, elem:V, idx:V)"};
        ProgramRel<4> rel_operation_shufflevector           {"operation_shufflevector",         {"V", "V", "V", "V"}};
        ProgramRel<2> rel_operation_extractvalue_base       {"operation_extractvalue_base",     {"V", "V"}};
        ProgramRel<2> rel_operation_extractvalue_nindices   {"operation_extractvalue_nindices", {"V", "Z"}};
        ProgramRel<3> rel_operation_extractvalue_index      {"operation_extractvalue_index",    {"V", "Z", "Z"},        "operation_extractvalue_index(res:V, i:Z, id:Z)"};
        ProgramRel<2> rel_operation_insertvalue_base        {"operation_insertvalue_base",      {"V", "V"}};
        ProgramRel<2> rel_operation_insertvalue_elem        {"operation_insertvalue_elem",      {"V", "V"}};
        ProgramRel<2> rel_operation_insertvalue_nindices    {"operation_insertvalue_nindices",  {"V", "Z"}};
        ProgramRel<3> rel_operation_insertvalue_index       {"operation_insertvalue_index",     {"V", "Z", "Z"},        "operation_insertvalue_index(res:V, i:Z, id:Z)"};
        ProgramRel<1> rel_operation_gep_inbounds            {"operation_gep_inbounds",          {"V"}};
        ProgramRel<2> rel_operation_gep_base                {"operation_gep_base",              {"V", "V"}};
        ProgramRel<2> rel_operation_gep_type                {"operation_gep_type",              {"V", "T"}};
        ProgramRel<2> rel_operation_gep_nindices            {"operation_gep_nindices",          {"V", "Z"}};
        ProgramRel<3> rel_operation_gep_index_field         {"operation_gep_index_field",       {"V", "Z", "Z"}};
        ProgramRel<3> rel_operation_gep_index_offset        {"operation_gep_index_offset",      {"V", "Z", "V"}};
        ProgramRel<4> rel_operation_cast_trunc              {"operation_cast_trunc",            {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_zext               {"operation_cast_zext",             {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_sext               {"operation_cast_sext",             {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_fptoui             {"operation_cast_fptoui",           {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_fptosi             {"operation_cast_fptosi",           {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_uitofp             {"operation_cast_uitofp",           {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_sitofp             {"operation_cast_sitofp",           {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_fptrunc            {"operation_cast_fptrunc",          {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_fpext              {"operation_cast_fpext",            {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_ptrtoint           {"operation_cast_ptrtoint",         {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_inttoptr           {"operation_cast_inttoptr",         {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_bitcast            {"operation_cast_bitcast",          {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<4> rel_operation_cast_addrspacecast      {"operation_cast_addrspacecast",    {"V", "V", "T", "T"},   "operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)"};
        ProgramRel<3> rel_operation_icmp_eq                 {"operation_icmp_eq",               {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_ne                 {"operation_icmp_ne",               {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_ugt                {"operation_icmp_ugt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_uge                {"operation_icmp_uge",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_ult                {"operation_icmp_ult",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_ule                {"operation_icmp_ule",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_sgt                {"operation_icmp_sgt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_sge                {"operation_icmp_sge",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_slt                {"operation_icmp_slt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_icmp_sle                {"operation_icmp_sle",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_false              {"operation_fcmp_false",            {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_oeq                {"operation_fcmp_oeq",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ogt                {"operation_fcmp_ogt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_oge                {"operation_fcmp_oge",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_olt                {"operation_fcmp_olt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ole                {"operation_fcmp_ole",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_one                {"operation_fcmp_one",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ord                {"operation_fcmp_ord",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ueq                {"operation_fcmp_ueq",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ugt                {"operation_fcmp_ugt",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_uge                {"operation_fcmp_uge",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ult                {"operation_fcmp_ult",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_ule                {"operation_fcmp_ule",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_une                {"operation_fcmp_une",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_uno                {"operation_fcmp_uno",              {"V", "V", "V"}};
        ProgramRel<3> rel_operation_fcmp_true               {"operation_fcmp_true",             {"V", "V", "V"}};

        // functions
        ProgramRel<1> rel_main_function{"main_function", {"M"}};
        ProgramRel<2> rel_function_type{"function_type", {"M", "T"}};
        ProgramRel<2> rel_function_name{"function_name", {"M", "V"}};
        ProgramRel<2> rel_function_linkage{"function_linkage", {"M", "L"}};
        ProgramRel<2> rel_function_nparams{"function_nparams", {"M", "Z"}};
        ProgramRel<3> rel_function_param{"function_param", {"M", "Z", "V"}};
        ProgramRel<1> rel_function_extern{"function_extern", {"M"}};
        ProgramRel<2> rel_function_entry{"function_entry", {"M", "B"}};
//        ProgramRel rel_function_visibility;
//        ProgramRel rel_function_calling_convention;
//        ProgramRel rel_function_unnamed_addr;
//        ProgramRel rel_function_alignment;
//        ProgramRel rel_function_gc;
//        ProgramRel rel_function_pers_fn;
//        ProgramRel rel_function_attribute;
//        ProgramRel rel_function_return_attribute;
//        ProgramRel rel_function_param_attribute;
//        ProgramRel rel_function_section;
        // instructions
        ProgramRel<1> rel_instruction_ret{"instruction_ret", {"P"}};
        ProgramRel<2> rel_instruction_ret_var{"instruction_ret_val", {"P", "V"},"instruction_ret_val(inst:P, v:V), instruction `inst` returns value of variable `v`"};
        ProgramRel<1> rel_instruction_ret_void{"instruction_ret_void", {"P"}, "instruction_ret_void(inst:P), instruction `inst` has no return value"};
        ProgramRel<1> rel_instruction_br{"instruction_br", {"P"}};
        ProgramRel<1> rel_instruction_br_cond{"instruction_br_cond", {"P"},"instruction_br_cond(inst:P), instruction `inst` is a conditional branch"};
        ProgramRel<2> rel_instruction_br_cond_val{"instruction_br_cond_var", {"P", "V"}};
        ProgramRel<2> rel_instruction_br_cond_iftrue{"instruction_br_cond_iftrue", {"P", "B"}};
        ProgramRel<2> rel_instruction_br_cond_iffalse{"instruction_br_cond_iffalse", {"P", "B"}};
        ProgramRel<1> rel_instruction_br_uncond{"instruction_br_uncond", {"P"}, "instruction_br_uncond(inst:P), instruction `inst` is an unconditional branch"};
        ProgramRel<2> rel_instruction_br_uncond_goto{"instruction_br_uncond_goto", {"P", "B"}};
        ProgramRel<1> rel_instruction_switch{"instruction_switch", {"P"}};
        ProgramRel<2> rel_instruction_switch_var{"instruction_switch_var", {"P", "V"}};
        ProgramRel<2> rel_instruction_switch_default{"instruction_switch_default", {"P", "B"}};
        ProgramRel<2> rel_instruction_switch_ncases{"instruction_switch_ncases", {"P", "Z"}};
        ProgramRel<3> rel_instruction_switch_case_val{"instruction_switch_case_val", {"P", "Z", "C"}};
        ProgramRel<3> rel_instruction_switch_case_goto{"instruction_switch_case_goto", {"P", "Z", "B"}};
        ProgramRel<1> rel_instruction_indirectbr{"instruction_indirectbr", {"P"}};
        ProgramRel<2> rel_instruction_indirectbr_addr{"instruction_indirectbr_addr", {"P", "V"}};
        ProgramRel<2> rel_instruction_indirectbr_nlabels{"instruction_indirectbr_nlabels", {"P", "Z"}};
        ProgramRel<3> rel_instruction_indirectbr_label{"instruction_indirectbr_label", {"P", "Z", "B"}};
        ProgramRel<1> rel_instruction_invk{"instruction_invk", {"P"}};
        ProgramRel<1> rel_instruction_invk_void{"instruction_invk_void", {"P"}};
        ProgramRel<2> rel_instruction_invk_res{"instruction_invk_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_invk_static{"instruction_invk_static", {"P", "M"}};
        ProgramRel<2> rel_instruction_invk_dynamic{"instruction_invk_dynamic", {"P", "V"}};
        ProgramRel<2> rel_instruction_invk_nargs{"instruction_invk_nargs", {"P", "Z"}};
        ProgramRel<3> rel_instruction_invk_arg{"instruction_invk_arg", {"P", "Z", "V"}};
        ProgramRel<2> rel_instruction_invk_normaldest{"instruction_invk_normaldest", {"P", "B"}};
        ProgramRel<2> rel_instruction_invk_exceptiondest{"instruction_invk_exceptiondest", {"P", "B"}};
        ProgramRel<1> rel_instruction_callbr{"instruction_callbr", {"P"}};
        ProgramRel<1> rel_instruction_callbr_void{"instruction_callbr_void", {"P"}};
        ProgramRel<2> rel_instruction_callbr_res{"instruction_callbr_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_callbr_static{"instruction_callbr_static", {"P", "M"}};
        ProgramRel<2> rel_instruction_callbr_dynamic{"instruction_callbr_dynamic", {"P", "V"}};
        ProgramRel<2> rel_instruction_callbr_nargs{"instruction_callbr_nargs", {"P", "Z"}};
        ProgramRel<3> rel_instruction_callbr_arg{"instruction_callbr_arg", {"P", "Z", "V"}};
        ProgramRel<2> rel_instruction_callbr_fallthrough{"instruction_callbr_fallthrough", {"P", "B"}};
        ProgramRel<2> rel_instruction_callbr_indirect{"instruction_callbr_indirect", {"P", "B"}};
        ProgramRel<1> rel_instruction_resume{"instruction_resume", {"P"}};
        ProgramRel<2> rel_instruction_resume_var{"instruction_resume_var", {"P", "V"}};
        ProgramRel<1> rel_instruction_catchswitch{"instruction_catchswitch", {"P"}};
        ProgramRel<2> rel_instruction_catchswitch_res{"instruction_catchswitch_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_catchswitch_within{"instruction_catchswitch_within", {"P", "V"}};
        ProgramRel<2> rel_instruction_catchswitch_handler{"instruction_catchswitch_handler", {"P", "B"}};
        ProgramRel<2> rel_instruction_catchswitch_unwindlabel{"instruction_catchswitch_unwindlabel", {"P", "B"}};
        ProgramRel<1> rel_instruction_catchswitch_unwindcaller{"instruction_catchswitch_unwindcaller", {"P"}};
        ProgramRel<1> rel_instruction_catchret{"instruction_catchret", {"P"}};
        ProgramRel<3> rel_instruction_catchret_fromto{"instruction_catchret_fromto", {"P", "V", "B"}};
        ProgramRel<1> rel_instruction_cleanupret{"instruction_cleanupret", {"P"}};
        ProgramRel<2> rel_instruction_cleanupret_from{"instruction_cleanupret_from", {"P", "V"}};
        ProgramRel<2> rel_instruction_cleanupret_unwindlabel{"instruction_cleanupret", {"P", "B"}};
        ProgramRel<1> rel_instruction_cleanupret_unwindcaller{"instruction_cleanupret_unwindcaller", {"P"}};
        ProgramRel<1> rel_instruction_unreachable{"instruction_unreachable", {"P"}};
//        ProgramRel rel_instruction_unhandled;
        ProgramRel<1> rel_instruction_alloca{"instruction_alloca", {"P"}};
        ProgramRel<2> rel_instruction_alloca_res{"instruction_alloca_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_alloca_type{"instruction_alloca_type", {"P", "T"}};
        ProgramRel<2> rel_instruction_alloca_size{"instruction_alloca_size", {"P", "V"}};
        ProgramRel<2> rel_instruction_alloca_align{"instruction_alloca_align", {"P", "C"}};
        ProgramRel<2> rel_instruction_alloca_addrspace{"instruction_alloca_addrspace", {"P", "AS"}};
        ProgramRel<1> rel_instruction_load{"instruction_load", {"P"}};
        ProgramRel<1> rel_instruction_load_volatile{"instruction_load_volatile", {"P"}};
        ProgramRel<2> rel_instruction_load_ordering{"instruction_load_ordering", {"P", "ORD"}};
        ProgramRel<2> rel_instruction_load_res{"instruction_load_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_load_ptr{"instruction_load_ptr", {"P", "V"}};
        ProgramRel<2> rel_instruction_load_align{"instruction_load_align", {"P", "C"}};
        ProgramRel<1> rel_instruction_store{"instruction_store", {"P"}};
        ProgramRel<1> rel_instruction_store_volatile{"instruction_store_volatile", {"P"}};
        ProgramRel<2> rel_instruction_store_ordering{"instruction_store_ordering", {"P", "ORD"}};
        ProgramRel<2> rel_instruction_store_var{"instruction_store_var", {"P", "V"}};
        ProgramRel<2> rel_instruction_store_addr{"instruction_store_addr", {"P", "V"}};
        ProgramRel<2> rel_instruction_store_align{"instruction_store_align", {"P", "C"}};
        ProgramRel<1> rel_instruction_fence{"instruction_fence", {"P"}};
        ProgramRel<2> rel_instruction_fence_ordering{"instruction_fence_ordering", {"P", "ORD"}};
        ProgramRel<1> rel_instruction_cmpxchg{"instruction_cmpxchg", {"P"}};
        ProgramRel<1> rel_instruction_cmpxchg_weak{"instruction_cmpxchg_weak", {"P"}};
        ProgramRel<1> rel_instruction_cmpxchg_strong{"instruction_cmpxchg_strong", {"P"}};
        ProgramRel<1> rel_instruction_cmpxchg_volatile{"instruction_cmpxchg_volatile", {"P"}};
        ProgramRel<2> rel_instruction_cmpxchg_succ_ordering{"instruction_cmpxchg_succ_ordering", {"P", "ORD"}};
        ProgramRel<2> rel_instruction_cmpxchg_fail_ordering{"instruction_cmpxchg_fail_ordering", {"P", "ORD"}};
        ProgramRel<2> rel_instruction_cmpxchg_addr{"instruction_cmpxchg_addr", {"P", "V"}};
        ProgramRel<2> rel_instruction_cmpxchg_cmp{"instruction_cmpxchg_cmp", {"P", "V"}};
        ProgramRel<2> rel_instruction_cmpxchg_new{"instruction_cmpxchg_new", {"P", "V"}};
        ProgramRel<1> rel_instruction_atomicrmw{"instruction_atomicrmw", {"P"}};
        ProgramRel<1> rel_instruction_atomicrmw_volatile{"instruction_atomicrmw_volatile", {"P"}};
        ProgramRel<2> rel_instruction_atomicrmw_ordering{"instruction_atomicrmw_ordering", {"P", "ORD"}};
        ProgramRel<3> rel_instruction_atomicrmw_xchg{"instruction_atomicrmw_xchg", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_add{"instruction_atomicrmw_add", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_sub{"instruction_atomicrmw_sub", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_and{"instruction_atomicrmw_and", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_nand{"instruction_atomicrmw_nand", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_or{"instruction_atomicrmw_or", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_xor{"instruction_atomicrmw_xor", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_max{"instruction_atomicrmw_max", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_min{"instruction_atomicrmw_min", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_umax{"instruction_atomicrmw_umax", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_umin{"instruction_atomicrmw_umin", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_fadd{"instruction_atomicrmw_fadd", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_fsub{"instruction_atomicrmw_fsub", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_fmax{"instruction_atomicrmw_fmax", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_fmin{"instruction_atomicrmw_fmin", {"P", "V", "V"}};
        ProgramRel<3> rel_instruction_atomicrmw_bad{"instruction_atomicrmw_bad", {"P", "V", "V"}};
        ProgramRel<1> rel_instruction_phi{"instruction_phi", {"P"}};
        ProgramRel<2> rel_instruction_phi_res{"instruction_phi_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_phi_npairs{"instruction_phi_npairs", {"P", "Z"}};
        ProgramRel<4> rel_instruction_phi_pair{"instruction_phi_pair", {"P", "Z", "V", "B"}};
        ProgramRel<1> rel_instruction_select{"instruction_select", {"P"}};
        ProgramRel<5> rel_instruction_select_expr{"instruction_select_expr", {"P", "V", "V", "V", "V"}};
        ProgramRel<1> rel_instruction_freeze{"instruction_freeze", {"P"}};
        ProgramRel<2> rel_instruction_freeze_var{"instruction_freeze_var", {"P", "V"}};
        ProgramRel<1> rel_instruction_call{"instruction_call", {"P"}};
        ProgramRel<1> rel_instruction_call_void{"instruction_call_void", {"P"}};
        ProgramRel<2> rel_instruction_call_res{"instruction_call_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_call_static{"instruction_call_static", {"P", "M"}};
        ProgramRel<2> rel_instruction_call_dynamic{"instruction_call_dynamic", {"P", "V"}};
        ProgramRel<2> rel_instruction_call_nargs{"instruction_call_nargs", {"P", "Z"}};
        ProgramRel<3> rel_instruction_call_arg{"instruction_call_arg", {"P", "Z", "V"}};
        ProgramRel<1> rel_instruction_vaarg{"instruction_vaarg", {"P"}};
        ProgramRel<3> rel_instruction_vaarg_expr{"instruction_vaarg_expr", {"P", "V", "V"}};
        ProgramRel<1> rel_instruction_landingpad{"instruction_landingpad", {"P"}};
        ProgramRel<2> rel_instruction_landingpad_res{"instruction_landingpad_res", {"P", "V"}};
        ProgramRel<1> rel_instruction_landingpad_cleanup{"instruction_landingpad_cleanup", {"P"}};
        ProgramRel<1> rel_instruction_landingpad_nocleanup{"instruction_landingpad_nocleanup", {"P"}};
        ProgramRel<2> rel_instruction_landingpad_nclses{"instruction_landingpad_nclses", {"P", "Z"}};
        ProgramRel<3> rel_instruction_landingpad_cls_catch{"instruction_landingpad_cls_catch", {"P", "Z", "V"}};
        ProgramRel<3> rel_instruction_landingpad_cls_filter{"instruction_landingpad_cls_filter", {"P", "Z", "V"}};
        ProgramRel<1> rel_instruction_catchpad{"instruction_catchpad", {"P"}};
        ProgramRel<2> rel_instruction_catchpad_res{"instruction_catchpad_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_catchpad_within{"instruction_catchpad_within", {"P", "V"}};
        ProgramRel<2> rel_instruction_catchpad_nargs{"instruction_catchpad_nargs", {"P", "Z"}};
        ProgramRel<3> rel_instruction_catchpad_arg{"instruction_catchpad_arg", {"P", "Z", "V"}};
        ProgramRel<1> rel_instruction_cleanuppad{"instruction_cleanuppad", {"P"}};
        ProgramRel<2> rel_instruction_cleanuppad_res{"instruction_cleanuppad_res", {"P", "V"}};
        ProgramRel<2> rel_instruction_cleanuppad_within{"instruction_cleanuppad_within", {"P", "B"}};
        ProgramRel<2> rel_instruction_cleanuppad_nargs{"instruction_cleanuppad_nargs", {"P", "Z"}};
        ProgramRel<3> rel_instruction_cleanuppad_arg{"instruction_cleanuppad_arg", {"P", "Z", "V"}};
        ProgramRel<1> rel_instruction_op{"instruction_op", {"P"}};
        ProgramRel<2> rel_instruction_op_res{"instruction_op_res", {"P", "V"}};
    };
}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_H
