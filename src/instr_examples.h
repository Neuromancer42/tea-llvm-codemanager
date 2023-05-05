//
// Created by Yifan Chen on 2023/5/6.
//

#ifndef TEA_LLVM_CODEMANAGER_INSTR_EXAMPLES_H
#define TEA_LLVM_CODEMANAGER_INSTR_EXAMPLES_H

#include "instr_factory.h"
#include <llvm/IR/IRBuilder.h>

namespace tea {
    class Instr_reachableM : public AbstractInstr {
    private:
        llvm::Type * intType;
        inline static const std::string func_name = "__tea__reachableM";
        llvm::FunctionCallee callee_reachableM;

    public:
        inline static const std::string NAME = "reachableM";
        inline static const RelInfo INFO = {{"M"}, "reachableM(m:M):mark reachable methods"};
        explicit Instr_reachableM(IRManager_Instr *pIRM) : AbstractInstr(pIRM) {
            llvm::Module *module = irm->get_module();
            intType = llvm::Type::getInt32Ty(module->getContext());
            llvm::Type * voidType = llvm::Type::getVoidTy(module->getContext());
            llvm::Type * ReachableFuncTy = llvm::FunctionType::get(voidType, {intType}, false);
            callee_reachableM = module->getOrInsertFunction(func_name, ReachableFuncTy);
        }
        ~Instr_reachableM() override = default;

        bool instrument(unsigned instr_id, const std::vector<std::string> &tuple) override {
            assert(tuple.size() == 1 && "error attr size of reachableM");
            if (tuple.size() != 1) return false;

            const std::string &meth_repr = tuple[0];

            llvm::Function *func = irm->get_function(meth_repr);
            assert(func != nullptr && "unknown function for reachableM");
            if (func == nullptr || func->isDeclaration())
                return false;

            llvm::BasicBlock &BB0 = func->getEntryBlock();
            llvm::Instruction *pInst0 = BB0.getFirstNonPHI();
            llvm::IRBuilder<> builder(pInst0);

            llvm::Value *v_instr_id = llvm::ConstantInt::get(intType, instr_id);
            builder.CreateCall(callee_reachableM, {v_instr_id});

            return true;
        }

        std::pair<unsigned, bool> process(std::vector<int> &trace) override {
            assert(trace.size() == 1 && "mismatch trace length for reachableM");
            unsigned instr_id = trace[0];
            return std::make_pair(instr_id, true);
        }
    };

    InstrFactoryInstance<Instr_reachableM> factory_reachableM;

    class Instr_ci_IM : public AbstractInstr {
    private:
        llvm::Type * intType;
        inline static const std::string func_name = "__tea__ci_IM";
        llvm::FunctionCallee callee_ci_IM;
    public:
        inline static const std::string NAME = "ci_IM";
        inline static const RelInfo INFO = {{"P", "M"}, "ci_IM(i:P,m:M):check dynamic calls"};
        explicit Instr_ci_IM(IRManager_Instr *pIRM) : AbstractInstr(pIRM) {
            llvm::Module * module = irm->get_module();
            intType = llvm::Type::getInt32Ty(module->getContext());
            auto fnPtrType = llvm::PointerType::get(module->getContext(), module->getDataLayout().getProgramAddressSpace());
            auto voidType = llvm::Type::getVoidTy(module->getContext());
            llvm::FunctionType * CIIMFuncTy = llvm::FunctionType::get(voidType, {intType, fnPtrType, fnPtrType}, false);
            callee_ci_IM = module->getOrInsertFunction(func_name, CIIMFuncTy);
        }
        ~Instr_ci_IM() override = default;

        bool instrument(unsigned instr_id, const std::vector<std::string> &tuple) override {
            assert(tuple.size() == 2 && "error attr size of ci_Vval");
//            if (tuple.size() != 2) return false;
            const std::string & invk_inst_repr = tuple[0];
            const std::string & meth_repr = tuple[1];
            //Type *ptr8Type = Type::getInt8PtrTy(M->getContext());

            llvm::Instruction * pInst = irm->get_instruction(invk_inst_repr);
            assert (pInst != nullptr && "unknown instruction for ci_IM");
            llvm::Function *pFunc = irm->get_function(meth_repr);
            assert (pFunc != nullptr && "unknown function for ci_IM");
//            if (pInst == nullptr || pFunc == nullptr) return false;
            if (auto *pInvkInst = llvm::dyn_cast<llvm::CallInst>(pInst)) {
                llvm::Value *pAddr = pInvkInst->getCalledOperand();
                llvm::IRBuilder<> builder(pInvkInst);

                llvm::Value *v_instr_id = llvm::ConstantInt::get(intType, instr_id);

                builder.CreateCall(callee_ci_IM, {v_instr_id, pAddr, pFunc});
                return true;
            }
            return false;
        }

        std::pair<unsigned, bool> process(std::vector<int> &trace) override {
            assert(trace.size() == 2 && "mismatch trace length for ci_IM");
            unsigned instr_id = trace[0];
            bool call_edge_matched = trace[1];
            return std::make_pair(instr_id, call_edge_matched);
        }
    };

    InstrFactoryInstance<Instr_ci_IM> factory_ci_IM;

    class Instr_ci_Vval : public AbstractInstr {
    private:
        llvm::Type * intType;
        inline static const std::string func_name = "__tea__ci_Vval";
        llvm::FunctionCallee callee_ci_Vval;
        std::map<unsigned, std::string> instr_itv_map;
    public:
        inline static const std::string NAME = "ci_Vval";
        inline static const RelInfo INFO = {
                {"V", "U"},
                 "ci_Vval(var:V, itv:U):check if variable `var` satisfies interval `U`"
        };
        explicit Instr_ci_Vval(IRManager_Instr *pIRM) : AbstractInstr(pIRM) {
            llvm::Module * module = irm->get_module();
            intType = llvm::Type::getInt32Ty(module->getContext());
            auto voidType = llvm::Type::getVoidTy(module->getContext());
            auto VValFuncTy = llvm::FunctionType::get(voidType, {intType, intType}, false);
            callee_ci_Vval = module->getOrInsertFunction(func_name, VValFuncTy);
        }
        ~Instr_ci_Vval() override = default;

        bool instrument(unsigned instr_id, const std::vector<std::string> &tuple) override {
            assert(tuple.size() == 2 && "error attr size of ci_Vval");
            if (tuple.size() != 2) return false;
            const std::string &var_repr = tuple[0];
            const std::string &itv_repr = tuple[1];
            if (itv_repr.substr(0, 5) != "Itv:{" && itv_repr.substr(0, 5) != "Itv:[")
                return false;

            llvm::Value * pVal = irm->get_value(var_repr);
            assert(pVal != nullptr && "unknown value for ci_Vval");
//            if (pVal == nullptr) return false;
            if (auto *pValInst = llvm::dyn_cast<llvm::Instruction>(pVal)) {
                llvm::IRBuilder<> builder(pValInst->getNextNonDebugInstruction());

                llvm::Value *v_instr_id = llvm::ConstantInt::get(intType, instr_id);
                builder.CreateCall(callee_ci_Vval, {v_instr_id, pValInst});

                // associate instr_id with abstract interval
                instr_itv_map.emplace(instr_id, itv_repr);
                return true;
            }
            return false;
        }

        std::pair<unsigned, bool> process(std::vector<int> &trace) override {
            assert(trace.size() == 2 && "mismatch trace length for ci_Vval");
            unsigned instr_id = trace[0];
            int value = trace[1];
            const std::string &itv = instr_itv_map.at(instr_id);
            if (itv.substr(0, 5) == "Itv:{") {
                int v = stoi(itv.substr(5, itv.length() - 5 - 1));
                bool sat = v == value;
                return std::make_pair(instr_id, sat);
            } else if (itv.substr(0, 5) == "Itv:[") {
                unsigned comma_pos = itv.find(',');
                int l = stoi(itv.substr(5, comma_pos - 5));
                int r = stoi(itv.substr(comma_pos + 1, itv.length() - comma_pos - 1));
                bool sat = l <= value && value <= r;
                return std::make_pair(instr_id, sat);
            } else {
                assert(false && "malformed interval for ci_Vval");
//                return std::make_pair(instr_id, false);
            }
        }
    };
    InstrFactoryInstance<Instr_ci_Vval> factory_ci_Vval;
}
#endif //TEA_LLVM_CODEMANAGER_INSTR_EXAMPLES_H
