//
// Created by Yifan Chen on 2023/5/6.
//

#ifndef TEA_LLVM_CODEMANAGER_INSTR_FACTORY_H
#define TEA_LLVM_CODEMANAGER_INSTR_FACTORY_H

#include "irmanager_instr.h"

namespace tea {
    class InstrFactory {
    protected:
        explicit InstrFactory(const std::string &name, const RelInfo &info) {
            factory_map.emplace(name, this);
            info_map.emplace(name, info);
        }

    public:
        static std::map <std::string, RelInfo> info_map;
        static std::map<std::string, InstrFactory *> factory_map;

        virtual std::unique_ptr <AbstractInstr> create(IRManager_Instr *irm) = 0;
    };

    std::map <std::string, RelInfo> InstrFactory::info_map;
    std::map<std::string, InstrFactory *> InstrFactory::factory_map;

    template<typename instrT>
    class InstrFactoryInstance : public InstrFactory {
    public:
        InstrFactoryInstance() : InstrFactory(instrT::NAME, instrT::INFO) {}

        std::unique_ptr <AbstractInstr> create(IRManager_Instr *irm) {
            return std::make_unique<instrT>(irm);
        }
    };
}
#endif //TEA_LLVM_CODEMANAGER_INSTR_FACTORY_H
