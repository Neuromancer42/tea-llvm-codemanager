#ifndef TEA_LLVM_CODEMANAGER_TESTMANAGER_H
#define TEA_LLVM_CODEMANAGER_TESTMANAGER_H

#include <llvm/IR/Module.h>

#include <utility>
#include <map>

#include "trgt.pb.h"

#define BASIC_TUPLE_NUM 32
#define MAX_LINE 256

enum{
    Reachable,
    CI,
    IM,
    PHVal,
};

namespace tea {
    class TestManager {
    private:
        std::string name;
        std::unique_ptr<llvm::LLVMContext> ctx;
        std::unique_ptr<llvm::Module> mod;
        analysis::Tuple **tuples;
        int tuples_size = BASIC_TUPLE_NUM;
        int tuples_count = 0;

    public:
        TestManager(const std::string& name, std::unique_ptr<llvm::Module> mod);
        explicit TestManager(const std::string& filename);

        std::string get_name();

        bool handleTestReq(std::map<std::string, std::string> options, std::vector<std::string> args);

        std::vector<tea::analysis::Tuple> getTriggeredTuples();
        std::vector<tea::analysis::Tuple> getNegatedTuples();
    };
}
#endif
