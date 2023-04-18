//
// Created by Yifan Chen on 2023/4/18.
//

#ifndef TEA_LLVM_CODEMANAGER_UTILS_H
#define TEA_LLVM_CODEMANAGER_UTILS_H

#include <vector>
#include <unordered_map>

namespace tea {
    template<typename T>
    class indexed_set {
    private:
        std::vector<T> elem_list;
        std::unordered_map<T, std::size_t> elem_map;
    public:
        indexed_set() = default;
        void clear() {
            elem_map.clear();
            elem_list.clear();
        }
        bool contains(const T& elem) {
            return elem_map.find(elem) != elem_map.end();
        }
        long index_of(const T& elem) {
            auto it = elem_map.find(elem);
            if (it == elem_map.end()) {
                return -1;
            } else {
                return it->second;
            }
        }
        long get_or_add(T&& elem) {
            auto result = elem_map.try_emplace({elem, elem_list.size()});
            if (result.second) {
                elem_list.emplace_back(elem);
            }
            return result.first->second;
        }
        bool add(T&& elem) {
            auto result = elem_map.try_emplace({elem, elem_list.size()});
            if (result.second) {
                elem_list.emplace_back(elem);
            }
            return result.second;
        }
        const T& operator[] (std::size_t idx) const {
            return elem_list[idx];
        }
        size_t size() {
            return elem_list.size();
        }
    };
}
#endif //TEA_LLVM_CODEMANAGER_UTILS_H
