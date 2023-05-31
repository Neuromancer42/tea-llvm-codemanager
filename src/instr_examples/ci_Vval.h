//
// Created by Yifan Chen on 2023/5/8.
//

#ifndef TEA_LLVM_CODEMANAGER_CI_VVAL_H
#define TEA_LLVM_CODEMANAGER_CI_VVAL_H

#include "instr_factory.h"
#include <llvm/IR/IRBuilder.h>
#include <llvm/Linker/Linker.h>

namespace tea {
    class Instr_ci_Vval : public AbstractInstr {
    private:
        llvm::Type * intType;
        inline static const std::string func_name = "__tea__ci_Vval";
        inline static const std::string code =
                "void __tea__ci_Vval(unsigned tid, int val){\n"
                "    TEA_LOG(\"ci_Vval %u %d\\n\", tid, val);\n"
                "}\n";
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

        std::string gen_instr_code() override {
            return code;
        }

        bool instrument(unsigned instr_id, const std::vector<std::string> &tuple) override {
            assert(tuple.size() == 2 && "error attr size of ci_Vval");
            if (tuple.size() != 2) return false;
            const std::string &var_repr = tuple[0];
            const std::string &itv_repr = tuple[1];
            if (itv_repr.substr(0, 5) != "Itv:{" && itv_repr.substr(0, 5) != "Itv:[") {
                std::cout << "*** instr_ci_Vval: skip ci_Vval( " << var_repr << " , " << itv_repr << " )" << std::endl;
                return false;
            }

            llvm::Value * pVal = irm->get_value(var_repr);
            assert(pVal != nullptr && "unknown value for ci_Vval");
//            if (pVal == nullptr) return false;
            if (auto *pValInst = llvm::dyn_cast<llvm::Instruction>(pVal)) {
                // Note: only check phi results to reduce instrument sites
                if (llvm::isa<llvm::PHINode>(pValInst) || llvm::isa<llvm::LoadInst>(pValInst)) {
                    llvm::Instruction *instrSite = pValInst->getNextNonDebugInstruction();
                    while (llvm::isa_and_nonnull<llvm::PHINode>(instrSite)) {
                        instrSite = instrSite->getNextNonDebugInstruction();
                    }
                    std::unique_ptr<llvm::IRBuilder<>> builder;
                    if (instrSite != nullptr) {
                        builder = std::make_unique<llvm::IRBuilder<>>(instrSite);
                    } else {
                        builder = std::make_unique<llvm::IRBuilder<>>(pValInst->getParent());
                    }
                    llvm::Value *v_instr_id = llvm::ConstantInt::get(intType, instr_id);
                    builder->CreateCall(callee_ci_Vval, {v_instr_id, pValInst});

                    // associate instr_id with abstract interval
                    instr_itv_map.emplace(instr_id, itv_repr);
                    std::cout << "*** instr_ci_Vval: instrumented #" << instr_id << " ci_Vval( " << var_repr
                              << " , " << itv_repr << " )" << std::endl;

                    return true;
                }
            }
            std::cout << "*** instr_ci_Vval: skip ci_Vval( " << var_repr << " , " << itv_repr << " )" << std::endl;
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

#endif //TEA_LLVM_CODEMANAGER_CI_VVAL_H
