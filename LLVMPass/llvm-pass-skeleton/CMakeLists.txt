cmake_minimum_required(VERSION 3.1)
project(LLVMPass)

# support C++14 features used by LLVM 10.0.0
set(CMAKE_CXX_STANDARD 14)

find_package(LLVM REQUIRED CONFIG)

# set(CMAKE_POSITION_INDEPENDENT_CODE ON)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

message(STATUS "Found LLVM ${LLVM_DEFINITIONS}")
message(STATUS "Found LLVM ${LLVM_INCLUDE_DIRS}")
message(STATUS "Found LLVM ${LLVM_LIBRARY_DIRS}")

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(skeleton)  # Use your pass name here.
add_subdirectory(collectCMP)