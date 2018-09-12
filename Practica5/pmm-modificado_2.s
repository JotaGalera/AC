	.file	"pmm-modificado_2.c"
	.text
	.comm	a,36000000,32
	.comm	b,36000000,32
	.comm	c,36000000,32
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	imprimirMatriz
	.type	imprimirMatriz, @function
imprimirMatriz:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L5:
	movl	$0, -4(%rbp)
	jmp	.L3
.L4:
	movl	-8(%rbp), %eax
	cltq
	imulq	$12000, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L4
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L5
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	imprimirMatriz, .-imprimirMatriz
	.section	.rodata
	.align 8
.LC1:
	.string	"Falta el tamanio de la matriz\n"
.LC3:
	.string	"\nA[0][0]=%d\nA[N-1][N-1]=%d\n"
	.align 8
.LC4:
	.string	"\nTiempo (seg.) solo multiplicacion = %11.9f\n"
	.align 8
.LC5:
	.string	"\nTiempo (seg.) con trasposicion de matriz = %11.9f\t%11.9f segundos mas\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -116(%rbp)
	jg	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %edi
	call	exit@PLT
.L7:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -108(%rbp)
	cmpl	$3000, -108(%rbp)
	jle	.L8
	movl	$3000, -108(%rbp)
.L8:
	movl	$0, -104(%rbp)
	jmp	.L9
.L12:
	movl	$0, -100(%rbp)
	jmp	.L10
.L11:
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-104(%rbp), %edx
	movl	-100(%rbp), %eax
	addl	%edx, %eax
	leal	1(%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-104(%rbp), %eax
	leal	2(%rax), %edx
	movl	-100(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -100(%rbp)
.L10:
	movl	-100(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L11
	addl	$1, -104(%rbp)
.L9:
	movl	-104(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L12
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -104(%rbp)
	jmp	.L13
.L16:
	movl	$0, -100(%rbp)
	jmp	.L14
.L15:
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -84(%rbp)
	movl	-104(%rbp), %eax
	cltq
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	c(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-104(%rbp), %eax
	cltq
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	c(%rip), %rax
	movl	-84(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	addl	$1, -100(%rbp)
.L14:
	movl	-100(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L15
	addl	$1, -104(%rbp)
.L13:
	movl	-104(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L16
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	-108(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -88(%rbp)
	movl	$0, -104(%rbp)
	jmp	.L17
.L24:
	movl	$0, -100(%rbp)
	jmp	.L18
.L23:
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	jmp	.L19
.L20:
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-96(%rbp), %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-96(%rbp), %eax
	cltq
	movl	-100(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-96(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-96(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-100(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-96(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-96(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-100(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-96(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-96(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-100(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$4, -96(%rbp)
	addl	$1, -92(%rbp)
.L19:
	movl	-92(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L20
	movl	-88(%rbp), %eax
	sall	$2, %eax
	movl	%eax, -96(%rbp)
	jmp	.L21
.L22:
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-96(%rbp), %eax
	cltq
	movl	-104(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-96(%rbp), %eax
	cltq
	movl	-100(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-100(%rbp), %eax
	cltq
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -96(%rbp)
.L21:
	movl	-96(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L22
	addl	$1, -100(%rbp)
.L18:
	movl	-100(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L23
	addl	$1, -104(%rbp)
.L17:
	movl	-104(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L24
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movl	-108(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-108(%rbp), %eax
	subl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	a(%rip), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-80(%rbp), %rax
	movq	%rax, -136(%rbp)
	movsd	-136(%rbp), %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	-72(%rbp), %xmm0
	subsd	-80(%rbp), %xmm0
	movq	-72(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, -136(%rbp)
	movsd	-136(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
