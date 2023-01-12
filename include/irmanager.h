//
// Created by Yifan Chen on 2023/1/12.
//

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_H

#include <llvm/IR/Module.h>

#include <utility>

namespace tea {
    class IRManager {
    private:
        std::string name;
        std::unique_ptr<llvm::LLVMContext> ctx;
        std::unique_ptr<llvm::Module> mod;

    public:
        IRManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit IRManager(const std::string& filename);

        std::string get_name();

        // TODO: traverse the module, generating doms&rels
    };
}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_H
