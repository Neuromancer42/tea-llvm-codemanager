//
// Created by Yifan Chen on 2023/5/8.
//

#ifndef TEA_LLVM_CODEMANAGER_CI_IM_H
#define TEA_LLVM_CODEMANAGER_CI_IM_H

#include "instr_factory.h"
#include <llvm/IR/IRBuilder.h>
#include <llvm/Linker/Linker.h>

namespace tea {
    class Instr_ci_IM : public AbstractInstr {
    private:
        llvm::Type * intType;
        inline static const std::string func_name = "__tea__ci_IM";
        inline static const std::string code =
                "void __tea__ci_IM(unsigned tid, void * called, void * target){\n"
                "    int match = called == target;\n"
                "    TEA_LOG(\"ci_IM %u %d\\n\", tid, match);\n"
                "}\n";
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

        std::string gen_instr_code() override {
            return code;
        }

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
                if (pInvkInst->isIndirectCall()) {
                    llvm::Value *pAddr = pInvkInst->getCalledOperand();
                    llvm::IRBuilder<> builder(pInvkInst);

                    llvm::Value *v_instr_id = llvm::ConstantInt::get(intType, instr_id);

                    builder.CreateCall(callee_ci_IM, {v_instr_id, pAddr, pFunc});
                    return true;
                }
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
}

#endif //TEA_LLVM_CODEMANAGER_CI_IM_H
