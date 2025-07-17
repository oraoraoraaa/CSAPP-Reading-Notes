
main_xorl:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000100000470 <_zero>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: 31 c0                       	xorl	%eax, %eax
100000476: 5d                          	popq	%rbp
100000477: c3                          	retq
100000478: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)

0000000100000480 <_main>:
100000480: 55                          	pushq	%rbp
100000481: 48 89 e5                    	movq	%rsp, %rbp
100000484: 48 8d 3d 13 00 00 00        	leaq	0x13(%rip), %rdi        ## 0x10000049e <_printf+0x10000049e>
10000048b: 31 f6                       	xorl	%esi, %esi
10000048d: 31 c0                       	xorl	%eax, %eax
10000048f: e8 04 00 00 00              	callq	0x100000498 <_printf+0x100000498>
100000494: 31 c0                       	xorl	%eax, %eax
100000496: 5d                          	popq	%rbp
100000497: c3                          	retq

Disassembly of section __TEXT,__stubs:

0000000100000498 <__stubs>:
100000498: ff 25 62 0b 00 00           	jmpq	*0xb62(%rip)            ## 0x100001000 <_printf+0x100001000>
