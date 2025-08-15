	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_promotion_examples             ## -- Begin function promotion_examples
	.p2align	4, 0x90
_promotion_examples:                    ## @promotion_examples
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_str(%rip), %rdi
	callq	_puts
	leaq	L_.str.1(%rip), %rdi
	movl	$256, %esi                      ## imm = 0x100
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.4(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	popq	%rbp
	jmp	_printf                         ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_comparison_examples            ## -- Begin function comparison_examples
	.p2align	4, 0x90
_comparison_examples:                   ## @comparison_examples
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_str.16(%rip), %rdi
	callq	_puts
	leaq	L_str.17(%rip), %rdi
	callq	_puts
	leaq	L_str.18(%rip), %rdi
	callq	_puts
	leaq	L_str.19(%rip), %rdi
	popq	%rbp
	jmp	_puts                           ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_optimization                   ## -- Begin function optimization
	.p2align	4, 0x90
_optimization:                          ## @optimization
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	%edi, %rax
	addq	%rax, (%rdx)
	addb	%sil, (%rcx)
	movl	$6, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_optimization_example           ## -- Begin function optimization_example
	.p2align	4, 0x90
_optimization_example:                  ## @optimization_example
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_str.20(%rip), %rdi
	callq	_puts
	movb	$2, -1(%rbp)
	leaq	L_.str.12(%rip), %rdi
	leaq	-1(%rbp), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.13(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movzbl	-1(%rbp), %esi
	leaq	L_.str.15(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
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
	subq	$16, %rsp
	leaq	L_str(%rip), %rdi
	callq	_puts
	leaq	L_.str.1(%rip), %rdi
	movl	$256, %esi                      ## imm = 0x100
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.4(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_str.16(%rip), %rdi
	callq	_puts
	leaq	L_str.17(%rip), %rdi
	callq	_puts
	leaq	L_str.18(%rip), %rdi
	callq	_puts
	leaq	L_str.19(%rip), %rdi
	callq	_puts
	leaq	L_str.20(%rip), %rdi
	callq	_puts
	movb	$2, -1(%rbp)
	leaq	L_.str.12(%rip), %rdi
	leaq	-1(%rbp), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.13(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movzbl	-1(%rbp), %esi
	leaq	L_.str.15(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"c1 + c2 as int: %d\n"

L_.str.2:                               ## @.str.2
	.asciz	"c1 + c2 as char: %d\n"

L_.str.3:                               ## @.str.3
	.asciz	"c3 + c4 as int: %d\n"

L_.str.4:                               ## @.str.4
	.asciz	"c3 + c4 as char: %c\n"

L_.str.12:                              ## @.str.12
	.asciz	"Char: %d starts in address: %p. "

L_.str.13:                              ## @.str.13
	.asciz	"In bytes: "

L_.str.15:                              ## @.str.15
	.asciz	"%.2x "

L_str:                                  ## @str
	.asciz	"\n--- Type Promotion Examples ---"

L_str.16:                               ## @str.16
	.asciz	"\n--- Comparison Examples ---"

L_str.17:                               ## @str.17
	.asciz	"c doesn't equal uc (expected with promotion)"

L_str.18:                               ## @str.18
	.asciz	"c is negative after promotion (expected)"

L_str.19:                               ## @str.19
	.asciz	"uc is positive after promotion (expected)"

L_str.20:                               ## @str.20
	.asciz	"\n--- Optimization Examples ---"

.subsections_via_symbols
