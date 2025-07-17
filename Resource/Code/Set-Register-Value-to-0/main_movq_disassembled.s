
main_movq:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000100000470 <_zero>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: 48 c7 c0 00 00 00 00        	movq	$0x0, %rax
10000047b: 5d                          	popq	%rbp
10000047c: c3                          	retq
10000047d: 0f 1f 00                    	nopl	(%rax)

0000000100000480 <_main>:
100000480: 55                          	pushq	%rbp
100000481: 48 89 e5                    	movq	%rsp, %rbp
100000484: 48 8d 3d 19 00 00 00        	leaq	0x19(%rip), %rdi        ## 0x1000004a4 <_printf+0x1000004a4>
10000048b: 31 f6                       	xorl	%esi, %esi
10000048d: 48 c7 c0 00 00 00 00        	movq	$0x0, %rax
100000494: e8 05 00 00 00              	callq	0x10000049e <_printf+0x10000049e>
100000499: 31 c0                       	xorl	%eax, %eax
10000049b: 5d                          	popq	%rbp
10000049c: c3                          	retq

Disassembly of section __TEXT,__stubs:

000000010000049e <__stubs>:
10000049e: ff 25 5c 0b 00 00           	jmpq	*0xb5c(%rip)            ## 0x100001000 <_printf+0x100001000>
