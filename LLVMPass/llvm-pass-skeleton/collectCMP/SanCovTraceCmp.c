#include <stdint.h>
#include <stdio.h>

// clang -emit-llvm -c -I/data2/zhangzheng1/tools/llvm-6.0/usr/local/include  SanCovTraceCmp.cpp


void __sanitizer_cov_trace_pc()
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[PC] 0x%x\n", PC);
	// uintptr_t Idx = PC & (((uintptr_t)1 << fuzzer::TracePC::kTracePcBits) - 1);
	// __sancov_trace_pc_pcs[Idx] = PC;
	// __sancov_trace_pc_guard_8bit_counters[Idx]++;
}


void __sanitizer_cov_trace_strcmp(uint64_t *Arg1, uint64_t *Arg2)
{
	fprintf(stderr, "[STRCMP] %s %s\n", Arg1, Arg2);
}



void __sanitizer_cov_trace_cmp8(uint64_t Arg1, uint64_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0)); // the return address of the current function
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



// Now the __sanitizer_cov_trace_const_cmp[1248] callbacks just mimic
// the behaviour of __sanitizer_cov_trace_cmp[1248] ones. This, however,
// should be changed later to make full use of instrumentation.
void __sanitizer_cov_trace_const_cmp8(uint64_t Arg1, uint64_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_cmp4(uint32_t Arg1, uint32_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_const_cmp4(uint32_t Arg1, uint32_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_cmp2(uint16_t Arg1, uint16_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_const_cmp2(uint16_t Arg1, uint16_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_cmp1(uint8_t Arg1, uint8_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_const_cmp1(uint8_t Arg1, uint8_t Arg2)
{
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	fprintf(stderr, "[CMP] [0x%x] 0x%x 0x%x\n", PC, Arg1, Arg2);
}



void __sanitizer_cov_trace_switch(uint64_t Val, uint64_t *Cases)
{
	// Val = SI->getCondition();
	uint64_t N = Cases[0];
	uint64_t ValSizeInBits = Cases[1];
	uint64_t *Vals = Cases + 2;
	// Skip the most common and the most boring case.
	// if (Vals[N - 1] < 256 && Val < 256) return;
	uintptr_t PC = (uintptr_t)(__builtin_return_address(0));
	size_t i;
	uint64_t Token = 0;
	for (i = 0; i < N; i++)
	{
		fprintf(stderr, "[SWITCH] [0x%x] 0x%x\n", PC+i, Vals[i]);
		// Token = Val ^ Vals[i];
		// if (Val < Vals[i]) break;
		// if (ValSizeInBits == 16)
		// 	HandleCmp("SWITCH-16", PC + i, static_cast<uint16_t>(Vals[i]), (uint16_t)(0));
		// else if (ValSizeInBits == 32)
		// 	HandleCmp("SWITCH-32", PC + i, static_cast<uint32_t>(Vals[i]), (uint32_t)(0));
		// else
		// 	HandleCmp("SWITCH-64", PC + i, Vals[i], (uint64_t)(0));
	}

	// if (ValSizeInBits == 16) HandleCmp(PC + i, static_cast<uint16_t>(Token), (uint16_t)(0));
	// else if (ValSizeInBits == 32) HandleCmp(PC + i, static_cast<uint32_t>(Token), (uint32_t)(0));
	// else HandleCmp(PC + i, Token, (uint64_t)(0));
}