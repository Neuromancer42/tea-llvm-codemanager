//
// Created by Yifan Chen on 2023/1/12.
//
// Contributors: Yifan Chen, Tianyu Zhang

#include "irmanager_base.h"

using namespace tea;
using namespace std;
using namespace llvm;

const map<string, string> IRManager::consumed_doms_info = {};
const map<std::string, pair<vector<string>, string>> IRManager::consumed_rels_info = {};

const map<string, string> IRManager::produced_doms_info = {
#define HANDLE_PRODUCE_DOM(name, desc) { #name, desc },
#include "irmanager_trgts.def"
};

const map<std::string, pair<vector<string>, string>> IRManager::produced_rels_info = {
#define DOM(name) #name
#define HANDLE_PRODUCE_REL(name, desc, ...) { #name, {{ __VA_ARGS__ }, desc }},
#include "irmanager_trgts.def"
};

void IRManager::save_all() {
#define HANDLE_PRODUCE_DOM(name, desc) { std::string loc = dom_ ##name .save(workpath); dom_loc_map.emplace(#name, loc); }
#define HANDLE_PRODUCE_REL(name, desc, ...) { std::string loc = rel_ ##name .save(workpath); rel_loc_map.emplace(#name, loc); }
#include "irmanager_trgts.def"
}

void IRManager::collect_element_maps() {
    // TODO collect constants in ctx_impl?
    // TODO collect named_values in ctx_impl->ValueNames?
    for (auto & GVar : module->globals()) {
        collect_value(&GVar);
        collect_type(GVar.getValueType());
        if (GVar.hasInitializer())
            collect_value(GVar.getInitializer());
        uint64_t align = GVar.getAlign().valueOrOne().value();
        const_sizealign_set.insert(align);
    }
    // TODO: should global_alias and global_ifunc be eliminated after linking?
    for (auto & GAlias : module->getAliasList()) {
        collect_value(&GAlias);
        collect_type(GAlias.getValueType());
        if (Value * aliasee = GAlias.getAliasee())
            collect_value(aliasee);
    }
    for (auto & IFunc : module->getIFuncList()) {
        collect_value(&IFunc);
        collect_type(IFunc.getValueType());
    }
    for(auto & Func : module->functions()) {
        string func_n = Func.getName().str();
        func_map.emplace(func_n, &Func);
        rev_func_map.emplace(&Func, func_n);
        collect_value(&Func);
        collect_type(Func.getFunctionType());
        // TODO check this?
        for (auto & FUse : Func.operands()) {
            collect_value(FUse.get());
        }

        for (auto & Arg : Func.args()) {
            collect_value(&Arg);
        }

        for(BasicBlock & BB : Func) {
            string bb_n;
            {
                llvm::raw_string_ostream oss(bb_n);
                oss << func_n << '-';
                BB.printAsOperand(oss);
            }
            bb_map.emplace(bb_n, &BB);
            rev_bb_map.emplace(&BB, bb_n);
            size_t inst_cnt = 0;
            for(Instruction & Inst : BB) {
                // slightly larger than necessary, but it's ok
//                if (Inst.getNumOperands() > max_z)
//                    max_z = Inst.getNumOperands();
                if (auto * pSwitch = dyn_cast<SwitchInst>(&Inst)) {
                    unsigned num_cases = pSwitch->getNumCases();
                    if (num_cases > max_z)
                        max_z = num_cases;
                    for (auto & case_handle : pSwitch->cases()) {
                        ConstantInt * pCaseVal = case_handle.getCaseValue();
                        string val_str;
                        raw_string_ostream raw_os(val_str);
                        raw_os << pCaseVal->getValue();
                        rev_constint_map.emplace(pCaseVal, val_str);
                    }
                } else if (auto * pInBr = dyn_cast<IndirectBrInst>(&Inst)) {
                    unsigned num_labels = pInBr->getNumDestinations();
                    if (num_labels > max_z)
                        max_z = num_labels;
                } else if (auto * pInvk = dyn_cast<InvokeInst>(&Inst)) {
                    unsigned num_args = pInvk->arg_size();
                    if (num_args > max_z)
                        max_z = num_args;
                } else if (auto * pCallBr = dyn_cast<CallBrInst>(&Inst)) {
                    unsigned num_args = pCallBr->arg_size();
                    if (num_args > max_z)
                        max_z = num_args;
                } else if (auto * pExtVal = dyn_cast<ExtractValueInst>(&Inst)) {
                    unsigned num_indices = pExtVal->getNumIndices();
                    if (num_indices > max_z)
                        max_z = num_indices;
                } else if (auto * pInsVal = dyn_cast<InsertValueInst>(&Inst)) {
                    unsigned num_indices = pInsVal->getNumIndices();
                    if (num_indices > max_z)
                        max_z = num_indices;
                } else if (auto * pAlloca = dyn_cast<AllocaInst>(&Inst)) {
                    Align align = pAlloca->getAlign();
                    uint64_t align_int = align.value();
                    const_sizealign_set.insert(align_int);
                    collect_type(pAlloca->getAllocatedType());
                } else if (auto * pLoad = dyn_cast<LoadInst>(&Inst)) {
                    Align align = pLoad->getAlign();
                    uint64_t align_int = align.value();
                    const_sizealign_set.insert(align_int);
                } else if (auto * pStore = dyn_cast<StoreInst>(&Inst)) {
                    Align align = pStore->getAlign();
                    uint64_t align_int = align.value();
                    const_sizealign_set.insert(align_int);
                } else if (auto * pGep = dyn_cast<GetElementPtrInst>(&Inst)) {
                    unsigned num_indices = pGep->getNumIndices();
                    if (num_indices > max_z)
                        max_z = num_indices;
                    collect_type(pGep->getSourceElementType());
                } else if (auto * pPhi = dyn_cast<PHINode>(&Inst)) {
                    unsigned num_pairs = pPhi->getNumIncomingValues();
                    if (num_pairs > max_z)
                        max_z = num_pairs;
                } else if (auto * pCall = dyn_cast<CallInst>(&Inst)) {
                    unsigned num_args = pCall->arg_size();
                    if (num_args > max_z)
                        max_z = num_args;
                } else if (auto * pLandingPad = dyn_cast<LandingPadInst>(&Inst)) {
                    unsigned num_clses = pLandingPad->getNumClauses();
                    if (num_clses > max_z)
                        max_z = num_clses;
                } else if (auto * pCatchPad = dyn_cast<CatchPadInst>(&Inst)) {
                    unsigned num_clses = pCatchPad->getNumArgOperands();
                    if (num_clses > max_z)
                        max_z = num_clses;
                } else if (auto * pCleanupPad = dyn_cast<CleanupPadInst>(&Inst)) {
                    unsigned num_args = pCleanupPad->getNumArgOperands();
                    if (num_args > max_z)
                        max_z = num_args;
                }
                if (Inst.hasName() || !Inst.getType()->isVoidTy()) {
                    collect_value(&Inst);
                }
                unsigned op_num = Inst.getNumOperands();
                for(unsigned i = 0; i < op_num; i++){
                    llvm::Value & Op = *Inst.getOperand(i);
                    collect_value(&Op);
                }
                string inst_n = bb_n + "-" + to_string(inst_cnt);
                inst_map.emplace(inst_n,&Inst);
                rev_inst_map.emplace(&Inst, inst_n);
                inst_cnt++;
            }
        }
    }

    assert(rev_type_map.size() == type_map.size() && "duplicate type namings exist");
    assert(rev_value_map.size() == value_map.size() && "duplicate value namings exist");
    assert(rev_bb_map.size() == bb_map.size() && "duplicate bb namings exist");
    assert(rev_inst_map.size() == inst_map.size() && "duplicate inst namings exist");
    assert(rev_func_map.size() == func_map.size() && "duplicate func namings exist");
}

void IRManager::collect_type(llvm::Type * pTy) {
    if (rev_type_map.find(pTy) != rev_type_map.end())
        return;
    string ty_name;
    raw_string_ostream raw_os(ty_name);
    pTy->print(raw_os, true, true);
    rev_type_map.emplace(pTy, ty_name);
    type_map.emplace(ty_name, pTy);
    if (auto * pFnTy = dyn_cast<FunctionType>(pTy)) {
        unsigned num_args = pFnTy->getNumParams();
        if (num_args > max_z)
            max_z = num_args;
    } else if (auto * pStTy = dyn_cast<StructType>(pTy)) {
        unsigned num_fields = pStTy->getNumElements();
        if (num_fields > max_z)
            max_z = num_fields;
    } else if (auto * pFixVecTy = dyn_cast<FixedVectorType>(pTy)) {
        uint64_t vec_len = pFixVecTy->getNumElements();
        const_sizealign_set.insert(vec_len);
    } else if (auto * pScaleVecTy = dyn_cast<ScalableVectorType>(pTy)) {
        uint64_t min_vec_len = pScaleVecTy->getMinNumElements();
        const_sizealign_set.insert(min_vec_len);
    } else if (auto * pArrTy = dyn_cast<ArrayType>(pTy)) {
        uint64_t arr_len = pArrTy->getNumElements();
        const_sizealign_set.insert(arr_len);
    }
    for (auto * sub_ty : pTy->subtypes()) {
        collect_type(sub_ty);
    }
}

void IRManager::collect_value(llvm::Value * pVal) {
    // skip basicblock operands for control flow instructions (e.g. br / switch / e.t.c.)
    if (isa<BasicBlock>(pVal))
        return;
    if (rev_value_map.find(pVal) != rev_value_map.end())
        return;
    string val_name;
    raw_string_ostream val_name_os(val_name);
    if (auto * pInst = dyn_cast<Instruction>(pVal)) {
        Function * pFunc = pInst->getFunction();
        val_name_os << rev_func_map[pFunc] << "-";
    } else if (auto * pArg = dyn_cast<Argument>(pVal)) {
        Function * pFunc = pArg->getParent();
        val_name_os << rev_func_map[pFunc] << "-";
    }
    pVal->printAsOperand(val_name_os);
    value_map.emplace(val_name, pVal);
    rev_value_map.emplace(pVal, val_name);
    collect_type(pVal->getType());
    if (isa<Constant>(pVal)) {
        if (auto *pConstInt = dyn_cast<ConstantInt>(pVal)) {
            string const_str;
            raw_string_ostream raw_os(const_str);
            raw_os << pConstInt->getValue();
            rev_constint_map.emplace(pConstInt, const_str);
        } else if (auto *pConstFP = dyn_cast<ConstantFP>(pVal)) {
            string const_str;
            raw_string_ostream raw_os(const_str);
            pConstFP->getValue().print(raw_os);
            rev_constfp_map.emplace(pConstFP, const_str);
        } else if (auto *pStruct = dyn_cast<ConstantStruct>(pVal)) {
            unsigned num_fields = pStruct->getNumOperands();
            if (num_fields > max_z)
                max_z = num_fields;
        } else if (auto *pArr = dyn_cast<ConstantArray>(pVal)) {
            uint64_t arr_len = pArr->getNumOperands();
            const_sizealign_set.insert(arr_len);
        } else if (auto *pVec = dyn_cast<ConstantVector>(pVal)) {
            uint64_t arr_len = pVec->getNumOperands();
            const_sizealign_set.insert(arr_len);
        } else if (auto *pDataArr = dyn_cast<ConstantDataArray>(pVal)) {
            uint64_t arr_len = pDataArr->getNumElements();
            const_sizealign_set.insert(arr_len);
            for (unsigned idx = 0; idx < arr_len; ++idx) {
                Constant *pElem = pDataArr->getElementAsConstant(idx);
                collect_value(pElem);
            }
        } else if (auto *pDataVec = dyn_cast<ConstantDataVector>(pVal)) {
            uint64_t vec_len = pDataVec->getNumElements();
            const_sizealign_set.insert(vec_len);
            for (unsigned idx = 0; idx < vec_len; ++idx) {
                Constant *pElem = pDataVec->getElementAsConstant(idx);
                collect_value(pElem);
            }
        } else if (auto *pZero = dyn_cast<ConstantAggregateZero>(pVal)) {
            const_sizealign_set.insert(0);
        }
        // special handling of components of constants
        if (!isa<GlobalValue>(pVal)) {
            auto *pConst = cast<Constant>(pVal);
            for (Value *pSub: pConst->operands())
                collect_value(pSub);
        }
    }
}

string IRManager::get_name() {
    return name;
}

void IRManager::build_type_rels() {
    // TODO: build rev_type_map somewhere
    for (const auto& type_pair : rev_type_map) {
        Type* pTy = type_pair.first;
        const string& ty_str = type_pair.second;
        switch (pTy->getTypeID()) {
            case Type::VoidTyID: {
                // void_type(ty:T)
                rel_void_type.add({ty_str});
                break;
            }
            case Type::FunctionTyID: {
                // fn_type(ty:T)
                rel_fn_type.add({ty_str});

                auto *pFnTy = cast<FunctionType>(pTy);

                // fn_type_varargs(ty:T)
                if (pFnTy->isVarArg())
                    rel_fn_type_varargs.add({ty_str});

                // fn_type_return(fn_ty:T, ret_ty:T)
                Type *pRetTy = pFnTy->getReturnType();
                rel_fn_type_return.add({ty_str, rev_type_map[pRetTy]});

                // fn_type_nparams(fn_ty:T, n:Z)
                unsigned nparams = pFnTy->getNumParams();
                rel_fn_type_nparams.add({ty_str, to_string(nparams)});
                // fn_type_param(fn_ty:T, i:Z, param_ty:T)
                for (unsigned idx = 0; idx < nparams; ++idx) {
                    Type * pParamTy = pFnTy->getParamType(idx);
                    rel_fn_type_param.add(
                            {ty_str, to_string(idx), rev_type_map[pParamTy]}
                    );
                }
                break;
            }
            case Type::IntegerTyID: {
                // integer_type(ty:T)
                rel_integer_type.add({ty_str});
                // IntegerType * pIntTy = cast<IntegerType>(pTy);
                break;
            }
            case Type::HalfTyID:
            case Type::BFloatTyID:
            case Type::FloatTyID:
            case Type::DoubleTyID:
            case Type::X86_FP80TyID:
            case Type::FP128TyID:
            case Type::PPC_FP128TyID: {
                // floatingpoint_type(ty:T)
                rel_floatingpoint_type.add({ty_str});
                break;
            }
            case Type::PointerTyID:
            case Type::DXILPointerTyID: { //TODO: check more about DXILPointerType
                // pointer_type(ty:T)
                rel_pointer_type.add({ty_str});

                auto *pPtrTy = cast<PointerType>(pTy);

                // pointer_type_opaque(ty:T)
                // pointer_type_component(ty:T, pointee_ty:T)
                if (pPtrTy->isOpaque()) {
                    rel_pointer_type_opaque.add({ty_str});
                } else {
                    Type * pElemTy = pPtrTy->getPointerElementType();
                    rel_pointer_type_component.add({ty_str, rev_type_map[pElemTy]});
                }
//                // pointer_type_addr_space(ty:T, addr:AS)
//                unsigned addr_space = pPtrTy->getAddressSpace();
//                rel_pointer_type_addrspace.add({ty_str, to_string(addr_space)});
                break;
            }
            case Type::FixedVectorTyID:
            case Type::ScalableVectorTyID: {
                // vector_type(ty:T)
                rel_vector_type.add({ty_str});

                // vector_type_size(ty:T, size:C)
                if (isa<FixedVectorType>(pTy)) {
                    unsigned size = cast<FixedVectorType>(pTy)->getNumElements();
                    rel_vector_type_size.add({ty_str, to_string(size)});
                }
                // vector_type_min_size(ty:T, size:C)
                if (isa<ScalableVectorType>(pTy)) {
                    unsigned min_size = cast<ScalableVectorType>(pTy)->getMinNumElements();
                    rel_vector_type_min_size.add({ty_str, to_string(min_size)});
                }
                // vector_type_component(ty:T, comp_ty:T)
                Type * pElemType = cast<VectorType>(pTy)->getElementType();
                rel_vector_type_component.add({ty_str, rev_type_map[pElemType]});
                break;
            }
            case Type::ArrayTyID: {
                // array_type(ty:T)
                rel_array_type.add({ty_str});

                auto *pArrTy = cast<ArrayType>(pTy);

                // array_type_size(ty:T, size:C)
                uint64_t size = pArrTy->getNumElements();
                rel_array_type_size.add({ty_str, to_string(size)});

                // array_type_component(ty:T, comp_ty:T)
                Type * pElemTy = pArrTy->getElementType();
                rel_array_type_component.add({ty_str, rev_type_map[pElemTy]});
                break;
            }
            case Type::StructTyID: {
                // struct_type(ty:T)
                rel_struct_type.add({ty_str});

                auto *pStructTy = cast<StructType>(pTy);

//                // struct_type_name(ty:T, name:??) // TODO: learn more about struct namings
//                if (pStructTy->hasName()) {
//                    rel_struct_type_name.add({ty_str, pStructTy->getName().str()});
//                }
                // opaque_struct_type(ty:T) // TODO: learn more about opaque structs
                if (pStructTy->isOpaque()) {
                    rel_opaque_struct_type.add({ty_str});
                }
                // struct_type_nfields(ty:T, n:Z)
                unsigned num_fields = pStructTy->getNumElements();
                rel_struct_type_nfields.add({ty_str, to_string(num_fields)});

                // struct_type_field(ty:T, i:Z, f_ty:T)
                for (unsigned idx = 0; idx < num_fields; ++idx) {
                    Type* pFieldTy = pStructTy->getElementType(idx);
                    rel_struct_type_field.add({ty_str, to_string(idx), rev_type_map[pFieldTy]});
                }
                break;
            }
            case Type::LabelTyID: {
                // label(ty:T)
                rel_label.add({ty_str});
                break;
            }
            case Type::TokenTyID: {
                // token(ty:T)
                rel_token.add({ty_str});
                break;
            }
            case Type::MetadataTyID: {
                // metadata(ty:T)
                rel_metadata.add({ty_str});
                break;
            }
            case Type::X86_MMXTyID: {
                // x86mmx(ty:T)
                rel_x86mmx.add({ty_str});
                break;
            }
            case Type::X86_AMXTyID: {
                // x86amx(ty:T)
                rel_x86amx.add({ty_str});
                break;
            }
        }
    }
}

void IRManager::build_value_rels() {
    for (auto & value_pair : value_map) {
        const string & val_n = value_pair.first;
        Value * pVar = value_pair.second;
        // variable_type(v:V, ty:T)
        Type * pTy = pVar->getType();
        rel_variable_type.add({val_n, rev_type_map[pTy]});
        if (auto * pConstInt = dyn_cast<ConstantInt>(pVar)) {
            rel_variable_const_int.add({val_n, rev_constint_map[pConstInt]});
        } else if (auto * pConstFP = dyn_cast<ConstantFP>(pVar)) {
            rel_variable_const_fp.add({val_n, rev_constfp_map[pConstFP]});
        } else if (auto * pNull = dyn_cast<ConstantPointerNull>(pVar)) {
            rel_variable_const_ptr_null.add({val_n});
        } else if (auto * pNone = dyn_cast<ConstantTokenNone>(pVar)) {
            rel_variable_const_token_none.add({val_n});
        } else if (auto * pStruct = dyn_cast<ConstantStruct>(pVar)) {
            rel_variable_const_struct.add({val_n});
            unsigned num_fields = pStruct->getNumOperands();
            rel_variable_const_struct_nfields.add({val_n, to_string(num_fields)});
            for (unsigned f_idx = 0; f_idx < num_fields; ++f_idx) {
                Constant *pOp = pStruct->getOperand(f_idx);
                rel_variable_const_struct_field.add({val_n, to_string(f_idx), rev_value_map[pOp]});
            }
        } else if (auto * pArr = dyn_cast<ConstantArray>(pVar)) {
            rel_variable_const_array.add({val_n});
            unsigned len = pArr->getNumOperands();
            rel_variable_const_array_len.add({val_n, to_string(len)});
            for (unsigned idx = 0; idx < len; ++idx) {
                Constant *pOp = pArr->getOperand(idx);
                rel_variable_const_array_elem.add({val_n, rev_value_map[pOp]});
            }
        } else if (auto * pVec = dyn_cast<ConstantVector>(pVar)) {
            rel_variable_const_vector.add({val_n});
            unsigned len = pVec->getNumOperands();
            rel_variable_const_vector_len.add({val_n, to_string(len)});
            for (unsigned idx = 0; idx < len; ++idx) {
                Constant *pOp = pVec->getOperand(idx);
                rel_variable_const_vector_elem.add({val_n, rev_value_map[pOp]});
            }
        } else if (auto * pDataArr = dyn_cast<ConstantDataArray>(pVar)) {
            rel_variable_const_array.add({val_n});
            unsigned len = pDataArr->getNumElements();
            rel_variable_const_array_len.add({val_n, to_string(len)});
            for (unsigned idx = 0; idx < len; ++idx) {
                Constant *pOp = pDataArr->getElementAsConstant(idx);
                rel_variable_const_array_elem.add({val_n, rev_value_map[pOp]});
            }
        } else if (auto * pDataVec = dyn_cast<ConstantDataVector>(pVar)) {
            rel_variable_const_vector.add({val_n});
            unsigned len = pDataArr->getNumElements();
            rel_variable_const_vector_len.add({val_n, to_string(len)});
            for (unsigned idx = 0; idx < len; ++idx) {
                Constant *pOp = pDataArr->getElementAsConstant(idx);
                rel_variable_const_vector_elem.add({val_n, rev_value_map[pOp]});
            }
        } else if (auto * pAggZero = dyn_cast<ConstantAggregateZero>(pVar)) {
            rel_variable_const_aggzero.add({val_n});
        } else if (auto * pGlobal = dyn_cast<GlobalVariable>(pVar)) {
            // variable_global(v:V)
            rel_variable_global.add({val_n});
            // variable_global_type(v:V, ty:T)
            Type * pValueTy = pGlobal->getValueType();
            rel_variable_global_type.add({val_n, rev_type_map[pValueTy]});
//            // variable_global_linkage(v:V)
//            GlobalValue::LinkageTypes link = pGlobal->getLinkage();
//            rel_variable_global_linkage.add({val_n, get_linkage_string(link)});
            // variable_global_align(v:V,align:C)
            MaybeAlign align = pGlobal->getAlign();
            rel_variable_global_align.add({val_n, to_string(align.valueOrOne().value())});
            // variabel_global_init(v:V, init_val:V)
            if (pGlobal->hasInitializer()) {
                Constant * pConst = pGlobal->getInitializer();
                rel_variable_global_init.add({val_n, rev_value_map[pConst]});
            }
            //TODO not sure
//        sprintf(parsed_relation, "%sglobal_variable_visibility(%s,%s)\n", parsed_relation, I.first.c_str(), get_visibility_string(I.second->getVisibility()).c_str());
//        sprintf(parsed_relation, "%sglobal_variable_section(%s,%s)\n", parsed_relation, I.first.c_str(), I.second->getSection().str().c_str());
//        sprintf(parsed_relation, "%sglobale_threadlocal_mode(%s,%s)\n", parsed_relation, I.first.c_str(), get_mode_string(I.second->getThreadLocalMode()).c_str());
//        if(I.second->isConstantUsed())
//            sprintf(parsed_relation, "%sglobal_variable_constant(%s)\n", parsed_relation, I.first.c_str());
        } else if (auto * pAlias = dyn_cast<GlobalAlias>(pVar)) {
            // variable_alias(v:V)
            rel_variable_alias.add({val_n});
            // variable_alias_aliasee(v:V, aliasee:V)
            if (Value * pAliasee = pAlias->getAliasee())
                rel_variable_alias_aliasee.add({val_n, rev_value_map[pAliasee]});
//        sprintf(parsed_relation, "%salias_type(%s,%s)\n", parsed_relation, I.first.c_str(), get_value_type(I.second->getType()).c_str());
//        sprintf(parsed_relation, "%salias_name(%s,%s)\n", parsed_relation, I.first.c_str(), I.second->getName().data());
//        sprintf(parsed_relation, "%salias_linkage_type(%s,%s)\n", parsed_relation, I.first.c_str(), get_linkage_string(I.second->getLinkage()).c_str());
//        sprintf(parsed_relation, "%salias_visibility(%s,%s)\n", parsed_relation, I.first.c_str(), get_visibility_string(I.second->getVisibility()).c_str());
        } else if (auto * pUndef = dyn_cast<UndefValue>(pVar)) {
            rel_variable_undef.add({val_n});
            if (isa<PoisonValue>(pVar))
                rel_variable_undef_poison.add({val_n});
        } else if (auto * pIFunc = dyn_cast<GlobalIFunc>(pVar)) {
            // variable_ifunc(v:V)
            rel_variable_ifunc.add({val_n});
            // variable_ifunc_resolver(v:V, m:M)
            Function * pResolver = pIFunc->getResolverFunction();
            rel_variable_ifunc_resolver.add({val_n, rev_func_map[pResolver]});
        } else if (auto * pFunc = dyn_cast<Function>(pVar)) {
            rel_variable_func.add({val_n, rev_func_map[pFunc]});
        } else if (auto * pAddr = dyn_cast<BlockAddress>(pVar)) {
            BasicBlock *pBB = pAddr->getBasicBlock();
            rel_variable_blockaddr.add({val_n, rev_bb_map[pBB]});
        } else if (auto * pConstExpr = dyn_cast<ConstantExpr>(pVar)) {
            rel_variable_constexpr.add({val_n});
            Instruction * pPhonyInst = pConstExpr->getAsInstruction();
            add_op_rel(pConstExpr, pPhonyInst);
        }
        // TODO build constant relations
    }
}

void IRManager::add_op_rel(llvm::Value *pRes, llvm::Instruction *pInst) {
    if (auto * pUnary = dyn_cast<UnaryOperator>(pInst)) {
        add_op_unary(pUnary->getOpcode(), pRes, pUnary->getOperand(0));
    } else if (auto * pBinary = dyn_cast<BinaryOperator>(pInst)) {
        add_op_binary(pBinary->getOpcode(), pRes, pBinary->getOperand(0), pBinary->getOperand(1));
    } else if (auto * pExtractElem = dyn_cast<ExtractElementInst>(pInst)) {
        Value * pBase = pExtractElem->getVectorOperand();
        Value * pIdx = pExtractElem->getIndexOperand();
        rel_operation_extractelement.add({rev_value_map[pRes], rev_value_map[pBase], rev_value_map[pIdx]});
    } else if (auto * pInsertElem = dyn_cast<InsertElementInst>(pInst)) {
        Value * pBase = pInsertElem->getOperand(0);
        Value * pElem = pInsertElem->getOperand(1);
        Value * pIdx = pInsertElem->getOperand(2);
        rel_operation_insertelement.add({rev_value_map[pRes], rev_value_map[pBase], rev_value_map[pElem], rev_value_map[pIdx]});
    } else if (auto * pShuffle = dyn_cast<ShuffleVectorInst>(pInst)) {
        Value * pVec1 = pShuffle->getOperand(0);
        Value * pVec2 = pShuffle->getOperand(1);
        Value * pMask = pShuffle->getOperand(2);
        rel_operation_shufflevector.add({rev_value_map[pRes], rev_value_map[pVec1], rev_value_map[pVec2], rev_value_map[pMask]});
    } else if (auto * pExtractVal = dyn_cast<ExtractValueInst>(pInst)) {
        // operation_extractvalue_base(inst:P, base:V)
        Value * pBase = pExtractVal->getAggregateOperand();
        rel_operation_extractvalue_base.add({rev_value_map[pRes], rev_value_map[pBase]});
        // operation_extractvalue_nindices(inst:P, n:Z)
        unsigned num_indices = pExtractVal->getNumIndices();
        rel_operation_extractvalue_nindices.add({rev_value_map[pRes], to_string(num_indices)});
        // operation_extractvalue_indice(inst:P, i:Z, id:Z)
        for (unsigned i = 0; i < num_indices; ++i) {
            unsigned idx = pExtractVal->getIndices()[i];
            rel_operation_extractvalue_index.add({rev_value_map[pRes], to_string(i), to_string(idx)});
        }
    } else if (auto * pInsertVal = dyn_cast<InsertValueInst>(pInst)) {
        // operation_insertvalue_base(inst:P, base:V)
        Value * pBase = pInsertVal->getAggregateOperand();
        rel_operation_insertvalue_base.add({rev_value_map[pRes], rev_value_map[pBase]});
        // operation_insertvalue_elem(inst:P, elem:V)
        Value * pElem = pInsertVal->getInsertedValueOperand();
        rel_operation_insertvalue_elem.add({rev_value_map[pRes], rev_value_map[pElem]});
        // operation_insertvalue_nindices(inst:P, n:Z)
        unsigned num_indices = pInsertVal->getNumIndices();
        rel_operation_insertvalue_nindices.add({rev_value_map[pRes], to_string(num_indices)});
        // instruction_insertvalue_indice(inst:P, i:Z, id:Z)
        for (unsigned i = 0; i < num_indices; ++i) {
            unsigned idx = pInsertVal->getIndices()[i];
            rel_operation_insertvalue_index.add({rev_value_map[pRes], to_string(i), to_string(idx)});
        }
    } else if (auto * pGep = dyn_cast<GetElementPtrInst>(pInst)) {
        // operation_gep_inbounds(res:V)
        if (pGep->isInBounds())
            rel_operation_gep_inbounds.add({rev_value_map[pRes]});
        // operation_gep_base(res:V, addr:V)
        Value * pBase = pGep->getPointerOperand();
        rel_operation_gep_base.add({rev_value_map[pRes], rev_value_map[pBase]});
        // operation_gep_type(res:V, ty:T)
        Type * pSrcTy = pGep->getSourceElementType();
        rel_operation_gep_type.add({rev_value_map[pRes], rev_type_map[pSrcTy]});
        // operation_gep_nindices(res:V, n:Z)
        unsigned num_indices = pGep->getNumIndices();
        rel_operation_gep_nindices.add({rev_value_map[pRes], to_string(num_indices)});
        // operation_gep_index(res:V, i:Z, val:V)
        Use * op_list = pGep->getOperandList();
        rel_operation_gep_index_offset.add({rev_value_map[pRes], to_string(0), rev_value_map[op_list[0].get()]});
        Type * pIndexedType = pSrcTy;
        for (unsigned off_idx = 1; off_idx < num_indices; ++off_idx) {
            Value *pOffset = op_list[off_idx].get();
            if (auto *pStructTy = dyn_cast<llvm::StructType>(pIndexedType)) {
                auto idx = (unsigned) cast<Constant>(pOffset)->getUniqueInteger().getZExtValue();
                rel_operation_gep_index_field.add({rev_value_map[pRes], to_string(off_idx), to_string(idx)});
            } else {
                rel_operation_gep_index_offset.add({rev_value_map[pRes], to_string(off_idx), rev_value_map[pOffset]});
            }
            pIndexedType = GetElementPtrInst::getTypeAtIndex(pIndexedType, pOffset);
        }
    } else if (auto * pCast = dyn_cast<CastInst>(pInst)) {
        add_op_cast(pCast->getOpcode(), pRes, pCast->getOperand(0), pCast->getSrcTy(), pCast->getDestTy());
    } else if (auto * pIcmp = dyn_cast<ICmpInst>(pInst)) {
        add_op_icmp(pIcmp->getPredicate(), pRes, pIcmp->getOperand(0), pIcmp->getOperand(1));
    } else if (auto * pFcmp = dyn_cast<FCmpInst>(pInst)) {
        add_op_fcmp(pFcmp->getPredicate(), pRes, pFcmp->getOperand(0), pFcmp->getOperand(1));
    }
}

void IRManager::add_op_unary(unsigned op, Value * pRes, Value * pInner) {
    switch (op) {
        case Instruction::FNeg:
//                    rel_operation_unary_expr.add({"fneg", rev_value_map[pRes], rev_value_map[pInner]});
            rel_operation_unary_fneg.add({rev_value_map[pRes], rev_value_map[pInner]});
            break;
        default:
            // TODO: warning for unknown instructions
//                    rel_operation_unary_expr.add({"uop"+ to_string(op), rev_value_map[pRes], rev_value_map[pInner]});
//                    rel_operation_unhandled.add({"uop"+ to_string(op)});
            break;
    }
}

void IRManager::add_op_binary(unsigned op, Value * pRes, Value * pLeft, Value * pRight) {
    switch (op) {
        case Instruction::Add:
//                    rel_operation_binary_expr.add({"add", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_add.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::FAdd:
//                    rel_operation_binary_expr.add({"fadd", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_fadd.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::Sub:
//                    rel_operation_binary_expr.add({"sub", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_sub.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::FSub:
//                    rel_operation_binary_expr.add({"fsub", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_fsub.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::Mul:
//                    rel_operation_binary_expr.add({"mul", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_mul.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::FMul:
//                    rel_operation_binary_expr.add({"fmul", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_fmul.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::UDiv:
//                    rel_operation_binary_expr.add({"udiv", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_udiv.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::SDiv:
//                    rel_operation_binary_expr.add({"sdiv", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_sdiv.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::FDiv:
//                    rel_operation_binary_expr.add({"fdiv", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_fdiv.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::URem:
//                    rel_operation_binary_expr.add({"urem", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_urem.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::SRem:
//                    rel_operation_binary_expr.add({"srem", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_srem.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::FRem:
//                    rel_operation_binary_expr.add({"frem", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_frem.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::Shl:
//                    rel_operation_binary_expr.add({"shl", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_shl.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::LShr:
//                    rel_operation_binary_expr.add({"lshr", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_lshr.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::AShr:
//                    rel_operation_binary_expr.add({"ashr", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_ashr.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::And:
//                    rel_operation_binary_expr.add({"and", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_and.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::Or:
//                    rel_operation_binary_expr.add({"or", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_or.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case Instruction::Xor:
//                    rel_operation_binary_expr.add({"xor", rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            rel_operation_binary_xor.add(
                    {rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        default:
            // TODO: warning for unknown instructions
//                    rel_operation_binary_expr.add({"bop"+ to_string(op), rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
//                    rel_operation_unhandled.add({"bop"+ to_string(op)});
            break;
    }
}

void IRManager::add_op_cast(unsigned op, Value * pRes, Value * pSrc, Type * pFromTy, Type * pToTy) {
    switch (op) {
        case Instruction::Trunc:
            rel_operation_cast_trunc.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::ZExt:
            rel_operation_cast_zext.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::SExt:
            rel_operation_cast_sext.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::FPToUI:
            rel_operation_cast_fptoui.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::FPToSI:
            rel_operation_cast_fptosi.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::UIToFP:
            rel_operation_cast_uitofp.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::SIToFP:
            rel_operation_cast_sitofp.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::FPTrunc:
            rel_operation_cast_fptrunc.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::PtrToInt:
            rel_operation_cast_ptrtoint.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::IntToPtr:
            rel_operation_cast_inttoptr.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::BitCast:
            rel_operation_cast_bitcast.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        case Instruction::AddrSpaceCast:
            rel_operation_cast_addrspacecast.add({rev_value_map[pRes], rev_value_map[pSrc], rev_type_map[pFromTy], rev_type_map[pToTy]});
            break;
        default:
            break;
    }
}

void IRManager::add_op_icmp(unsigned int pred, llvm::Value *pRes, llvm::Value *pLeft, llvm::Value *pRight) {
    switch (pred) {
        case CmpInst::ICMP_EQ:
            rel_operation_icmp_eq.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_NE:
            rel_operation_icmp_ne.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_UGT:
            rel_operation_icmp_ugt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_UGE:
            rel_operation_icmp_uge.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_ULT:
            rel_operation_icmp_ult.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_ULE:
            rel_operation_icmp_ule.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_SGT:
            rel_operation_icmp_sgt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_SGE:
            rel_operation_icmp_sge.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_SLT:
            rel_operation_icmp_slt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::ICMP_SLE:
            rel_operation_icmp_sle.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        default:
            break;
    }
}
void IRManager::add_op_fcmp(unsigned int pred, llvm::Value *pRes, llvm::Value *pLeft, llvm::Value *pRight) {
    switch (pred) {
        case CmpInst::FCMP_FALSE:
            rel_operation_fcmp_false.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_OEQ:
            rel_operation_fcmp_oeq.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_OGT:
            rel_operation_fcmp_ogt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_OGE:
            rel_operation_fcmp_oge.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_OLT:
            rel_operation_fcmp_olt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_ONE:
            rel_operation_fcmp_one.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_ORD:
            rel_operation_fcmp_ord.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_UEQ:
            rel_operation_fcmp_ueq.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_UGT:
            rel_operation_fcmp_ugt.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_UGE:
            rel_operation_fcmp_uge.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_ULT:
            rel_operation_fcmp_ult.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_ULE:
            rel_operation_fcmp_ule.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_UNE:
            rel_operation_fcmp_une.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_UNO:
            rel_operation_fcmp_uno.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        case CmpInst::FCMP_TRUE:
            rel_operation_fcmp_true.add({rev_value_map[pRes], rev_value_map[pLeft], rev_value_map[pRight]});
            break;
        default:
            break;
    }
}

void IRManager::build_controlflow_rels() {
    for(auto & i : bb_map) {
        const string & bb_n = i.first;
        BasicBlock * pBB = i.second;
        string entry_inst_n = bb_n + "-" + to_string(0);
        // BasicBlocks
        size_t bb_inst_cnt = pBB->getInstList().size();
        // basicblock_entry(bb:B, entry_inst:P)
        rel_basicblock_entry.add({bb_n, entry_inst_n});
        // basicblock_exit(bb:B, exit_inst:P)
        string exit_inst_n = bb_n + "-" + to_string(bb_inst_cnt - 1);
        rel_basicblock_exit.add({bb_n, exit_inst_n});
        // basicblock_pred(bb_pred:B, bb_next:B)
        for (BasicBlock * pPred : predecessors(pBB))
            rel_basicblock_pred.add({rev_bb_map[pPred], bb_n});

        for(size_t idx = 0; idx < bb_inst_cnt; ++idx) {
            string inst_id = bb_n+"-"+to_string(idx);
            // instruction_basicblock(inst:P, bb:B)
            rel_instruction_basicblock.add({inst_id, bb_n});
            if(idx + 1 < bb_inst_cnt){
                string next_id = bb_n + "-" + to_string(idx + 1);
                // instruction_next(inst_pred:I, inst_post:I)
                rel_instruction_next.add({inst_id, next_id});
            }
        }
    }
}



void IRManager::build_function_rels() {
    for(const auto& func_pair : func_map){
        const string& f_str = func_pair.first;
        Function *pFunc = func_pair.second;
        // main_function(fn:M)
        if (pFunc->getName().equals("main"))
            rel_main_function.add({f_str});
        // function_type(fn:M, ty:T)
        FunctionType* pFnTy = pFunc->getFunctionType();
        rel_function_type.add({f_str, rev_type_map[pFnTy]});

//        // function_name(fn:M, name:??)
//        rel_function_name.add({f_str, pFunc->getName().str()});

//        // function_linkage(fn:M, link:L)
//        GlobalValue::LinkageTypes link = pFunc->getLinkage();
//        rel_function_linkage.add({f_str, get_linkage_string(link)});

        // function_nparams(fn:M, n:Z)
        size_t num_params = pFunc->arg_size();
        rel_function_nparams.add({f_str, to_string(num_params)});

        // function_param(fn:M, i:Z, arg:V)
        for (size_t p_idx = 0; p_idx < num_params; ++p_idx) {
            Argument * pArg = pFunc->getArg(p_idx);
            // TODO: build argument ref first, add argument reference elsewhere
            rel_function_param.add({f_str, to_string(p_idx), rev_value_map[pArg]});
        }

        if (pFunc->isDeclaration()) {
            rel_function_extern.add({f_str});
        } else {
            BasicBlock & entry_bb = pFunc->getEntryBlock();
            rel_function_entry.add({f_str, rev_bb_map[&entry_bb]});
        }

//        rel_function_linkage_type.add({f_str, get_linkage_string(pFunc->getLinkage())});
//        rel_function_visibility.add({f_str, get_visibility_string(pFunc->getVisibility())});
//        rel_function_calling_convention.add({f_str, get_conv_kind(pFunc->getCallingConv())});
//        switch(pFunc->getUnnamedAddr()){
//            case llvm::GlobalValue::UnnamedAddr::Global:
//                rel_function_unnamed_addr.add({f_str, "Global"});
//                break;
//            case llvm::GlobalValue::UnnamedAddr::Local:
//                rel_function_unnamed_addr.add({f_str, "Local"});
//                break;
//            case llvm::GlobalValue::UnnamedAddr::None:
//                rel_function_unnamed_addr.add({f_str, "None"});
//                break;
//            default:
//                printf("\tsomething is error.\n");
//        }
//        rel_function_alignment.add({f_str, to_string(pFunc->getAlignment())});
//        if(pFunc->hasGC())
//            rel_function_gc.add({f_str, pFunc->getGC()});
//        if(pFunc->hasPersonalityFn())
//            rel_function_pers_fn.add({f_str, pFunc->getPersonalityFn()->getName().str()});
//        for (const auto& attr: pFunc->getAttributes().getFnAttrs()){
//            rel_function_attribute.add({f_str, attr.getAsString()});
//        }
//        for (const auto& attr : pFunc->getAttributes().getRetAttrs()){
//            rel_function_return_attribute.add({f_str, attr.getAsString()});
//        }
//        for (size_t p_idx = 0; p_idx < num_params; ++p_idx) {
//            for (const auto& attr : pFunc->getAttributes().getParamAttrs(p_idx)) {
//                rel_function_param_attribute.add({f_str, attr.getAsString()});
//            }
//        }
//        if(pFunc->hasSection())
//            rel_function_section.add({f_str, pFunc->getSection().str()});

    }
}


void IRManager::build_instruction_rels() {
    // TODO: mark terminator instructions?
    for(const auto& inst_pair:inst_map){
        const string& inst_str = inst_pair.first;
        Instruction * pInst = inst_pair.second;
        //terminate inst
        if (auto * pRet = dyn_cast<llvm::ReturnInst>(pInst)) {
            // instruction_ret(inst:P)
            rel_instruction_ret.add({inst_str});
            if (Value * pRetVal = pRet->getReturnValue()) {
                // instruction_ret_var(inst:P, var:V)
                rel_instruction_ret_var.add({inst_str, rev_value_map[pRetVal]});
            } else {
                rel_instruction_ret_void.add({inst_str});
            }
        } else if(auto * pBr = dyn_cast<llvm::BranchInst>(pInst)){
            // instruction_br(inst:P)
            rel_instruction_br.add({inst_str});
            if (pBr->isConditional()) {
                // instruction_br_cond(inst:P)
                rel_instruction_br_cond.add({inst_str});
                // instruction_br_cond_val(br_inst:P, v:V)
                Value * pCond = pBr->getCondition();
                rel_instruction_br_cond_var.add({inst_str, rev_value_map[pCond]});
                // instruction_br_cond_iftrue(br_inst:P, l:BB)
                BasicBlock * pTrue = pBr->getSuccessor(0);
                rel_instruction_br_cond_iftrue.add({inst_str, rev_bb_map[pTrue]});
                // instruction_br_cond_iffalse(br_inst:P, l:B)
                BasicBlock * pFalse = pBr->getSuccessor(1);
                rel_instruction_br_cond_iffalse.add({inst_str, rev_bb_map[pFalse]});
            } else {
                // instruction_br_uncond(inst:P)
                rel_instruction_br_uncond.add({inst_str});
                // instruction_br_uncond_goto(br_inst:P, l:B)
                BasicBlock * pGoto = pBr->getSuccessor(0);
                rel_instruction_br_uncond_goto.add({inst_str, rev_bb_map[pGoto]});
            }
        } else if(auto * pSwitch = dyn_cast<llvm::SwitchInst>(pInst)){
            // instruction_switch(inst:P)
            rel_instruction_switch.add({inst_str});
            // instruction_switch_var(inst:P, v:V)
            Value * pCond = pSwitch->getCondition();
            rel_instruction_switch_var.add({inst_str, rev_value_map[pCond]});
            // instruction_switch_default(sw_inst:P, l:B)
            BasicBlock * pDefault = pSwitch->getDefaultDest();
            rel_instruction_switch_default.add({inst_str, rev_bb_map[pDefault]});
            // instruction_switch_ncases(sw_inst:P, n:Z)
            unsigned num_cases = pSwitch->getNumCases();
            rel_instruction_switch_ncases.add({inst_str, to_string(num_cases)});

            for (const auto & case_handle : pSwitch->cases()) {
                unsigned idx = case_handle.getCaseIndex();
                // instruction_switch_case_val(sw_inst:P, i:Z, cval:C)
                ConstantInt * pConst = case_handle.getCaseValue();
                rel_instruction_switch_case_val.add({inst_str, to_string(idx), rev_constint_map[pConst]});
                // instruction_switch_case_goto(sw_inst:P, i:Z, l:B)
                BasicBlock * pGoto = case_handle.getCaseSuccessor();
                rel_instruction_switch_case_goto.add({inst_str, to_string(idx), rev_bb_map[pGoto]});
            }
        } else if(auto * pInBr = dyn_cast<llvm::IndirectBrInst>(pInst)){
            // instruction_indirectbr(inst:P)
            rel_instruction_indirectbr.add({inst_str});
            // instruction_indirectbr_addr(inst:P, p:V)
            Value * pAddr = pInBr->getAddress();
            rel_instruction_indirectbr_addr.add({inst_str, rev_value_map[pAddr]});
            // instruction_indirectbr_nlabels(inst:P, n:Z)
            unsigned num_dests = pInBr->getNumDestinations();
            rel_instruction_indirectbr_nlabels.add({inst_str, to_string(num_dests)});
            // instruction_indirectbr_label(inst:P, i:Z, l:B)
            for (unsigned dest_idx = 0; dest_idx < num_dests; ++dest_idx) {
                BasicBlock * pDest = pInBr->getDestination(dest_idx);
                rel_instruction_indirectbr_label.add({inst_str, to_string(dest_idx), rev_bb_map[pDest]});
            }
        } else if (auto * pInvk = dyn_cast<llvm::InvokeInst>(pInst)) {
            // instruction_invk(inst:P)
            rel_instruction_invk.add({inst_str});
            // instruction_invk_void(inst:P)
            // instruction_invk_res(inst:P, var:V)
            if (pInvk->getType()->isVoidTy()) {
                rel_instruction_invk_void.add({inst_str});
            } else {
                Value * pRes = pInvk;
                rel_instruction_invk_res.add({inst_str, rev_value_map[pRes]});
            }
            // instruction_invk_static(inst:P, func:M)
            // instruction_invk_dynamic(inst:P, fptr:V)
            if (Function * pFunc = pInvk->getCalledFunction()) {
                rel_instruction_invk_static.add({inst_str, rev_func_map[pFunc]});
            } else {
                Value * pFptr = pInvk->getCalledOperand();
                rel_instruction_invk_dynamic.add({inst_str, rev_value_map[pFptr]});
            }
            // instruction_invk_nargs(inst:P, n:Z)
            unsigned num_args = pInvk->arg_size();
            rel_instruction_invk_nargs.add({inst_str, to_string(num_args)});
            // instruction_invk_arg(inst:P, i:Z, arg:V)
            for (unsigned arg_idx = 0; arg_idx < num_args; ++arg_idx) {
                Value * pArg = pInvk->getArgOperand(arg_idx);
                rel_instruction_invk_arg.add({inst_str, to_string(arg_idx), rev_value_map[pArg]});
            }
            // instruction_invk_normaldest(inst:P, normal_dest:B)
            BasicBlock * pNormal = pInvk->getNormalDest();
            rel_instruction_invk_normaldest.add({inst_str, rev_bb_map[pNormal]});
            // instruction_invk_exceptiondest(inst:P, execption_dest:B)
            BasicBlock * pExcept = pInvk->getUnwindDest();
            rel_instruction_invk_exceptiondest.add({inst_str, rev_bb_map[pExcept]});
        } else if (auto * pCallBr = dyn_cast<llvm::CallBrInst>(pInst)) {
            // instruction_callbr(inst:P)
            rel_instruction_callbr.add({inst_str});
            // instruction_callbr_void(inst:P)
            // instruction_callbr_res(inst:P, var:V)
            if (pCallBr->getType()->isVoidTy()) {
                rel_instruction_callbr_void.add({inst_str});
            } else {
                Value * pRes = pCallBr;
                rel_instruction_callbr_res.add({inst_str, rev_value_map[pRes]});
            }
            // instruction_callbr_static(inst:P, func:M)
            // instruction_callbr_dynamic(inst:P, fptr:V)
            if (Function * pFunc = pCallBr->getCalledFunction()) {
                rel_instruction_callbr_static.add({inst_str, rev_func_map[pFunc]});
            } else {
                Value * pFptr = pCallBr->getCalledOperand();
                rel_instruction_callbr_dynamic.add({inst_str, rev_value_map[pFptr]});
            }
            // instruction_callbr_nargs(inst:P, n:Z)
            unsigned num_args = pCallBr->arg_size();
            rel_instruction_callbr_nargs.add({inst_str, to_string(num_args)});
            // instruction_callbr_arg(inst:P, i:Z, arg:V)
            for (unsigned arg_idx = 0; arg_idx < num_args; ++arg_idx) {
                Value * pArg = pCallBr->getArgOperand(arg_idx);
                rel_instruction_callbr_arg.add({inst_str, to_string(arg_idx), rev_value_map[pArg]});
            }
            // instruction_callbr_fallthrough(inst:P, dest:B)
            BasicBlock * pFall = pCallBr->getDefaultDest();
            rel_instruction_callbr_fallthrough.add({inst_str, rev_bb_map[pFall]});
            // instruction_callbr_indirect(inst:P, dest:B)
            for (BasicBlock * pIndirect : pCallBr->getIndirectDests()) {
                rel_instruction_callbr_indirect.add({inst_str, rev_bb_map[pIndirect]});
            }
        } else if (auto * pResume = dyn_cast<llvm::ResumeInst>(pInst)) {
            // instruction_resume(inst:P)
            rel_instruction_resume.add({inst_str});
            // instruction_resume_var(inst:P, v:V)
            Value * pVar = pResume->getValue();
            rel_instruction_resume_var.add({inst_str, rev_value_map[pVar]});
        } else if (auto * pCatchSw = dyn_cast<llvm::CatchSwitchInst>(pInst)) {
            // instruction_catchswitch(inst:P)
            rel_instruction_catchswitch.add({inst_str});
            // instruction_catchswitch(inst:P, res:V)
            Value * pRes = pCatchSw;
            rel_instruction_catchswitch_res.add({inst_str, rev_value_map[pRes]});
            // instruction_catchswitch_within(inst:P, pad:V)
            Value * pWithin = pCatchSw->getParentPad();
            rel_instruction_catchswitch_within.add({inst_str, rev_value_map[pWithin]});
            // instruction_catchswitch_handler(inst:P, handler:B)
            for (BasicBlock * handler : pCatchSw->handlers()) {
                rel_instruction_catchswitch_handler.add({inst_str, rev_bb_map[handler]});
            }
            // instruction_catchswitch_unwindlabel(inst:P, dest:B)
            // instruction_catchswitch_unwindcaller(inst:P)
            if (pCatchSw->hasUnwindDest()) {
                BasicBlock * pDefault = pCatchSw->getUnwindDest();
                rel_instruction_catchswitch_unwindlabel.add({inst_str, rev_bb_map[pDefault]});
            } else {
                rel_instruction_catchswitch_unwindcaller.add({inst_str});
            }
        } else if (auto * pCatchRet = dyn_cast<llvm::CatchReturnInst>(pInst)) {
            // instruction_catchret(inst:P)
            rel_instruction_catchret.add({inst_str});
            // instruction_catchret_fromto(inst:P, pad:V, label:B)
            Value * pCatchPad = pCatchRet->getCatchPad();
            BasicBlock * pNormal = pCatchRet->getSuccessor();
            rel_instruction_catchret_fromto.add({inst_str, rev_value_map[pCatchPad], rev_bb_map[pNormal]});
        } else if (auto * pCleanupRet = dyn_cast<llvm::CleanupReturnInst>(pInst)) {
            // instruction_cleanupret(inst:P)
            rel_instruction_cleanupret.add({inst_str});
            // instruction_cleanupret_from(inst:P, pad:V)
            Value * pPad = pCleanupRet->getCleanupPad();
            rel_instruction_cleanupret_from.add({inst_str, rev_value_map[pPad]});
            // instruction_cleanupret_unwindlabel(inst:P, dest:B)
            // instruction_cleanupret_unwindcaller(inst:P)
            if (pCleanupRet->hasUnwindDest()) {
                BasicBlock * pDefault = pCleanupRet->getUnwindDest();
                rel_instruction_cleanupret_unwindlabel.add({inst_str, rev_bb_map[pDefault]});
            } else {
                rel_instruction_cleanupret_unwindcaller.add({inst_str});
            }
        } else if (auto * pUnreach = dyn_cast<llvm::UnreachableInst>(pInst)){
            // instruction_unreachable(inst:P)
            rel_instruction_unreachable.add({inst_str});
        } else if (auto * pUnaryOp = dyn_cast<llvm::UnaryOperator>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pUnaryOp]});
            add_op_rel(pUnaryOp, pUnaryOp);
        } else if (auto * pBinaryOp = dyn_cast<llvm::BinaryOperator>(pInst))  {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pBinaryOp]});
            add_op_rel(pBinaryOp, pBinaryOp);
        } else if (auto * pExtractElem = dyn_cast<llvm::ExtractElementInst>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pExtractElem]});
            add_op_rel(pExtractElem, pExtractElem);
        } else if (auto * pInsertElem = dyn_cast<llvm::InsertElementInst>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pInsertElem]});
            add_op_rel(pInsertElem, pInsertElem);
        } else if (auto * pShuffle = dyn_cast<llvm::ShuffleVectorInst>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pShuffle]});
            add_op_rel(pShuffle, pShuffle);
        } else if (auto * pExtractVal = dyn_cast<llvm::ExtractValueInst>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pExtractVal]});
            add_op_rel(pExtractVal, pExtractVal);
        } else if (auto * pInsertVal = dyn_cast<llvm::InsertValueInst>(pInst)) {
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pInsertVal]});
            add_op_rel(pInsertVal, pInsertVal);
        } else if(auto * pAlloca = dyn_cast<llvm::AllocaInst>(pInst)){
            // instruction_alloca(inst:P)
            rel_instruction_alloca.add({inst_str});
            // instruction_alloca_res(inst:P, res:V)`
            Value * pRes = pAlloca;
            rel_instruction_alloca_res.add({inst_str, rev_value_map[pRes]});
            // instruction_alloca_type(inst:P, ty:T)
            Type * pType = pAlloca->getAllocatedType();
            rel_instruction_alloca_type.add({inst_str, rev_type_map[pType]});
            // instruction_alloca_size(inst:P, n:V)
            Value * pSize = pAlloca->getArraySize();
            rel_instruction_alloca_size.add({inst_str, rev_value_map[pSize]});
            // instruction_alloca_align(inst:P, align:C)
            Align align = pAlloca->getAlign();
            rel_instruction_alloca_align.add({inst_str, to_string(align.value())});
//            // instruction_alloca_addr_space(inst:P, addr:AS)
//            unsigned addrspace = pAlloca->getAddressSpace();
//            rel_instruction_alloca_addrspace.add({inst_str, to_string(addrspace)});
        } else if(auto * pLoad = dyn_cast<llvm::LoadInst>(pInst)){
            // instruction_load(inst:P)
            rel_instruction_load.add({inst_str});
            // instruction_load_volatile(inst:P)
            if (pLoad->isVolatile())
                rel_instruction_load_volatile.add({inst_str});
//            // instruction_load_ordering(inst:P, ord:ORD)
//            if (pLoad->isAtomic()) {
//                AtomicOrdering order = pLoad->getOrdering();
//                rel_instruction_load_ordering.add({inst_str, get_ordering_kind(order)});
//            }
            // instruction_load_res(inst:P, res:V)
            Value * pRes = pLoad;
            rel_instruction_load_res.add({inst_str, rev_value_map[pRes]});
            // instruction_load_ptr(inst:P, ptr:V)
            Value * pPtr = pLoad->getPointerOperand();
            rel_instruction_load_ptr.add({inst_str, rev_value_map[pPtr]});
            // TODO: check pLoad->getPointerOperandType()
            // instruction_load_align(inst:P, align:C)
            Align align = pLoad->getAlign();
            rel_instruction_load_align.add({inst_str, to_string(align.value())});
        } else if(auto * pStore = dyn_cast<llvm::StoreInst>(pInst)){
            // instruction_store(inst:P)
            rel_instruction_store.add({inst_str});
            // instruction_store_volatile(inst:P)
            if (pStore->isVolatile())
                rel_instruction_store_volatile.add({inst_str});
//            // instruction_store_ordering(inst:P, ord:ORD)
//            if (pStore->isAtomic()) {
//                AtomicOrdering order = pStore->getOrdering();
//                rel_instruction_store_ordering.add({inst_str, get_ordering_kind(order)});
//            }
            // instruction_store_var(inst:P, v:V)
            Value * pValue = pStore->getValueOperand();
            rel_instruction_store_var.add({inst_str, rev_value_map[pValue]});
            // instruction_store_addr(inst:P, ptr:V)
            Value * pAddr = pStore->getPointerOperand();
            rel_instruction_store_addr.add({inst_str, rev_value_map[pAddr]});
            // TODO: check pStore->getPointerOperandType()
            // instruction_store_align(inst:P, align:C)
            Align align = pStore->getAlign();
            rel_instruction_store_align.add({inst_str, to_string(align.value())});
        } else if(auto * pFence = dyn_cast<llvm::FenceInst>(pInst)){
            // instruction_fence(inst:P)
            rel_instruction_fence.add({inst_str});
//            // instruction_fence_ordering(inst:P, ord:ORD)
//            AtomicOrdering order = pFence->getOrdering();
//            rel_instruction_fence_ordering.add({inst_str, get_ordering_kind(order)});
        }
        else if(auto * pCmpxchg = dyn_cast<llvm::AtomicCmpXchgInst>(pInst)){
            // instruction_cmpxchg(inst:P)
            rel_instruction_cmpxchg.add({inst_str});
            // instruction_cmpxchg_weak(inst:P)
            // instruction_cmpxchg_strong(inst:P)
            if (pCmpxchg->isWeak())
                rel_instruction_cmpxchg_weak.add({inst_str});
            else
                rel_instruction_cmpxchg_strong.add({inst_str});
            // instruction_cmpxchg_volatile(inst:P)
            if (pCmpxchg->isVolatile())
                rel_instruction_cmpxchg_volatile.add({inst_str});
//            // instruction_cmpxchg_succ_ordering(inst:P, ord:ORD)
//            AtomicOrdering succ_ord = pCmpxchg->getSuccessOrdering();
//            rel_instruction_cmpxchg_succ_ordering.add({inst_str, get_ordering_kind(succ_ord)});
//            // instruction_cmpxchg_fail_ordering(inst:P, ord:ORD)
//            AtomicOrdering fail_ord = pCmpxchg->getFailureOrdering();
//            rel_instruction_cmpxchg_fail_ordering.add({inst_str, get_ordering_kind(fail_ord)});
            // instruction_cmpxchg_addr(inst:P, ptr:V)
            Value * pAddr = pCmpxchg->getPointerOperand();
            rel_instruction_cmpxchg_addr.add({inst_str, rev_value_map[pAddr]});
            // instruction_cmpxchg_cmp(inst:P, var:V)
            Value * pCmp = pCmpxchg->getCompareOperand();
            rel_instruction_cmpxchg_cmp.add({inst_str, rev_value_map[pCmp]});
            // instruction_cmpxchg_new(inst:P, new:V)
            Value * pNew = pCmpxchg->getNewValOperand();
            rel_instruction_cmpxchg_new.add({inst_str, rev_value_map[pNew]});
        } else if(auto * pAtomicrmw = dyn_cast<llvm::AtomicRMWInst>(pInst)){
            // instruction_atomicrmw(inst:P)
            rel_instruction_atomicrmw.add({inst_str});
            // instruction_atomicrmw_volatile(inst:P)
            if (pAtomicrmw->isVolatile())
                rel_instruction_atomicrmw_volatile.add({inst_str});
//            // instruction_atomicrmw_ordering(inst:P, ord:ORD)
//            AtomicOrdering ord = pAtomicrmw->getOrdering();
//            rel_instruction_atomicrmw_ordering.add({inst_str, get_ordering_kind(ord)});
            // instruction_atomicrmw_<bop>(inst:P, addr:V, val:V)
            Value * pAddr = pAtomicrmw->getPointerOperand();
            Value * pVal = pAtomicrmw->getPointerOperand();
            AtomicRMWInst::BinOp op = pAtomicrmw->getOperation();
            switch (op) {
                case AtomicRMWInst::Xchg:
                    rel_instruction_atomicrmw_xchg.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Add:
                    rel_instruction_atomicrmw_add.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Sub:
                    rel_instruction_atomicrmw_sub.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::And:
                    rel_instruction_atomicrmw_and.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Nand:
                    rel_instruction_atomicrmw_nand.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Or:
                    rel_instruction_atomicrmw_or.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Xor:
                    rel_instruction_atomicrmw_xor.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Max:
                    rel_instruction_atomicrmw_max.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::Min:
                    rel_instruction_atomicrmw_min.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::UMax:
                    rel_instruction_atomicrmw_umax.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::UMin:
                    rel_instruction_atomicrmw_umin.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::FAdd:
                    rel_instruction_atomicrmw_fadd.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::FSub:
                    rel_instruction_atomicrmw_fsub.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::FMax:
                    rel_instruction_atomicrmw_fmax.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::FMin:
                    rel_instruction_atomicrmw_fmin.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;
                case AtomicRMWInst::BAD_BINOP:
                    rel_instruction_atomicrmw_bad.add({inst_str, rev_value_map[pAddr], rev_value_map[pVal]});
                    break;

            }
        } else if(auto * pGep = dyn_cast<llvm::GetElementPtrInst>(pInst)){
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pGep]});
            add_op_rel(pGep, pGep);
        } else if(auto * pCast = dyn_cast<llvm::CastInst>(pInst)){
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pCast]});
            add_op_rel(pCast, pCast);
        } else if(auto * pIcmp = dyn_cast<llvm::ICmpInst>(pInst)){
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pIcmp]});
            add_op_rel(pIcmp, pIcmp);
        } else if(auto * pFcmp = dyn_cast<llvm::FCmpInst>(pInst)){
            // instruction_op(inst:P)
            rel_instruction_op.add({inst_str});
            // instruction_op_res(inst:P, res:V)
            rel_instruction_op_res.add({inst_str, rev_value_map[pFcmp]});
            add_op_rel(pFcmp, pFcmp);
        } else if(auto * pPhi = dyn_cast<llvm::PHINode>(pInst)){
            // instruction_phi(inst:P)
            rel_instruction_phi.add({inst_str});
            // instruction_phi_res(inst:P, res:V)
            Value * pRes = pPhi;
            rel_instruction_phi_res.add({inst_str, rev_value_map[pRes]});
            // instruction_phi_npairs(inst:P, n:Z)
            unsigned num_ins = pPhi->getNumIncomingValues();
            rel_instruction_phi_npairs.add({inst_str, to_string(num_ins)});
            // instruction_phi_pair(inst:P, i:Z, var:V, l:B)
            for (unsigned in_id = 0; in_id < num_ins; ++in_id) {
                Value * pVar = pPhi->getIncomingValue(in_id);
                BasicBlock * pLabel = pPhi->getIncomingBlock(in_id);
                rel_instruction_phi_pair.add({inst_str, to_string(in_id), rev_value_map[pVar], rev_bb_map[pLabel]});
            }
        } else if (auto * pSelect = dyn_cast<llvm::SelectInst>(pInst)){
            // instruction_select(inst:P)
            rel_instruction_select.add({inst_str});
            // instruction_select_expr(inst:P, res:V, cond:V, true_v:V, false_v:V)
            Value * pRes = pSelect;
            Value * pFlag = pSelect->getCondition();
            Value * pTrue = pSelect->getTrueValue();
            Value * pFalse = pSelect->getFalseValue();
            rel_instruction_select_expr.add({inst_str, rev_value_map[pRes], rev_value_map[pFlag], rev_value_map[pTrue], rev_value_map[pFalse]});
        } else if (auto * pFreeze = dyn_cast<llvm::FreezeInst>(pInst)){
            // instruction_freeze(inst:P)
            rel_instruction_freeze.add({inst_str});
            // instruction_freeze_var(inst:P, var:V)
            Value * pVar = pFreeze->getOperand(0);
            rel_instruction_freeze_var.add({inst_str, rev_value_map[pVar]});
        } else if(auto * pCall = dyn_cast<llvm::CallInst>(pInst)){
            // instruction_call(inst:P)
            rel_instruction_call.add({inst_str});
            // instruction_call_void(inst:P)
            // instruction_call_res(inst:P, var:V)
            if (pCall->getType()->isVoidTy()) {
                rel_instruction_call_void.add({inst_str});
            } else {
                Value * pRes = pCall;
                rel_instruction_call_res.add({inst_str, rev_value_map[pRes]});
            }
            // instruction_call_static(inst:P, func:M)
            // instruction_call_dynamic(inst:P, fptr:V)
            if (Function * pFunc = pCall->getCalledFunction()) {
                rel_instruction_call_static.add({inst_str, rev_func_map[pFunc]});
            } else {
                Value * pFptr = pCall->getCalledOperand();
                rel_instruction_call_dynamic.add({inst_str, rev_value_map[pFptr]});
            }
            // instruction_call_nargs(inst:P, n:Z)
            unsigned num_args = pCall->arg_size();
            rel_instruction_call_nargs.add({inst_str, to_string(num_args)});
            // instruction_call_arg(inst:p, i:Z, arg:V)
            for (unsigned arg_idx = 0; arg_idx < num_args; ++arg_idx) {
                Value * pArg = pCall->getArgOperand(arg_idx);
                rel_instruction_call_arg.add({inst_str, to_string(arg_idx), rev_value_map[pArg]});
            }
            // TODO rel_instruction_call_sig
            // TODO rel_instruction_call_tail
            // TODO rel_instruction_call_fn_attr, rel_instruction_return_attr, rel_instruction_param_attr
            // TODO rel_instruction_call_conv
        } else if(auto * pVAArg = dyn_cast<llvm::VAArgInst>(pInst)){
            // instruction_vaarg(inst:P)
            rel_instruction_vaarg.add({inst_str});
            // instruction_vaarg_expr(inst:P, res:V, list:V)
            Value * pRes = pVAArg;
            Value * pList = pVAArg->getPointerOperand();
            rel_instruction_vaarg_expr.add({inst_str, rev_value_map[pRes], rev_value_map[pList]});
        } else if (auto * pLandingPad = dyn_cast<llvm::LandingPadInst>(pInst)) {
            // instruction_landingpad(inst:P)
            rel_instruction_landingpad.add({inst_str});
            // instruction_landingpad_res(inst:P, res:V)
            Value * pRes = pLandingPad;
            rel_instruction_landingpad_res.add({inst_str, rev_value_map[pRes]});
            // instruction_landingpad_cleanup(inst:P)
            // instruction_landingpad_nocleanup(inst:P)
            if (pLandingPad->isCleanup())
                rel_instruction_landingpad_cleanup.add({inst_str});
            else
                rel_instruction_landingpad_nocleanup.add({inst_str});
            // instruction_landingpad_nclses(inst:P, n:Z)
            unsigned num_clses = pLandingPad->getNumClauses();
            rel_instruction_landingpad_nclses.add({inst_str, to_string(num_clses)});
            // instruction_landingpad_cls_catch(inst:P, i:Z, v:V)
            // instruction_landingpad_cls_filter(inst:P, i:Z, c:V)
            for (unsigned cls_idx = 0; cls_idx < num_clses; ++cls_idx) {
                if (pLandingPad->isCatch(cls_idx)) {
                    Value * pVar = pLandingPad->getClause(cls_idx);
                    rel_instruction_landingpad_cls_catch.add({inst_str, to_string(cls_idx), rev_value_map[pVar]});
                } else {
                    Constant * pConst = pLandingPad->getClause(cls_idx);
                    rel_instruction_landingpad_cls_filter.add({inst_str, to_string(cls_idx), rev_value_map[pConst]});
                }
            }
        } else if (auto * pCatchPad = dyn_cast<llvm::CatchPadInst>(pInst)) {
            // instruction_catchpad(inst:P)
            rel_instruction_catchpad.add({inst_str});
            // instruction_catchpad_res(inst:P, res:V)
            Value * pRes = pCatchPad;
            rel_instruction_catchpad_res.add({inst_str, rev_value_map[pRes]});
            // instruction_catchpad_within(inst:P, v:V)
            Value * pCatch = pCatchPad->getCatchSwitch();
            rel_instruction_catchpad_within.add({inst_str, rev_value_map[pCatch]});
            // instruction_catchpad_nargs(inst:P, n:Z)
            unsigned num_args = pCatchPad->getNumArgOperands();
            rel_instruction_catchpad_nargs.add({inst_str, to_string(num_args)});
            // instruction_catchpad_arg(inst:P, i:Z, arg:V)
            for (unsigned arg_idx = 0; arg_idx < num_args; ++arg_idx) {
                Value * pArg = pCatchPad->getArgOperand(arg_idx);
                rel_instruction_catchpad_arg.add({inst_str, to_string(arg_idx), rev_value_map[pArg]});
            }
        } else if (auto * pCleanupPad = dyn_cast<llvm::CleanupPadInst>(pInst)) {
            // instruction_cleanuppad(inst:P)
            rel_instruction_cleanuppad.add({inst_str});
            // instruction_cleanuppad_res(inst:P, res:V)
            Value * pRes = pCleanupPad;
            rel_instruction_cleanuppad_res.add({inst_str, rev_value_map[pRes]});
            // instruction_cleanuppad_within(inst:P, parent:B)
            Value * pWithin = pCleanupPad->getParentPad();
            rel_instruction_cleanuppad_within.add({inst_str, rev_value_map[pWithin]});
            // instruction_cleanuppad_nargs(inst:P, n:Z)
            unsigned num_args = pCleanupPad->getNumArgOperands();
            rel_instruction_cleanuppad_nargs.add({inst_str, to_string(num_args)});
            // instruction_cleanuppad_arg(inst:P, i:Z, arg:V)
            for (unsigned arg_idx = 0; arg_idx < num_args; ++arg_idx) {
                Value * pArg = pCleanupPad->getArgOperand(arg_idx);
                rel_instruction_cleanuppad_arg.add({inst_str, to_string(arg_idx), rev_value_map[pArg]});
            }
        }
    }
}


//string IRManager::get_conv_kind(llvm::CallingConv::ID id){
//    return "";
//}
//
//
//string IRManager::get_ordering_kind(llvm::AtomicOrdering ao){
//    std::string ordering_kind = "";
//    switch(ao){
//        case llvm::AtomicOrdering::Acquire:
//        ordering_kind = "Acquire";
//        break;
//        case llvm::AtomicOrdering::AcquireRelease:
//        ordering_kind = "AcquireRelease";
//        break;
//        /*
//        //last kind has the same value with sequentiallyconsistent
//        case llvm::AtomicOrdering::LAST:
//        ordering_kind = "LAST";
//        break;
//        */
//        case llvm::AtomicOrdering::Monotonic:
//        ordering_kind = "Monotonic";
//        break;
//        case llvm::AtomicOrdering::NotAtomic:
//        ordering_kind = "NotAtomic";
//        break;
//        case llvm::AtomicOrdering::Release:
//        ordering_kind = "Release";
//        break;
//        case llvm::AtomicOrdering::SequentiallyConsistent:
//        ordering_kind = "SequentiallyConsistent";
//        break;
//        case llvm::AtomicOrdering::Unordered:
//        ordering_kind = "Unordered";
//        break;
//        default:
//        printf("something is error\n");
//    }
//    return ordering_kind;
//}
//
//
//string IRManager::get_visibility_string(llvm::GlobalValue::VisibilityTypes gv_ty){
//    string ty_string="";
//    switch(gv_ty){
//        case llvm::GlobalValue::VisibilityTypes::DefaultVisibility:
//        ty_string = "DefaultVisibility";
//        break;
//        case llvm::GlobalValue::VisibilityTypes::HiddenVisibility:
//        ty_string = "HiddenVisibility";
//        break;
//        case llvm::GlobalValue::VisibilityTypes::ProtectedVisibility:
//        ty_string = "ProtectedVisibility";
//        break;
//        default:
//        break;
//    }
//    return ty_string;
//}
//
//
//string IRManager::get_linkage_string(llvm::GlobalValue::LinkageTypes gv_ty){
//    string ty_string="";
//    switch(gv_ty){
//        case llvm::GlobalValue::LinkageTypes::AppendingLinkage:
//        ty_string = "AppendingLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::AvailableExternallyLinkage:
//        ty_string = "AvailableExternallyLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::CommonLinkage:
//        ty_string = "CommonLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::ExternalLinkage:
//        ty_string = "ExternalLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::ExternalWeakLinkage:
//        ty_string = "ExternalWeakLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::InternalLinkage:
//        ty_string = "InternalLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::LinkOnceAnyLinkage:
//        ty_string = "LinkOnceAnyLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::LinkOnceODRLinkage:
//        ty_string = "LinkOnceODRLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::PrivateLinkage:
//        ty_string = "PrivateLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::WeakAnyLinkage:
//        ty_string = "WeakAnyLinkage";
//        break;
//        case llvm::GlobalValue::LinkageTypes::WeakODRLinkage:
//        ty_string = "WeakODRLinkage";
//        break;
//        default:
//        break;
//    }
//    return ty_string;
//
//}
//
//
//string IRManager::get_mode_string(llvm::GlobalValue::ThreadLocalMode gv_ty){
//    string ty_string="";
//    switch(gv_ty){
//        case llvm::GlobalValue::ThreadLocalMode::GeneralDynamicTLSModel:
//        ty_string = "GeneralDynamicTLSModel";
//        break;
//        case llvm::GlobalValue::ThreadLocalMode::InitialExecTLSModel:
//        ty_string = "InitialExecTLSModel";
//        break;
//        case llvm::GlobalValue::ThreadLocalMode::LocalDynamicTLSModel:
//        ty_string = "LocalDynamicTLSModel";
//        break;
//        case llvm::GlobalValue::ThreadLocalMode::LocalExecTLSModel:
//        ty_string = "LocalExecTLSModel";
//        break;
//        case llvm::GlobalValue::ThreadLocalMode::NotThreadLocal:
//        ty_string = "NotThreadLocal";
//        break;
//        default:
//        break;
//    }
//    return ty_string;
//}

