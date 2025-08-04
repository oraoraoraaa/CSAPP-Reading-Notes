	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_switch_eg                      ## -- Begin function switch_eg
	.p2align	4, 0x90
_switch_eg:                             ## @switch_eg
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	addq	$-100, %rsi
	cmpq	$6, %rsi
	ja	LBB0_7
## %bb.1:
	leaq	LJTI0_0(%rip), %rcx # Store the absolute address of jump table in %rcx
	movslq	(%rcx,%rsi,4), %rsi # Sign extend the offset to %rsi
	addq	%rcx, %rsi  # Absolute address of jump table + offset = Absolute address of case
	jmpq	*%rsi # Indirect jump
LBB0_5:
	imulq	%rdi, %rdi
	jmp	LBB0_6
LBB0_3:
	addq	$10, %rdi
LBB0_4:
	addq	$11, %rdi
LBB0_6:
	movq	%rdi, %rax
LBB0_7:
	movq	%rax, (%rdx)
	popq	%rbp
	retq
LBB0_2:
	leaq	(%rdi,%rdi,2), %rax
	leaq	(%rdi,%rax,4), %rax
	jmp	LBB0_7
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L0_0_set_2, LBB0_2-LJTI0_0
.set L0_0_set_7, LBB0_7-LJTI0_0
.set L0_0_set_3, LBB0_3-LJTI0_0
.set L0_0_set_4, LBB0_4-LJTI0_0
.set L0_0_set_5, LBB0_5-LJTI0_0
LJTI0_0:
	.long	L0_0_set_2
	.long	L0_0_set_7
	.long	L0_0_set_3
	.long	L0_0_set_4
	.long	L0_0_set_5
	.long	L0_0_set_7
	.long	L0_0_set_5
	.end_data_region
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	leaq	L_.str(%rip), %rdi
	xorl	%ebx, %ebx
	leaq	-24(%rbp), %rsi
	leaq	-16(%rbp), %rdx
	xorl	%eax, %eax
	callq	_scanf
	movq	-16(%rbp), %rcx
	addq	$-100, %rcx
	cmpq	$6, %rcx
	ja	LBB1_7
## %bb.1:
	movq	-24(%rbp), %rax
	leaq	LJTI1_0(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rcx
	addq	%rdx, %rcx
	jmpq	*%rcx
LBB1_5:
	imulq	%rax, %rax
	jmp	LBB1_6
LBB1_3:
	addq	$10, %rax
LBB1_4:
	addq	$11, %rax
LBB1_6:
	movq	%rax, %rbx
LBB1_7:
	leaq	L_.str.1(%rip), %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB1_2:
	leaq	(%rax,%rax,2), %rcx
	leaq	(%rax,%rcx,4), %rbx
	jmp	LBB1_7
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L1_0_set_2, LBB1_2-LJTI1_0
.set L1_0_set_7, LBB1_7-LJTI1_0
.set L1_0_set_3, LBB1_3-LJTI1_0
.set L1_0_set_4, LBB1_4-LJTI1_0
.set L1_0_set_5, LBB1_5-LJTI1_0
LJTI1_0:
	.long	L1_0_set_2
	.long	L1_0_set_7
	.long	L1_0_set_3
	.long	L1_0_set_4
	.long	L1_0_set_5
	.long	L1_0_set_7
	.long	L1_0_set_5
	.end_data_region
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%ld, %ld"

L_.str.1:                               ## @.str.1
	.asciz	"%ld"

.subsections_via_symbols
