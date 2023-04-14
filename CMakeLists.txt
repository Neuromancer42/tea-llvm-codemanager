cmake_minimum_required(VERSION 3.15)
project(tea_llvm_codemanager)

# Note: match the build environment for LLVM
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
add_compile_options("-fno-rtti")
add_compile_options("-fno-exceptions")

add_compile_options("-Werror" "-Wall")

find_package(LLVM REQUIRED CONFIG HINTS "${LLVM_DIR}")
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in ${LLVM_DIR}")

find_package(Protobuf REQUIRED)
message(STATUS "Found Protobuf ${Protobuf_VERSION}")

include_directories(${LLVM_INCLUDE_DIRS})
#include_directories(/home/aourbro/Desktop/protobuf/src)
#include_directories(/home/aourbro/Desktop/protobuf/third_party/abseil-cpp)
#include_directories(${CMAKE_CURRENT_SOURCE_DIR}/pbhs)
message(STATUS "Include LLVM headers in: ${LLVM_INCLUDE_DIRS}")
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

include_directories(include)
include_directories(pbhs)

add_library(trgt_lib pbhs/trgt.pb.cc)
target_link_libraries(trgt_lib ${Protobuf_LIBRARIES})

add_library(irmanager_lib lib/irmanger.cpp)
add_library(instrumentmng_lib lib/instrumentmng.cpp)
add_library(testmanager_lib lib/testManager.cpp)
target_link_libraries(irmanager_lib ${llvm_libs})
target_link_libraries(instrumentmng_lib ${llvm_libs})
target_link_libraries(testmanager_lib ${llvm_libs})

add_executable(irmanager_parser parser/main.cpp)
target_link_libraries(irmanager_parser irmanager_lib)
target_link_libraries(irmanager_parser trgt_lib)
target_link_libraries(irmanager_parser instrumentmng_lib)
target_link_libraries(irmanager_parser testmanager_lib)

option(BUILD_RPC "build RPC server" OFF)
if(BUILD_RPC)
    find_package(Protobuf REQUIRED)
    message(STATUS "Found Protobuf ${Protobuf_VERSION}")
    find_package(gRPC CONFIG REQUIRED)
    message(STATUS "Found gRPC ${gRPC_VERSION}")
    find_program(gRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)

    get_filename_component(TEA_SERVICE_PROTO_DIR "../proto" ABSOLUTE)
    set(TEA_SERVICE_SRC_DIR "${CMAKE_CURRENT_BINARY_DIR}/proto-src")
    file(MAKE_DIRECTORY ${TEA_SERVICE_SRC_DIR})

    set(TEA_trgt_PROTO "${TEA_SERVICE_PROTO_DIR}/analysis/trgt.proto")
    set(TEA_analysis_PROTO "${TEA_SERVICE_PROTO_DIR}/analysis/analysis.proto")
    set(TEA_trgt_SRCS
            "${TEA_SERVICE_SRC_DIR}/analysis/trgt.pb.cc")
    set(TEA_trgt_HDRS
            "${TEA_SERVICE_SRC_DIR}/analysis/trgt.pb.h")
    add_custom_command(
            OUTPUT ${TEA_trgt_SRCS} ${TEA_trgt_HDRS}
            COMMAND ${Protobuf_PROTOC_EXECUTABLE}
            ARGS --cpp_out "${TEA_SERVICE_SRC_DIR}"
                -I "${TEA_SERVICE_PROTO_DIR}"
                "${TEA_trgt_PROTO}"
            DEPENDS "${TEA_trgt_PROTO}")
    set(TEA_analysis_SRCS
            "${TEA_SERVICE_SRC_DIR}/analysis/analysis.pb.cc"
            "${TEA_SERVICE_SRC_DIR}/analysis/analysis.grpc.pb.cc")
    set(TEA_SERVICE_HDRS
            "${TEA_SERVICE_SRC_DIR}/analysis/analysis.pb.h"
            "${TEA_SERVICE_SRC_DIR}/analysis/analysis.grpc.pb.h")
    add_custom_command(
            OUTPUT ${TEA_analysis_SRCS} ${TEA_analysis_HDRS}
            COMMAND ${Protobuf_PROTOC_EXECUTABLE}
            ARGS --grpc_out "${TEA_SERVICE_SRC_DIR}"
                --cpp_out "${TEA_SERVICE_SRC_DIR}"
                -I "${TEA_SERVICE_PROTO_DIR}"
                --plugin=protoc-gen-grpc="${gRPC_CPP_PLUGIN_EXECUTABLE}"
                "${TEA_analysis_PROTO}"
            DEPENDS "${TEA_analysis_PROTO}")


    add_executable(irmanager_server src/rpc_server.cpp ${TEA_analysis_SRCS} ${TEA_trgt_SRCS})
    target_include_directories(irmanager_server PUBLIC ${TEA_SERVICE_SRC_DIR})
    target_link_libraries(irmanager_server irmanager_lib gRPC::grpc++_reflection gRPC::grpc++ protobuf::libprotobuf)
endif()
