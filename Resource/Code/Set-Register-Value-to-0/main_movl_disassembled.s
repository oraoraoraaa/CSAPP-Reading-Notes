
main_movl:	file format mach-o 64-bit x86-64

Disassembly of section __TEXT,__text:

0000000100000470 <_zero>:
100000470: 55                          	pushq	%rbp
100000471: 48 89 e5                    	movq	%rsp, %rbp
100000474: b8 00 00 00 00              	movl	$0x0, %eax
100000479: 5d                          	popq	%rbp
10000047a: c3                          	retq
10000047b: 0f 1f 44 00 00              	nopl	(%rax,%rax)

0000000100000480 <_main>:
100000480: 55                          	pushq	%rbp
100000481: 48 89 e5                    	movq	%rsp, %rbp
100000484: 48 8d 3d 17 00 00 00        	leaq	0x17(%rip), %rdi        ## 0x1000004a2 <_printf+0x1000004a2>
10000048b: 31 f6                       	xorl	%esi, %esi
10000048d: b8 00 00 00 00              	movl	$0x0, %eax
100000492: e8 05 00 00 00              	callq	0x10000049c <_printf+0x10000049c>
100000497: 31 c0                       	xorl	%eax, %eax
100000499: 5d                          	popq	%rbp
10000049a: c3                          	retq

Disassembly of section __TEXT,__stubs:

000000010000049c <__stubs>:
10000049c: ff 25 5e 0b 00 00           	jmpq	*0xb5e(%rip)            ## 0x100001000 <_printf+0x100001000>
