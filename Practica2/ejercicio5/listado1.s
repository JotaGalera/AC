	.file	"listado1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para los vectores"
	.align 8
.LC4:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ \n V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / \n V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) / \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L18
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebx
	movq	%rax, %r13
	leaq	0(,%rbx,8), %r14
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	testq	%rbp, %rbp
	movq	%rax, %r14
	sete	%dl
	testq	%r12, %r12
	sete	%al
	orb	%al, %dl
	jne	.L3
	testq	%r14, %r14
	je	.L3
	testl	%r13d, %r13d
	je	.L19
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm3
	cvtsi2sdq	%rbx, %xmm1
	leal	-1(%r13), %ebx
	movq	%rbx, %r15
	addq	$1, %rbx
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L8:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	movsd	%xmm2, 0(%rbp,%rax,8)
	movsd	%xmm7, (%r12,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L8
	movq	%rsp, %rsi
	xorl	%edi, %edi
	salq	$3, %rbx
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	0(%rbp,%rax), %xmm0
	addsd	(%r12,%rax), %xmm0
	movsd	%xmm0, (%r14,%rax)
	addq	$8, %rax
	cmpq	%rax, %rbx
	jne	.L9
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%r15d, %edx
	pxor	%xmm0, %xmm0
	leaq	.LC4(%rip), %rsi
	pxor	%xmm1, %xmm1
	movl	%r15d, %ecx
	movsd	(%r14,%rdx,8), %xmm6
	movl	%r15d, %r9d
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	(%r12,%rdx,8), %xmm5
	movsd	0(%rbp,%rdx,8), %xmm4
	movl	%r15d, %r8d
	movsd	(%r14), %xmm3
	movl	%r13d, %edx
	movsd	(%r12), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movl	$7, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L20
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	orl	$-1, %r15d
	call	clock_gettime@PLT
	jmp	.L10
.L20:
	call	__stack_chk_fail@PLT
.L3:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L18:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
