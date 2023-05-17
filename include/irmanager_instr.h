//
// Created by Yifan Chen on 2023/5/4.
//

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H

#include "irmanager_base.h"
#include <sstream>

namespace tea {
    class IRManager_Instr;

    class AbstractInstr {
    protected:
        IRManager_Instr * irm;
        explicit AbstractInstr(IRManager_Instr * pIRM) : irm(pIRM) {}
    public:
        virtual ~AbstractInstr() = default;
        virtual bool instrument(unsigned instr_id, const std::vector<std::string>& tuple) = 0;
        virtual std::pair<unsigned, bool> process(std::vector<int>& trace) = 0;
        virtual std::string gen_instr_code() = 0;
    };

    class IRManager_Instr : public IRManager {
    public:
        typedef std::pair<std::string, std::vector<std::string>> Tuple;
        static IRManager_Instr *
        createFromFile(const std::string &filename, llvm::SMDiagnostic &diag, llvm::LLVMContext &ctx,
                       const std::string &workdir) {
            auto mod = llvm::parseIRFile(filename, diag, ctx);
            if (mod == nullptr) {
                std::cerr << "IRManager: failed to read from " << filename << ":" << std::endl
                          << diag.getMessage().str() << std::endl;
                return nullptr;
            }
            return new IRManager_Instr(filename, std::move(mod), workdir);
        }

        IRManager_Instr(const std::string &name, std::unique_ptr<llvm::Module> mod, const std::string &workdir)
            : IRManager(name, std::move(mod), workdir) {
            instr_code << "#include \"stdio.h\"\n";
            instr_code << "#define TEA_LOGFILE " << std::filesystem::absolute(log_path) << "\n";
            instr_code << "#define TEA_LOG(fstr, ...) \\\n"
                          "    FILE * tea_fp = fopen(TEA_LOGFILE, \"a+\"); \\\n"
                          "    fprintf(tea_fp, fstr, __VA_ARGS__);       \\\n"
                          "    fclose(tea_fp);  \n" << std::endl;
        }

        bool handle_instrument_req(const std::string & rel_name, const std::vector<std::string>& tuple);

        void handle_test_req(const std::vector<std::string> & args, std::vector<Tuple> & triggered_tuples, std::vector<Tuple> & negated_tuples);

        inline llvm::Module * get_module() {
            return module.get();
        }

        inline llvm::Type * get_type(const std::string & ty_repr) {
            auto res = type_map.find(ty_repr);
            if (res != type_map.end())
                return res->second;
            else
                return nullptr;
        }

        inline llvm::BasicBlock * get_basicblock(const std::string & bb_repr) {
            auto res = bb_map.find(bb_repr);
            if (res != bb_map.end())
                return res->second;
            else
                return nullptr;
        }

        inline llvm::Instruction * get_instruction(const std::string & inst_repr) {
            auto res = inst_map.find(inst_repr);
            if (res != inst_map.end())
                return res->second;
            else
                return nullptr;
        }

        inline llvm::Value * get_value(const std::string & val_repr) {
            auto res = value_map.find(val_repr);
            if (res != value_map.end())
                return res->second;
            else
                return nullptr;
        }

        inline llvm::Function * get_function(const std::string & func_repr) {
            auto res = func_map.find(func_repr);
            if (res != func_map.end())
                return res->second;
            else
                return nullptr;
        }

        void register_instr(const std::string & name, std::unique_ptr<AbstractInstr> instr);

    private:
        void gen_instrumented_exe();
        bool compiled = false;

        std::vector<Tuple> instrumented_tuples;
        std::map<std::string, std::unique_ptr<AbstractInstr>> instr_map;
        std::stringstream instr_code;
        std::filesystem::path exe_path = workpath / "instrumented";
        std::filesystem::path log_path = workpath / "tea_log.txt";
        size_t test_id = 0;
    };

}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H
