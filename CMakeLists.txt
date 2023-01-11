cmake_minimum_required(VERSION 3.13)
project(tea_llvm_codemanager)

# Note: match the build environment for LLVM
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

add_compile_options("-fno-rtti")
add_compile_options("-fno-exceptions")

add_executable(tea_llvm_codemanager src/main.cpp)

