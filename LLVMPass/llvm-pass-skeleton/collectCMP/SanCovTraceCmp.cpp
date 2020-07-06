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
	ATTRIBUTE_NO_SANITIZE_ALL void
	HandleCmp(char* type, uintptr_t PC, T Arg1, T Arg2)
{
	printf("[%s] [0x%x] 0x%x 0x%x\n", type, PC, Arg1, Arg2);
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
void __sanitizer_cov_trace_cmp8(uint64_t Arg1, uint64_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
// Now the __sanitizer_cov_trace_const_cmp[1248] callbacks just mimic
// the behaviour of __sanitizer_cov_trace_cmp[1248] ones. This, however,
// should be changed later to make full use of instrumentation.
void __sanitizer_cov_trace_const_cmp8(uint64_t Arg1, uint64_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp4(uint32_t Arg1, uint32_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp4(uint32_t Arg1, uint32_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp2(uint16_t Arg1, uint16_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp2(uint16_t Arg1, uint16_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_cmp1(uint8_t Arg1, uint8_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_const_cmp1(uint8_t Arg1, uint8_t Arg2)
{
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	HandleCmp("CMP", PC, Arg1, Arg2);
}

ATTRIBUTE_INTERFACE
ATTRIBUTE_NO_SANITIZE_ALL
ATTRIBUTE_TARGET_POPCNT
void __sanitizer_cov_trace_switch(uint64_t Val, uint64_t *Cases)
{
	// Val = SI->getCondition();
	uint64_t N = Cases[0];
	uint64_t ValSizeInBits = Cases[1];
	uint64_t *Vals = Cases + 2;
	// Skip the most common and the most boring case.
	// if (Vals[N - 1] < 256 && Val < 256) return;
	uintptr_t PC = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
	size_t i;
	uint64_t Token = 0;
	for (i = 0; i < N; i++)
	{
		// Token = Val ^ Vals[i];
		// if (Val < Vals[i]) break;
		if (ValSizeInBits == 16) HandleCmp("SWITCH-16", PC + i, static_cast<uint16_t>(Vals[i]), (uint16_t)(0));
		else if (ValSizeInBits == 32) HandleCmp("SWITCH-32", PC + i, static_cast<uint32_t>(Vals[i]), (uint32_t)(0));
		else HandleCmp("SWITCH-64", PC + i, Vals[i], (uint64_t)(0));
	}

	// if (ValSizeInBits == 16) HandleCmp(PC + i, static_cast<uint16_t>(Token), (uint16_t)(0));
	// else if (ValSizeInBits == 32) HandleCmp(PC + i, static_cast<uint32_t>(Token), (uint32_t)(0));
	// else HandleCmp(PC + i, Token, (uint64_t)(0));
}