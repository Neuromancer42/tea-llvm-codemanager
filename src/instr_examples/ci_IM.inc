//
// Created by Yifan Chen on 2023/5/8.
//

#ifndef TEA_LLVM_CODEMANAGER_CI_IM_INC
#define TEA_LLVM_CODEMANAGER_CI_IM_INC

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

        bool instrument(unsigned instr_id, const std::vector<int> &tuple, const std::map<std::string, ProgramDom> &dom_map) override {
            assert(tuple.size() == 2 && "error attr size of ci_Vval");
//            if (tuple.size() != 2) return false;
            assert(dom_map.find("P") != dom_map.end() && "no dom P");
            const auto &domP = dom_map.find("P")->second;
            assert(dom_map.find("M") != dom_map.end() && "no dom M");
            const auto &domM = dom_map.find("M")->second;
            const std::string & invk_inst_repr = domP.get(tuple[0]);
            const std::string & meth_repr = domM.get(tuple[1]);
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
                    std::cout << "*** instr_ci_IM: instrumented #" << instr_id << " ci_IM( " << invk_inst_repr << " , " << meth_repr << " )" << std::endl;
                    return true;
                }
            } else {
                std::cout << "*** instr_ci_IM: not a callsite ci_IM( " << invk_inst_repr << " , " << meth_repr << " )" << std::endl;
            }
            return false;
        }

        std::map<unsigned, bool> process(std::vector<int> &trace) override {
            assert(trace.size() == 2 && "mismatch trace length for ci_IM");
            unsigned instr_id = trace[0];
            bool call_edge_matched = trace[1];
            std::cout << "*** instr_ci_IM: " << ( call_edge_matched ? "triggered" : "negated") << " #" << instr_id << std::endl;
            std::map<unsigned,bool> res;
            if (call_edge_matched) {
                res.try_emplace(instr_id, call_edge_matched);
            }
            return res;
        }
    };

    InstrFactoryInstance<Instr_ci_IM> factory_ci_IM;
}

#endif //TEA_LLVM_CODEMANAGER_CI_IM_INC
