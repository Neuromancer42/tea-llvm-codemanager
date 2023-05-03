#ifndef TEA_LLVM_CODEMANAGER_INSTRUMENT_H
#define TEA_LLVM_CODEMANAGER_INSTRUMENT_H

#include <llvm/IR/Module.h>

#include <utility>
#include <map>

#include "trgt.pb.h"

namespace tea {
    class InstrumentMgr {
    private:
        std::string name;
        std::unique_ptr<llvm::LLVMContext> ctx;
        std::unique_ptr<llvm::Module> mod;

        bool instrumentReachableM(int i, std::string methName);
        bool instrumentCIIM(int i, std::string invk, std::string meth);
        bool instrumentPHVal(int i, std::string inst, std::string var);

    public:
        InstrumentMgr(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit InstrumentMgr(const std::string& filename);

        std::string get_name();

        llvm::Module* get_mod();

        bool handleInstrumentReq(std::map<std::string, std::string> options, std::vector<tea::analysis::Tuple> tuples);

        std::vector<tea::analysis::RelInfo> getObservableRels();
    };
}

#define TRAVERSE_INST_OPEN \
    for(Module::iterator mi = M->begin(); mi != M->end(); mi++){    \
        Function &F = *mi;  \
        if(F.isDeclaration()) continue; \
        for(Function::iterator fi = F.begin(); fi != F.end(); fi++){    \
            BasicBlock &BB = *fi;   \
            for(BasicBlock::iterator bbi = BB.begin(); bbi != BB.end(); bbi++){ \
                Instruction &I = *bbi; 
#define TRAVERSE_INST_CLOSE \
    }   }   }
#endif