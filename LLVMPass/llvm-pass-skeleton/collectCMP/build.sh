#!/bin/sh
clang++ -fPIC CollectCMP.cpp -o libCollectCMPPass.so `llvm-config --cxxflags` -shared
clang -emit-llvm -c -I/data2/zhangzheng1/tools/llvm-6.0/usr/local/include SanCovTraceCmp.cpp
cd catdoc
# clang -emit-llvm -c test.c
# llvm-link SanCovTraceCmp.bc test.bc -o main.bc
llvm-link SanCovTraceCmp.bc catdoc.bc -o main.bc
opt -load libCollectCMPPass.so -CollectCMPPass main.bc -o final.bc
llvm-dis final.bc
# llc -filetype=obj final.bc
# clang final.o -o final
llc final.bc
clang final.s -o final