	.file	"figura1-original.c"
	.text
	.comm	s,40000,32
	.section	.rodata
.LC1:
	.string	"R[0] = %i, R[MAX-1] = %i\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160096, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-160048(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$1, -160072(%rbp)
	jmp	.L2
.L9:
	movl	$0, -160064(%rbp)
	movl	$0, -160060(%rbp)
	movl	$0, -160068(%rbp)
	jmp	.L3
.L4:
	movl	-160068(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	s(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	(%rax,%rax), %edx
	movl	-160072(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -160064(%rbp)
	addl	$1, -160068(%rbp)
.L3:
	cmpl	$4999, -160068(%rbp)
	jle	.L4
	movl	$0, -160068(%rbp)
	jmp	.L5
.L6:
	movl	-160068(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+s(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-160072(%rbp), %eax
	addl	%eax, -160060(%rbp)
	addl	$1, -160068(%rbp)
.L5:
	cmpl	$4999, -160068(%rbp)
	jle	.L6
	movl	-160064(%rbp), %eax
	cmpl	-160060(%rbp), %eax
	jge	.L7
	movl	-160072(%rbp), %eax
	cltq
	movl	-160064(%rbp), %edx
	movl	%edx, -160016(%rbp,%rax,4)
	jmp	.L8
.L7:
	movl	-160072(%rbp), %eax
	cltq
	movl	-160060(%rbp), %edx
	movl	%edx, -160016(%rbp,%rax,4)
.L8:
	addl	$1, -160072(%rbp)
.L2:
	cmpl	$40000, -160072(%rbp)
	jle	.L9
	leaq	-160032(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-160032(%rbp), %rdx
	movq	-160048(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-160024(%rbp), %rdx
	movq	-160040(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160056(%rbp)
	movl	-20(%rbp), %edx
	movl	-160016(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-160056(%rbp), %rax
	movq	%rax, -160088(%rbp)
	movsd	-160088(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
