
main:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000100000470 <_switch_eg>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: 31 c0                       	xorl	%eax, %eax
100000476: 48 83 c6 9c                 	addq	$-0x64, %rsi
10000047a: 48 83 fe 06                 	cmpq	$0x6, %rsi
10000047e: 77 21                       	ja	0x1000004a1 <_switch_eg+0x31>
100000480: 48 8d 0d 29 00 00 00        	leaq	0x29(%rip), %rcx        ## 0x1000004b0 <_switch_eg+0x40>
100000487: 48 63 34 b1                 	movslq	(%rcx,%rsi,4), %rsi
10000048b: 48 01 ce                    	addq	%rcx, %rsi
10000048e: ff e6                       	jmpq	*%rsi
100000490: 48 0f af ff                 	imulq	%rdi, %rdi
100000494: eb 08                       	jmp	0x10000049e <_switch_eg+0x2e>
100000496: 48 83 c7 0a                 	addq	$0xa, %rdi
10000049a: 48 83 c7 0b                 	addq	$0xb, %rdi
10000049e: 48 89 f8                    	movq	%rdi, %rax
1000004a1: 48 89 02                    	movq	%rax, (%rdx)
1000004a4: 5d                          	popq	%rbp
1000004a5: c3                          	retq
1000004a6: 48 8d 04 7f                 	leaq	(%rdi,%rdi,2), %rax
1000004aa: 48 8d 04 87                 	leaq	(%rdi,%rax,4), %rax
1000004ae: eb f1                       	jmp	0x1000004a1 <_switch_eg+0x31>
1000004b0: f6 ff                       	idivb	%bh
1000004b2: ff ff                       	<unknown>
1000004b4: f1                          	<unknown>
1000004b5: ff ff                       	<unknown>
1000004b7: ff e6                       	jmpq	*%rsi
1000004b9: ff ff                       	<unknown>
1000004bb: ff ea                       	<unknown>
1000004bd: ff ff                       	<unknown>
1000004bf: ff e0                       	jmpq	*%rax
1000004c1: ff ff                       	<unknown>
1000004c3: ff f1                       	pushq	%rcx
1000004c5: ff ff                       	<unknown>
1000004c7: ff e0                       	jmpq	*%rax
1000004c9: ff ff                       	<unknown>
1000004cb: ff 0f                       	decl	(%rdi)
1000004cd: 1f                          	<unknown>
1000004ce: 40 00 55 48                 	addb	%dl, 0x48(%rbp)

00000001000004d0 <_main>:
# [SETUP] -----------------------------------------
# Initial stack set up
1000004d0: 55                          	pushq	%rbp
1000004d1: 48 89 e5                    	movq	%rsp, %rbp
1000004d4: 53                          	pushq	%rbx
# Scanf preparation and call
1000004d5: 48 83 ec 18                 	subq	$0x18, %rsp
1000004d9: 48 8d 3d 90 00 00 00        	leaq	0x90(%rip), %rdi        ## 0x100000570 <_scanf+0x100000570>
1000004e0: 31 db                       	xorl	%ebx, %ebx
1000004e2: 48 8d 75 e8                 	leaq	-0x18(%rbp), %rsi
1000004e6: 48 8d 55 f0                 	leaq	-0x10(%rbp), %rdx
1000004ea: 31 c0                       	xorl	%eax, %eax
1000004ec: e8 79 00 00 00              	callq	0x10000056a <_scanf+0x10000056a>
1000004f1: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
# Inlined function STARTS HERE
1000004f5: 48 83 c1 9c                 	addq	$-0x64, %rcx    # n - 100, shrink range to 0~6
1000004f9: 48 83 f9 06                 	cmpq	$0x6, %rcx  # Compare n-100 and 6
1000004fd: 77 25                       	ja	0x100000524 <_main+0x54>    # Jump (unsigned pov) to default if above
# main stack operation
1000004ff: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax

# [JUMP TABLE OP] -----------------------------------------
# Get the absolute address for jump table
100000503: 48 8d 15 3e 00 00 00        	leaq	0x3e(%rip), %rdx        ## 0x100000548 <_main+0x78>
10000050a: 48 63 0c 8a                 	movslq	(%rdx,%rcx,4), %rcx # Move stored address (offset) to %rcx based on index
10000050e: 48 01 d1                    	addq	%rdx, %rcx  # Add 0x100000548 to offset, get the absolute case address (in %rcx)
100000511: ff e1                       	jmpq	*%rcx   # Indirect via %rcx

# [CASES_PART_1] -----------------------------------------
# Case 106: val *= val; break;
100000513: 48 0f af c0                 	imulq	%rax, %rax
100000517: eb 08                       	jmp	0x100000521 <_main+0x51>    # Jump to printf
# Case 102: val += 10;
100000519: 48 83 c0 0a                 	addq	$0xa, %rax
# Case 103: val += 11; break;
10000051d: 48 83 c0 0b                 	addq	$0xb, %rax

# [BREAK PROCEDURE] -----------------------------------------
# *dest = val;
100000521: 48 89 c3                    	movq	%rax, %rbx
# Printf preparation and call
100000524: 48 8d 3d 4e 00 00 00        	leaq	0x4e(%rip), %rdi        ## 0x100000579 <_scanf+0x100000579>
10000052b: 48 89 de                    	movq	%rbx, %rsi
10000052e: 31 c0                       	xorl	%eax, %eax
100000530: e8 2f 00 00 00              	callq	0x100000564 <_scanf+0x100000564>
# Ending up function
100000535: 31 c0                       	xorl	%eax, %eax
100000537: 48 83 c4 18                 	addq	$0x18, %rsp
10000053b: 5b                          	popq	%rbx
10000053c: 5d                          	popq	%rbp
10000053d: c3                          	retq
# Main function ENDS HERE

# [CASES_PART_2] -----------------------------------------
# Case 100: val *= 13; break;
10000053e: 48 8d 0c 40                 	leaq	(%rax,%rax,2), %rcx
100000542: 48 8d 1c 88                 	leaq	(%rax,%rcx,4), %rbx
100000546: eb dc                       	jmp	0x100000524 <_main+0x54>

# [JUMP TABLE] -----------------------------------------
100000548: f6 ff                       	idivb	%bh
10000054a: ff ff                       	<unknown>
10000054c: dc ff                       	fdivr	%st, %st(7)
10000054e: ff ff                       	<unknown>
100000550: d1 ff                       	sarl	%edi
100000552: ff ff                       	<unknown>
100000554: d5 ff ff                    	<unknown>
100000557: ff cb                       	decl	%ebx
100000559: ff ff                       	<unknown>
10000055b: ff dc                       	<unknown>
10000055d: ff ff                       	<unknown>
10000055f: ff cb                       	decl	%ebx
100000561: ff ff                       	<unknown>
100000563: ff                          	<unknown>

Disassembly of section __TEXT,__stubs:

0000000100000564 <__stubs>:
100000564: ff 25 96 0a 00 00           	jmpq	*0xa96(%rip)            ## 0x100001000 <_scanf+0x100001000>
10000056a: ff 25 98 0a 00 00           	jmpq	*0xa98(%rip)            ## 0x100001008 <_scanf+0x100001008>
