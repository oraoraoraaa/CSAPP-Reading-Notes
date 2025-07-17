
main_xorq:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000100000470 <_zero>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: 48 31 c0                    	xorq	%rax, %rax
100000477: 5d                          	popq	%rbp
100000478: c3                          	retq
100000479: 0f 1f 80 00 00 00 00        	nopl	(%rax)

0000000100000480 <_main>:
100000480: 55                          	pushq	%rbp
100000481: 48 89 e5                    	movq	%rsp, %rbp
100000484: 48 8d 3d 15 00 00 00        	leaq	0x15(%rip), %rdi        ## 0x1000004a0 <_printf+0x1000004a0>
10000048b: 31 f6                       	xorl	%esi, %esi
10000048d: 48 31 c0                    	xorq	%rax, %rax
100000490: e8 05 00 00 00              	callq	0x10000049a <_printf+0x10000049a>
100000495: 31 c0                       	xorl	%eax, %eax
100000497: 5d                          	popq	%rbp
100000498: c3                          	retq

Disassembly of section __TEXT,__stubs:

000000010000049a <__stubs>:
10000049a: ff 25 60 0b 00 00           	jmpq	*0xb60(%rip)            ## 0x100001000 <_printf+0x100001000>
