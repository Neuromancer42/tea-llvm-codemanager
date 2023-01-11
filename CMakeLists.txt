cmake_minimum_required(VERSION 3.13)
project(tea_llvm_codemanager)

# Note: match the build environment for LLVM
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
add_compile_options("-fno-rtti")
add_compile_options("-fno-exceptions")

add_compile_options("-Werror -Wall")

find_package(LLVM REQUIRED CONFIG HINTS "${LLVM_DIR}")
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIR})
message(STATUS "Include LLVM headers in: ${LLVM_INCLUDE_DIR}")
add_definitions(${LLVM_DEFINITIONS})
message(STATUS "Adding LLVM definitions: ${LLVM_DEFINITIONS}")

if(LLVM_LINK_LLVM_DYLIB)
    set(llvm_libs LLVM)
else()
    llvm_map_components_to_libnames(
            llvm_libs
            core
            support
            irreader
    )
endif()

add_executable(llvm_manager_standalone src/standalone.cpp)

target_link_libraries(llvm_manager_standalone ${llvm_libs})

