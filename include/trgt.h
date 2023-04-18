//
// Created by Yifan Chen on 2023/4/18.
//

#ifndef TEA_LLVM_CODEMANAGER_TRGT_H
#define TEA_LLVM_CODEMANAGER_TRGT_H

#include "utils.h"
#include <string>

namespace tea {
    class ProgramDom : indexed_set<std::string> {
    private:
        std::string name;
        std::string description;
    public:
        explicit ProgramDom(std::string&& dom_name, std::string&& dom_desc = "")
            : indexed_set<std::string>(), name(dom_name), description(dom_desc)
            {}
        void set_name(std::string&& dom_name) {
            name = dom_name;
        }
        const std::string& get_name() {
            return name;
        }
        void set_description(std::string&& dom_desc) {
            description = dom_desc;
        }
        const std::string& get_description() {
            return description;
        }
        void save(const std::string& dir_name, bool save_dom_map = true) {
            // TODO
        }
        void load(const std::string& dir_name, bool with_dom_map = true) {
            // TODO
        }
    };

    typedef std::vector<std::vector<std::string>> ProgramRel;
}
#endif //TEA_LLVM_CODEMANAGER_TRGT_H
