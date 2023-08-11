//
// Created by Yifan Chen on 2023/4/18.
//

#ifndef TEA_LLVM_CODEMANAGER_TRGT_H
#define TEA_LLVM_CODEMANAGER_TRGT_H

#include <llvm/ADT/UniqueVector.h>
#include <string>
#include <iostream>
#include <fstream>
#include <filesystem>

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

        ProgramDom(const ProgramDom&) = delete;

        ProgramDom& operator=(const ProgramDom&) = delete;

        ProgramDom(ProgramDom&&) = default;

        ProgramDom& operator=(ProgramDom&&) = default;

        ~ProgramDom() = default;

        [[nodiscard]] const std::string& get_name() const {
            return name;
        }

        [[nodiscard]] const std::string& get_description() const {
            return description;
        }

        [[nodiscard]] std::string save(const std::filesystem::path& outpath) const {
            std::filesystem::path mappath = outpath / (name + ".map");

            std::ofstream mapofs;
            mapofs.open(mappath);
            for (const auto & elem : elements) {
                mapofs << elem << std::endl;
            }
            mapofs.close();
            std::filesystem::path dompath = outpath / (name + ".dom");
            std::ofstream domofs;
            domofs.open(dompath);
            domofs << name << " " << elements.size() << " "
                << std::filesystem::absolute(outpath).string()
                << std::endl;
            return std::filesystem::absolute(outpath);
        }

        void load(const std::filesystem::path& inpath) {
            std::filesystem::path mappath = inpath / (name + ".map");
            std::ifstream mapifs(mappath);
            if (mapifs.fail()) {
                std::cout << "*** no dom map file found! " << mappath << std::endl;
                return;
            }
            std::string elem;
            while (getline(mapifs, elem)) {
                add(elem);
            }
        }

        void add(const std::string& elem) {
            assert(!elem.empty() && "empty element!");
//            std::cout << "dom_" << name << ":\t" << elem << std::endl;
            elements.insert(elem);
        }

        [[nodiscard]] bool contains(const std::string& elem) const {
            unsigned id = elements.idFor(elem);
            return id > 0;
        }

        [[nodiscard]] unsigned index_of(const std::string& elem) const {
            unsigned id = elements.idFor(elem);
            return id;
        }

        [[nodiscard]] const std::string & get(int id) const {
            return elements[id];
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

        ProgramRel(const ProgramRel&) = delete;

        ProgramRel& operator=(const ProgramRel&) = delete;

        ProgramRel(ProgramRel&&) = default;

        ProgramRel& operator=(ProgramRel&&) = default;

        ~ProgramRel() = default;

        [[nodiscard]] const std::string& get_name() const {
            return name;
        }

        [[nodiscard]] std::array<std::string, N> get_sign() const {
            std::array<std::string, N> sign;
            for (size_t i = 0; i < N; ++i)
                sign[i] = domains[i]->get_name();
            return sign;
        }

        [[nodiscard]] const std::string& get_description() const {
            return description;
        }

        [[nodiscard]] std::string save(const std::filesystem::path& outpath) const {
            std::filesystem::path csvpath = outpath / (name + ".csv");
            std::ofstream ofs;
            ofs.open(csvpath);
            for (const auto & tuple : tuples) {
                for (size_t i = 0; i < N; ++i) {
                    if (i > 0)
                        ofs << "\t";
                    ofs << tuple[i];
                }
                ofs << std::endl;
            }
            ofs.close();
            // TODO: clear in-memory vector<array> after saving?
            return std::filesystem::absolute(csvpath);
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
