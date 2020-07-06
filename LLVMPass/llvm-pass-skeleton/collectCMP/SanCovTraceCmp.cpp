#define ATTRIBUTE_INTERFACE __attribute__((visibility("default")))
#define ATTRIBUTE_NO_SANITIZE_ALL
#define ATTRIBUTE_TARGET_POPCNT __attribute__((target("popcnt")))
#define ALWAYS_INLINE __attribute__((always_inline))

#include <stdint.h>
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

// clang -emit-llvm -c -I/data2/zhangzheng1/tools/llvm-6.0/usr/local/include  SanCovTraceCmp.cpp

template <class T>
ATTRIBUTE_TARGET_POPCNT ALWAYS_INLINE
ATTRIBUTE_NO_SANITIZE_ALL
void HandleCmp(uintptr_t PC, T Arg1, T Arg2) 
{
  printf("0x%x 0x%x\n", Arg1, Arg2);
    // outs() << Arg1 << " " << Arg2 << "\n";
    // uint64_t ArgXor = Arg1 ^ Arg2;
    // if (sizeof(T) == 4)
    //     // TORC4.Insert(ArgXor, Arg1, Arg2);
    // else if (sizeof(T) == 8)
    //     // TORC8.Insert(ArgXor, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp8(uint64_t Arg1, uint64_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
// Now the __sanitizer_cov_trace_const_cmp[1248] callbacks just mimic
// the behaviour of __sanitizer_cov_trace_cmp[1248] ones. This, however,
// should be changed later to make full use of instrumentation.
void __sanitizer_cov_trace_const_cmp8(uint64_t Arg1, uint64_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp4(uint32_t Arg1, uint32_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp4(uint32_t Arg1, uint32_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp2(uint16_t Arg1, uint16_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp2(uint16_t Arg1, uint16_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp1(uint8_t Arg1, uint8_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp1(uint8_t Arg1, uint8_t Arg2) {
  uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
  HandleCmp(PC, Arg1, Arg2);
}