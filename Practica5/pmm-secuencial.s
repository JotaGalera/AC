	.file	"pmm-secuencial.c"
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
.LC2:
	.string	"c[0][0] = %d, c[N][N] = %d\n"
.LC4:
	.string	"\nA[0][0]=%d\nA[N-1][N-1]=%d\n"
.LC5:
	.string	"\nTiempo (seg.) = %11.9f\n"
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
	subq	$112, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -84(%rbp)
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
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -72(%rbp)
	cmpl	$3000, -72(%rbp)
	jle	.L8
	movl	$3000, -72(%rbp)
.L8:
	movl	$0, -68(%rbp)
	jmp	.L9
.L12:
	movl	$0, -64(%rbp)
	jmp	.L10
.L11:
	movl	-64(%rbp), %eax
	cltq
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-68(%rbp), %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	leal	1(%rax), %ecx
	movl	-64(%rbp), %eax
	cltq
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-68(%rbp), %eax
	leal	2(%rax), %edx
	movl	-64(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-64(%rbp), %eax
	cltq
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L10:
	movl	-64(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L11
	addl	$1, -68(%rbp)
.L9:
	movl	-68(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L12
	movl	-72(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-72(%rbp), %eax
	subl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	c(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -68(%rbp)
	jmp	.L13
.L18:
	movl	$0, -64(%rbp)
	jmp	.L14
.L17:
	movl	$0, -60(%rbp)
	jmp	.L15
.L16:
	movl	-64(%rbp), %eax
	cltq
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$3000, %rcx, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-64(%rbp), %eax
	cltq
	movl	-60(%rbp), %esi
	movslq	%esi, %rsi
	imulq	$3000, %rsi, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	c(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-64(%rbp), %eax
	cltq
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$3000, %rdx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -60(%rbp)
.L15:
	movl	-60(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L16
	addl	$1, -64(%rbp)
.L14:
	movl	-64(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L17
	addl	$1, -68(%rbp)
.L13:
	movl	-68(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jl	.L18
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-72(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-72(%rbp), %eax
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
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
