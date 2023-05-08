//
// Created by Yifan Chen on 2023/5/8.
//

#ifndef TEA_LLVM_CODEMANAGER_REACHABLEM_H
#define TEA_LLVM_CODEMANAGER_REACHABLEM_H

#include "instr_factory.h"
#include <llvm/IR/IRBuilder.h>
#include <llvm/Linker/Linker.h>

namespace tea {
    class Instr_reachableM : public AbstractInstr {
    private:
        llvm::Type *intType;
        inline static const std::string func_name = "__tea__reachableM";
        inline static const std::string code =
                "void __tea__reachableM(unsigned tid){\n"
                "    TEA_LOG(\"reachableM %u\\n\", tid);\n"
                "}\n";
        llvm::FunctionCallee callee_reachableM;

    public:
        inline static const std::string NAME = "reachableM";
        inline static const RelInfo INFO = {{"M"}, "reachableM(m:M):mark reachable methods"};

        explicit Instr_reachableM(IRManager_Instr *pIRM) : AbstractInstr(pIRM) {
            llvm::Module *module = irm->get_module();
            intType = llvm::Type::getInt32Ty(module->getContext());
            llvm::Type *voidType = llvm::Type::getVoidTy(module->getContext());
            llvm::FunctionType *ReachableFuncTy = llvm::FunctionType::get(voidType, {intType}, false);
            callee_reachableM = module->getOrInsertFunction(func_name, ReachableFuncTy);
        }

        ~Instr_reachableM() override = default;

        std::string gen_instr_code() override {
            return code;
        }

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
}

#endif //TEA_LLVM_CODEMANAGER_REACHABLEM_H
