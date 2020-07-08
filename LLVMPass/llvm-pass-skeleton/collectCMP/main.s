	.text
	.file	"llvm-link"
	.globl	__sanitizer_cov_trace_pc # -- Begin function __sanitizer_cov_trace_pc
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_pc,@function
__sanitizer_cov_trace_pc:               # @__sanitizer_cov_trace_pc
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str, %rsi
	movq	8(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	stderr, %rdi
	movq	-8(%rbp), %rdx
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	__sanitizer_cov_trace_pc, .Lfunc_end0-__sanitizer_cov_trace_pc
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_strcmp # -- Begin function __sanitizer_cov_trace_strcmp
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_strcmp,@function
__sanitizer_cov_trace_strcmp:           # @__sanitizer_cov_trace_strcmp
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.1, %rax
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	__sanitizer_cov_trace_strcmp, .Lfunc_end1-__sanitizer_cov_trace_strcmp
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_cmp8 # -- Begin function __sanitizer_cov_trace_cmp8
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_cmp8,@function
__sanitizer_cov_trace_cmp8:             # @__sanitizer_cov_trace_cmp8
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movabsq	$.L.str.2, %rax
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	stderr, %rdi
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %r8
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	__sanitizer_cov_trace_cmp8, .Lfunc_end2-__sanitizer_cov_trace_cmp8
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_const_cmp8 # -- Begin function __sanitizer_cov_trace_const_cmp8
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_const_cmp8,@function
__sanitizer_cov_trace_const_cmp8:       # @__sanitizer_cov_trace_const_cmp8
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movabsq	$.L.str.2, %rax
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	stderr, %rdi
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %r8
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end3:
	.size	__sanitizer_cov_trace_const_cmp8, .Lfunc_end3-__sanitizer_cov_trace_const_cmp8
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_cmp4 # -- Begin function __sanitizer_cov_trace_cmp4
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_cmp4,@function
__sanitizer_cov_trace_cmp4:             # @__sanitizer_cov_trace_cmp4
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movl	%edi, -8(%rbp)
	movl	%esi, -4(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	__sanitizer_cov_trace_cmp4, .Lfunc_end4-__sanitizer_cov_trace_cmp4
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_const_cmp4 # -- Begin function __sanitizer_cov_trace_const_cmp4
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_const_cmp4,@function
__sanitizer_cov_trace_const_cmp4:       # @__sanitizer_cov_trace_const_cmp4
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movl	%edi, -8(%rbp)
	movl	%esi, -4(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end5:
	.size	__sanitizer_cov_trace_const_cmp4, .Lfunc_end5-__sanitizer_cov_trace_const_cmp4
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_cmp2 # -- Begin function __sanitizer_cov_trace_cmp2
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_cmp2,@function
__sanitizer_cov_trace_cmp2:             # @__sanitizer_cov_trace_cmp2
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movw	%di, -4(%rbp)
	movw	%si, -2(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movzwl	-4(%rbp), %ecx
	movzwl	-2(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end6:
	.size	__sanitizer_cov_trace_cmp2, .Lfunc_end6-__sanitizer_cov_trace_cmp2
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_const_cmp2 # -- Begin function __sanitizer_cov_trace_const_cmp2
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_const_cmp2,@function
__sanitizer_cov_trace_const_cmp2:       # @__sanitizer_cov_trace_const_cmp2
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movw	%di, -4(%rbp)
	movw	%si, -2(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movzwl	-4(%rbp), %ecx
	movzwl	-2(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end7:
	.size	__sanitizer_cov_trace_const_cmp2, .Lfunc_end7-__sanitizer_cov_trace_const_cmp2
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_cmp1 # -- Begin function __sanitizer_cov_trace_cmp1
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_cmp1,@function
__sanitizer_cov_trace_cmp1:             # @__sanitizer_cov_trace_cmp1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movb	%dil, -2(%rbp)
	movb	%sil, -1(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movzbl	-2(%rbp), %ecx
	movzbl	-1(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end8:
	.size	__sanitizer_cov_trace_cmp1, .Lfunc_end8-__sanitizer_cov_trace_cmp1
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_const_cmp1 # -- Begin function __sanitizer_cov_trace_const_cmp1
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_const_cmp1,@function
__sanitizer_cov_trace_const_cmp1:       # @__sanitizer_cov_trace_const_cmp1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$.L.str.2, %rax
	movb	%dil, -2(%rbp)
	movb	%sil, -1(%rbp)
	movq	8(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	stderr, %rdi
	movq	-16(%rbp), %rdx
	movzbl	-2(%rbp), %ecx
	movzbl	-1(%rbp), %r8d
	movq	%rax, %rsi
	movb	$0, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end9:
	.size	__sanitizer_cov_trace_const_cmp1, .Lfunc_end9-__sanitizer_cov_trace_const_cmp1
	.cfi_endproc
                                        # -- End function
	.globl	__sanitizer_cov_trace_switch # -- Begin function __sanitizer_cov_trace_switch
	.p2align	4, 0x90
	.type	__sanitizer_cov_trace_switch,@function
__sanitizer_cov_trace_switch:           # @__sanitizer_cov_trace_switch
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -64(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -32(%rbp)
	movq	8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -8(%rbp)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jae	.LBB10_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB10_1 Depth=1
	movabsq	$.L.str.3, %rsi
	movq	stderr, %rdi
	movq	-24(%rbp), %rdx
	addq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rcx
	movb	$0, %al
	callq	fprintf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB10_1
.LBB10_4:                               # %for.end
	addq	$64, %rsp
	popq	%rbp
	retq
.Lfunc_end10:
	.size	__sanitizer_cov_trace_switch, .Lfunc_end10-__sanitizer_cov_trace_switch
	.cfi_endproc
                                        # -- End function
	.globl	a                       # -- Begin function a
	.p2align	4, 0x90
	.type	a,@function
a:                                      # @a
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movl	$12, -24(%rbp)
	movl	-24(%rbp), %ebx
	movl	$13, %edi
	movl	%ebx, %esi
	callq	__sanitizer_cov_trace_const_cmp4
	cmpl	$13, %ebx
	jle	.LBB11_2
# %bb.1:                                # %if.then
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB11_3
.LBB11_2:                               # %if.else
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.1.5, %rdi
	movb	$0, %al
	callq	printf
.LBB11_3:                               # %if.end
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movl	$14, -24(%rbp)
	movl	$90, -28(%rbp)
	movl	-28(%rbp), %r14d
	movl	-24(%rbp), %ebx
	movl	%r14d, %edi
	movl	%ebx, %esi
	callq	__sanitizer_cov_trace_cmp4
	cmpl	%ebx, %r14d
	jle	.LBB11_5
# %bb.4:                                # %if.then3
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.2.6, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB11_6
.LBB11_5:                               # %if.else5
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.3.7, %rdi
	movb	$0, %al
	callq	printf
.LBB11_6:                               # %if.end7
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movl	$2, -20(%rbp)
	movl	-20(%rbp), %ebx
	addl	$2, %ebx
	movq	%rbx, %rdi
	movl	$__sancov_gen_cov_switch_values, %esi
	callq	__sanitizer_cov_trace_switch
	movl	%ebx, %eax
	subl	$1, %eax
	je	.LBB11_9
	jmp	.LBB11_7
.LBB11_7:                               # %if.end7
	movl	%ebx, %eax
	subl	$2, %eax
	je	.LBB11_10
	jmp	.LBB11_8
.LBB11_8:                               # %if.end7
	subl	$3, %ebx
	je	.LBB11_11
	jmp	.LBB11_12
.LBB11_9:                               # %sw.bb
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.4.8, %rdi
	movl	-20(%rbp), %esi
	movb	$0, %al
	callq	printf
.LBB11_10:                              # %sw.bb9
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.5, %rdi
	movl	-20(%rbp), %esi
	movb	$0, %al
	callq	printf
.LBB11_11:                              # %sw.bb11
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.6, %rdi
	movl	-20(%rbp), %esi
	movb	$0, %al
	callq	printf
.LBB11_12:                              # %sw.default
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.7, %rdi
	movl	-20(%rbp), %esi
	movb	$0, %al
	callq	printf
# %bb.13:                               # %sw.epilog
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end11:
	.size	a, .Lfunc_end11-a
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -24
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	-16(%rbp), %ebx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	movl	%ebx, %esi
	callq	__sanitizer_cov_trace_const_cmp4
	cmpl	$-1, %ebx
	jle	.LBB12_2
# %bb.1:                                # %if.then
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	callq	a
.LBB12_2:                               # %if.end
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	leaq	-80(%rbp), %rdi
	movb	$0, %al
	callq	gets
	movabsq	$str1, %rsi
	leaq	-80(%rbp), %rbx
	movq	%rbx, %rdi
	callq	__sanitizer_cov_trace_strcmp
	movq	%rbx, %rdi
	movl	$str1, %esi
	callq	strcmp
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %ebx
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	__sanitizer_cov_trace_const_cmp4
	cmpl	$0, %ebx
	jne	.LBB12_4
# %bb.3:                                # %if.then4
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB12_5
.LBB12_4:                               # %if.else
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	movabsq	$.L.str.9, %rdi
	movabsq	$str1, %rdx
	leaq	-80(%rbp), %rsi
	movl	-12(%rbp), %ecx
	movb	$0, %al
	callq	printf
.LBB12_5:                               # %if.end8
	callq	__sanitizer_cov_trace_pc
	#APP
	#NO_APP
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end12:
	.size	main, .Lfunc_end12-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"[PC] 0x%x\n"
	.size	.L.str, 11

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"[STRCMP] %s %s\n"
	.size	.L.str.1, 16

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"[CMP] [0x%x] 0x%x 0x%x\n"
	.size	.L.str.2, 24

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"[SWITCH] [0x%x] 0x%x\n"
	.size	.L.str.3, 22

	.type	str1,@object            # @str1
	.section	.rodata,"a",@progbits
	.globl	str1
str1:
	.asciz	"abcd"
	.size	str1, 5

	.type	str2,@object            # @str2
	.globl	str2
str2:
	.asciz	"abCd"
	.size	str2, 5

	.type	.L.str.4,@object        # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"A\n"
	.size	.L.str.4, 3

	.type	.L.str.1.5,@object      # @.str.1.5
.L.str.1.5:
	.asciz	"A-\n"
	.size	.L.str.1.5, 4

	.type	.L.str.2.6,@object      # @.str.2.6
.L.str.2.6:
	.asciz	"B\n"
	.size	.L.str.2.6, 3

	.type	.L.str.3.7,@object      # @.str.3.7
.L.str.3.7:
	.asciz	"B-\n"
	.size	.L.str.3.7, 4

	.type	__sancov_gen_cov_switch_values,@object # @__sancov_gen_cov_switch_values
	.data
	.p2align	4
__sancov_gen_cov_switch_values:
	.quad	3                       # 0x3
	.quad	32                      # 0x20
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	3                       # 0x3
	.size	__sancov_gen_cov_switch_values, 40

	.type	.L.str.4.8,@object      # @.str.4.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.8:
	.asciz	"Case1: Value is: %d\n"
	.size	.L.str.4.8, 21

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"Case2: Value is: %d\n"
	.size	.L.str.5, 21

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Case3: Value is: %d\n"
	.size	.L.str.6, 21

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"Default: Value is: %d\n"
	.size	.L.str.7, 23

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"EQ\n"
	.size	.L.str.8, 4

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"NEQ\n"
	.size	.L.str.9, 5


	.ident	"clang version 6.0.0 (tags/RELEASE_600/final)"
	.ident	"clang version 6.0.0 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
