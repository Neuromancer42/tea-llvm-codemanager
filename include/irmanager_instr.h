//
// Created by Yifan Chen on 2023/5/4.
//

#ifndef TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H
#define TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H

#include "irmanager_base.h"
#include <sstream>
#include <utility>

namespace tea {
    class IRManager_Instr;

    class AbstractInstr {
    protected:
        IRManager_Instr * irm;
        explicit AbstractInstr(IRManager_Instr * pIRM) : irm(pIRM) {}
    public:
        virtual ~AbstractInstr() = default;
        virtual bool instrument(unsigned instr_id, const std::vector<int>& tuple, const std::map<std::string, ProgramDom>& dom_map) = 0;
        virtual void process(std::vector<int>& trace) = 0;
        virtual std::map<unsigned, bool> collect() = 0;
        virtual std::string gen_instr_code() = 0;
    };

    class IRManager_Instr : public IRManager {
    public:
        typedef std::pair<std::string, std::vector<int>> Tuple;
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
            instr_code << "#define TEA_LOGFILE " << std::filesystem::path(log_file) << "\n";
            instr_code << "#define TEA_LOG(fstr, ...) \\\n"
                          "    if (tea_fp == NULL) tea_fp = fopen(TEA_LOGFILE, \"w\"); \\\n"
                          "    else tea_fp = fopen(TEA_LOGFILE, \"a\"); \\\n"
                          "    fprintf(tea_fp, fstr, __VA_ARGS__);       \\\n"
                          "    fclose(tea_fp);  \n" << std::endl;
            instr_code << "static FILE * tea_fp = NULL;\n" << std::endl;
        }

        bool handle_instrument_req(const std::string & rel_name, const std::vector<int>& tuple, const std::map<std::string, ProgramDom>& dom_map);

        void prepare_test_env(const std::string & content_dir);
        
        void run_test(const std::vector<std::string> & test_id, const std::vector<std::string> & append_args);
        
        void collect_test_results(const std::string & test_id, std::vector<Tuple> & triggered_tuples, std::vector<Tuple> & negated_tuples);

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

        std::vector<Tuple> instrumented_tuples;
        std::map<std::string, std::unique_ptr<AbstractInstr>> instr_map;
        std::stringstream instr_code;
        std::filesystem::path test_path = workpath / "tea_test";
        std::string log_file = "tea.log";
        std::string instr_code_file = "instrumented.ll";
        std::string instr_func_file = "instr_funcs.c";
        std::string instr_make_file = "tea.Makefile";
//        std::filesystem::path log_path = workpath / log_file;
    };

}
#endif //TEA_LLVM_CODEMANAGER_IRMANAGER_INSTR_H
