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
        const std::string& get_name() const {
            return name;
        }
        void set_description(std::string&& dom_desc) {
            description = dom_desc;
        }
        const std::string& get_description() const {
            return description;
        }
        void save(const std::string& dir_name, bool save_dom_map = true) const {
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
        bool contains(const std::string& elem) const {
            unsigned id = elements.idFor(elem);
            return id > 0;
        }
        unsigned index_of(const std::string& elem) const {
            unsigned id = elements.idFor(elem);
            return id;
        }
    };

//    typedef std::vector<std::vector<std::string>> ProgramRel;
    template<size_t N>
    class ProgramRel {
    private:
        std::string name;
        std::array<const ProgramDom*, N> domains;
        std::string description;
        std::vector<std::array<unsigned, N>> tuples;
    public:
        ProgramRel(std::string&& rel_name, std::array<const ProgramDom*, N>&& doms, std::string && desc = "")
            : name(rel_name), domains(doms), description(desc), tuples()
            {}
        void set_name(std::string&& rel_name) {
            name = rel_name;
        }
        const std::string& get_name() const {
            return name;
        }
        void set_domains(std::array<std::string, N>&& doms) {
            domains = doms;
        }
        const std::array<std::string, N>& get_domains() const {
            return domains;
        }
        void set_domain(size_t i, std::string&& dom) {
            domains[i] = dom;
        }
        const std::string& get_domain(size_t i) const {
            return domains[i];
        }
        void set_description(std::string&& rel_desc) {
            description = rel_desc;
        }
        const std::string& get_description() const {
            return description;
        }
        void save(const std::string& dir_name) const {
            // TODO
        }
        void load(const std::string& dir_name) {
            // TODO
        }

        void add(std::array<std::string, N>&& attrs) {
            std::array<unsigned, N> tuple;
            for (unsigned i = 0; i < N; ++i) {
                const std::string& attr = attrs[i];
                assert(!attr.empty() && "empty attribute!");
                const ProgramDom * dom = domains[i];
                unsigned id = dom->index_of(attr);
                assert(id > 0 && "element not in domain!");
                tuple[i] = id;
            }
//            std::cout << std::endl;
            tuples.push_back(tuple);
        }
    };
}
#endif //TEA_LLVM_CODEMANAGER_TRGT_H
