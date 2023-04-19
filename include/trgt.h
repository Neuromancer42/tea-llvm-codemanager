//
// Created by Yifan Chen on 2023/4/18.
//

#ifndef TEA_LLVM_CODEMANAGER_TRGT_H
#define TEA_LLVM_CODEMANAGER_TRGT_H

#include <llvm/ADT/UniqueVector.h>
#include <string>
#include <iostream>

namespace tea {
    class ProgramDom  {
    private:
        std::string name;
        std::string description;
        llvm::UniqueVector<std::string> elements;
    public:
        explicit ProgramDom(std::string&& dom_name, std::string&& dom_desc = "")
            : name(dom_name), description(dom_desc), elements()
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
        void add(const std::string& elem) {
            assert(!elem.empty() && "empty element!");
//            std::cout << "dom_" << name << ":\t" << elem << std::endl;
            elements.insert(elem);
        }
    };

//    typedef std::vector<std::vector<std::string>> ProgramRel;
    template<size_t N>
    class ProgramRel {
    private:
        std::string name;
        std::array<std::string, N> domains;
        std::string description;
        std::vector<std::array<std::string, N>> tuples;
    public:
        ProgramRel(std::string&& rel_name, std::array<std::string, N>&& doms, std::string && desc = "")
            : name(rel_name), domains(doms), description(desc), tuples()
            {}
        void set_name(std::string&& rel_name) {
            name = rel_name;
        }
        const std::string& get_name() {
            return name;
        }
        void set_domains(std::array<std::string, N>&& doms) {
            domains = doms;
        }
        const std::array<std::string, N>& get_domains() {
            return domains;
        }
        void set_domain(size_t i, std::string&& dom) {
            domains[i] = dom;
        }
        const std::string& get_domain(size_t i) {
            return domains[i];
        }
        void set_description(std::string&& rel_desc) {
            description = rel_desc;
        }
        const std::string& get_description() {
            return description;
        }
        void save(const std::string& dir_name) {
            // TODO
        }
        void load(const std::string& dir_name) {
            // TODO
        }
        void add(std::array<std::string, N>&& attrs) {
//            std::cout << "rel_" << name << ":";
            for (const std::string& attr : attrs) {
                assert(!attr.empty() && "empty attribute!");
//                std::cout << "\t" << attr;
            }
//            std::cout << std::endl;
            tuples.push_back(attrs);
        }
    };
}
#endif //TEA_LLVM_CODEMANAGER_TRGT_H
