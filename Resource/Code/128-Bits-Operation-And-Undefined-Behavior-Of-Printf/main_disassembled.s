
main:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

# void store_mult128(uint128_t *dest, uint64_t x, uint64_t y)
# dest in %rdi, x in %rsi, y in %rdx
0000000100000470 <_store_mult128>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: 48 89 d0                    	movq	%rdx, %rax			# Copy y to %rax
100000477: 48 f7 e6                    	mulq	%rsi				# x * y (unsigned)
10000047a: 48 89 57 08                 	movq	%rdx, 0x8(%rdi)		# Move higher 8 bytes to location "dest + 8"
10000047e: 48 89 07                    	movq	%rax, (%rdi)		# Move lower 8 bytes to location "dest"
100000481: 5d                          	popq	%rbp
100000482: c3                          	retq
100000483: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)

# void div(long x, long y, long *ptr_quotient, long *ptr_remainder)
# x in %rdi, y in %rsi, ptr_quotient in %rdx, ptr_remainder in %rcx
0000000100000490 <_div>:       
100000490: 55                          	pushq	%rbp
100000491: 48 89 e5                    	movq	%rsp, %rbp
100000494: 49 89 d0                    	movq	%rdx, %r8           # Copy ptr_quotient to %r8
100000497: 48 89 f8                    	movq	%rdi, %rax          # Copy x to %rax
10000049a: 48 99                       	cqto                        # Sign extend %rax to %rdx
10000049c: 48 f7 fe                    	idivq	%rsi                # %rdx:%rax / y
10000049f: 49 89 00                    	movq	%rax, (%r8)         # Move quotient to location "ptr_quotient"
1000004a2: 48 89 11                    	movq	%rdx, (%rcx)        # Move remainder to location "ptr_remainder"
1000004a5: 5d                          	popq	%rbp
1000004a6: c3                          	retq
1000004a7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)

00000001000004b0 <_main>:
1000004b0: 55                          	pushq	%rbp
1000004b1: 48 89 e5                    	movq	%rsp, %rbp
1000004b4: 41 56                       	pushq	%r14
1000004b6: 53                          	pushq	%rbx
1000004b7: 48 83 ec 30                 	subq	$0x30, %rsp
1000004bb: 48 c7 45 c8 00 00 00 00     	movq	$0x0, -0x38(%rbp)
1000004c3: 48 c7 45 c0 10 00 00 00     	movq	$0x10, -0x40(%rbp)
1000004cb: 48 c7 45 d8 ff 00 00 00     	movq	$0xff, -0x28(%rbp)
1000004d3: 48 c7 45 d0 00 ff ff ff     	movq	$-0x100, -0x30(%rbp)
1000004db: 48 8d 3d 87 02 00 00        	leaq	0x287(%rip), %rdi       ## 0x100000769 <_puts+0x100000769>
1000004e2: e8 e3 01 00 00              	callq	0x1000006ca <_puts+0x1000006ca>
1000004e7: 48 8b 75 c0                 	movq	-0x40(%rbp), %rsi
1000004eb: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
1000004ef: 48 8d 3d eb 01 00 00        	leaq	0x1eb(%rip), %rdi       ## 0x1000006e1 <_puts+0x1000006e1>
1000004f6: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
1000004fa: 31 c0                       	xorl	%eax, %eax
1000004fc: e8 bd 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000501: 48 8d 3d 01 02 00 00        	leaq	0x201(%rip), %rdi       ## 0x100000709 <_puts+0x100000709>
100000508: 31 c0                       	xorl	%eax, %eax
10000050a: e8 af 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
10000050f: 48 8d 1d fe 01 00 00        	leaq	0x1fe(%rip), %rbx       ## 0x100000714 <_puts+0x100000714>
100000516: 45 31 f6                    	xorl	%r14d, %r14d
100000519: 0f 1f 80 00 00 00 00        	nopl	(%rax)
100000520: 42 0f b6 74 35 c0           	movzbl	-0x40(%rbp,%r14), %esi
100000526: 48 89 df                    	movq	%rbx, %rdi
100000529: 31 c0                       	xorl	%eax, %eax
10000052b: e8 8e 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000530: 49 ff c6                    	incq	%r14
100000533: 49 83 fe 10                 	cmpq	$0x10, %r14
100000537: 75 e7                       	jne	0x100000520 <_main+0x70>
100000539: bf 0a 00 00 00              	movl	$0xa, %edi
10000053e: e8 81 01 00 00              	callq	0x1000006c4 <_puts+0x1000006c4>
100000543: 48 8d 3d 1f 02 00 00        	leaq	0x21f(%rip), %rdi       ## 0x100000769 <_puts+0x100000769>
10000054a: e8 7b 01 00 00              	callq	0x1000006ca <_puts+0x1000006ca>
10000054f: 48 8b 75 d0                 	movq	-0x30(%rbp), %rsi
100000553: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
100000557: 48 8d 3d 83 01 00 00        	leaq	0x183(%rip), %rdi       ## 0x1000006e1 <_puts+0x1000006e1>
10000055e: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
100000562: 31 c0                       	xorl	%eax, %eax
100000564: e8 55 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000569: 48 8d 3d 99 01 00 00        	leaq	0x199(%rip), %rdi       ## 0x100000709 <_puts+0x100000709>
100000570: 31 c0                       	xorl	%eax, %eax
100000572: e8 47 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000577: 48 8d 1d 96 01 00 00        	leaq	0x196(%rip), %rbx       ## 0x100000714 <_puts+0x100000714>
10000057e: 45 31 f6                    	xorl	%r14d, %r14d
100000581: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
100000590: 42 0f b6 74 35 d0           	movzbl	-0x30(%rbp,%r14), %esi
100000596: 48 89 df                    	movq	%rbx, %rdi
100000599: 31 c0                       	xorl	%eax, %eax
10000059b: e8 1e 01 00 00              	callq	0x1000006be <_puts+0x1000006be>
1000005a0: 49 ff c6                    	incq	%r14
1000005a3: 49 83 fe 10                 	cmpq	$0x10, %r14
1000005a7: 75 e7                       	jne	0x100000590 <_main+0xe0>
1000005a9: bf 0a 00 00 00              	movl	$0xa, %edi
1000005ae: e8 11 01 00 00              	callq	0x1000006c4 <_puts+0x1000006c4>
1000005b3: 48 8d 3d 16 01 00 00        	leaq	0x116(%rip), %rdi       ## 0x1000006d0 <_puts+0x1000006d0>
1000005ba: 48 be 00 00 00 00 01 00 00 00       	movabsq	$0x100000000, %rsi ## imm = 0x100000000
1000005c4: ba ff ff ff ff              	movl	$0xffffffff, %edx       ## imm = 0xFFFFFFFF
1000005c9: 31 c0                       	xorl	%eax, %eax
1000005cb: e8 ee 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
1000005d0: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
1000005d8: 48 c7 45 e0 00 00 00 00     	movq	$0x0, -0x20(%rbp)
1000005e0: 48 b8 ff ff ff ff ff ff ff 00       	movabsq	$0xffffffffffffff, %rax ## imm = 0xFFFFFFFFFFFFFF
1000005ea: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1000005ee: 48 8d 3d 47 01 00 00        	leaq	0x147(%rip), %rdi       ## 0x10000073c <_puts+0x10000073c>
1000005f5: e8 d0 00 00 00              	callq	0x1000006ca <_puts+0x1000006ca>
1000005fa: 48 8b 75 e8                 	movq	-0x18(%rbp), %rsi
1000005fe: 48 8d 3d 15 01 00 00        	leaq	0x115(%rip), %rdi       ## 0x10000071a <_puts+0x10000071a>
100000605: 48 8d 55 e8                 	leaq	-0x18(%rbp), %rdx
100000609: 31 c0                       	xorl	%eax, %eax
10000060b: e8 ae 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000610: 48 8d 3d f2 00 00 00        	leaq	0xf2(%rip), %rdi        ## 0x100000709 <_puts+0x100000709>
100000617: 31 c0                       	xorl	%eax, %eax
100000619: e8 a0 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
10000061e: 48 8d 1d ef 00 00 00        	leaq	0xef(%rip), %rbx        ## 0x100000714 <_puts+0x100000714>
100000625: 45 31 f6                    	xorl	%r14d, %r14d
100000628: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
100000630: 42 0f b6 74 35 e8           	movzbl	-0x18(%rbp,%r14), %esi
100000636: 48 89 df                    	movq	%rbx, %rdi
100000639: 31 c0                       	xorl	%eax, %eax
10000063b: e8 7e 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000640: 49 ff c6                    	incq	%r14
100000643: 49 83 fe 08                 	cmpq	$0x8, %r14
100000647: 75 e7                       	jne	0x100000630 <_main+0x180>
100000649: bf 0a 00 00 00              	movl	$0xa, %edi
10000064e: e8 71 00 00 00              	callq	0x1000006c4 <_puts+0x1000006c4>
100000653: 48 8d 3d f8 00 00 00        	leaq	0xf8(%rip), %rdi        ## 0x100000752 <_puts+0x100000752>
10000065a: e8 6b 00 00 00              	callq	0x1000006ca <_puts+0x1000006ca>
10000065f: 48 8b 75 e0                 	movq	-0x20(%rbp), %rsi
100000663: 48 8d 3d b0 00 00 00        	leaq	0xb0(%rip), %rdi        ## 0x10000071a <_puts+0x10000071a>
10000066a: 48 8d 55 e0                 	leaq	-0x20(%rbp), %rdx
10000066e: 31 c0                       	xorl	%eax, %eax
100000670: e8 49 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000675: 48 8d 3d 8d 00 00 00        	leaq	0x8d(%rip), %rdi        ## 0x100000709 <_puts+0x100000709>
10000067c: 31 c0                       	xorl	%eax, %eax
10000067e: e8 3b 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
100000683: 48 8d 1d 8a 00 00 00        	leaq	0x8a(%rip), %rbx        ## 0x100000714 <_puts+0x100000714>
10000068a: 45 31 f6                    	xorl	%r14d, %r14d
10000068d: 0f 1f 00                    	nopl	(%rax)
100000690: 42 0f b6 74 35 e0           	movzbl	-0x20(%rbp,%r14), %esi
100000696: 48 89 df                    	movq	%rbx, %rdi
100000699: 31 c0                       	xorl	%eax, %eax
10000069b: e8 1e 00 00 00              	callq	0x1000006be <_puts+0x1000006be>
1000006a0: 49 ff c6                    	incq	%r14
1000006a3: 49 83 fe 08                 	cmpq	$0x8, %r14
1000006a7: 75 e7                       	jne	0x100000690 <_main+0x1e0>
1000006a9: bf 0a 00 00 00              	movl	$0xa, %edi
1000006ae: e8 11 00 00 00              	callq	0x1000006c4 <_puts+0x1000006c4>
1000006b3: 31 c0                       	xorl	%eax, %eax
1000006b5: 48 83 c4 30                 	addq	$0x30, %rsp
1000006b9: 5b                          	popq	%rbx
1000006ba: 41 5e                       	popq	%r14
1000006bc: 5d                          	popq	%rbp
1000006bd: c3                          	retq

Disassembly of section __TEXT,__stubs:

00000001000006be <__stubs>:
1000006be: ff 25 3c 09 00 00           	jmpq	*0x93c(%rip)            ## 0x100001000 <_puts+0x100001000>
1000006c4: ff 25 3e 09 00 00           	jmpq	*0x93e(%rip)            ## 0x100001008 <_puts+0x100001008>
1000006ca: ff 25 40 09 00 00           	jmpq	*0x940(%rip)            ## 0x100001010 <_puts+0x100001010>
