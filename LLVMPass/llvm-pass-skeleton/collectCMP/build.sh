#!/bin/sh
clang -emit-llvm -c -I/data2/zhangzheng1/tools/llvm-6.0/usr/local/include SanCovTraceCmp.cpp
clang -emit-llvm -c test.c
llvm-link SanCovTraceCmp.bc test.bc -o main.bc
clang++ -fPIC CollectCMP.cpp -o libCollectCMPPass.so `llvm-config --cxxflags` -shared
opt -load libCollectCMPPass.so -CollectCMPPass main.bc -o final.bc
