	.file	"listado1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"thread %d asigna el valor %f en la iteraci\303\263n %d\n"
	.text
	.p2align 4,,15
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB42:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	(%rdi), %ebx
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	movl	%eax, %ebp
	movl	%ebx, %eax
	cltd
	idivl	%r12d
	cmpl	%edx, %ebp
	jge	.L7
	addl	$1, %eax
	xorl	%edx, %edx
.L7:
	movl	%eax, %ecx
	imull	%ebp, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jge	.L1
	pxor	%xmm2, %xmm2
	subl	%edx, %eax
	leaq	v1(%rip), %r15
	subl	$1, %eax
	leaq	v2(%rip), %r13
	leaq	.LC1(%rip), %r12
	cvtsi2sdq	%rbx, %xmm2
	movslq	%edx, %rbx
	leaq	1(%rbx), %r14
	addq	%r14, %rax
	movq	%rax, 8(%rsp)
	mulsd	.LC0(%rip), %xmm2
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L11:
	movsd	(%rsp), %xmm2
	addq	$1, %r14
.L6:
	pxor	%xmm1, %xmm1
	movl	%ebx, %ecx
	movapd	%xmm2, %xmm0
	movl	%ebp, %edx
	movapd	%xmm2, %xmm3
	movq	%r12, %rsi
	cvtsi2sd	%ebx, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	movsd	%xmm2, (%rsp)
	mulsd	.LC0(%rip), %xmm1
	addsd	%xmm1, %xmm0
	subsd	%xmm1, %xmm3
	movsd	%xmm0, (%r15,%rbx,8)
	movsd	%xmm3, 0(%r13,%rbx,8)
	call	__printf_chk@PLT
	movsd	0(%r13,%rbx,8), %xmm0
	movl	%ebx, %ecx
	movl	%ebp, %edx
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$1, %eax
	movq	%r14, %rbx
	call	__printf_chk@PLT
	cmpq	8(%rsp), %r14
	jne	.L11
.L1:
	addq	$24, %rsp
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
	.cfi_endproc
.LFE42:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Faltan no componentes del vector"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"v1[%d] valor: %f\n"
.LC4:
	.string	"v2[%d] valor: %f\n"
.LC5:
	.string	"v3[%d] en la iteracion %f\n"
	.section	.rodata.str1.8
	.align 8
.LC6:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L29
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$33554432, %ebp
	call	strtol@PLT
	leaq	20(%rsp), %rsi
	cmpl	$33554432, %eax
	leaq	main._omp_fn.0(%rip), %rdi
	cmovbe	%eax, %ebp
	movq	%rax, %rbx
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%ebp, 20(%rsp)
	call	GOMP_parallel@PLT
	testl	%ebx, %ebx
	je	.L14
	leaq	v1(%rip), %r12
	leaq	v2(%rip), %r13
	leaq	.LC3(%rip), %r14
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L15:
	movsd	(%r12,%rbx,8), %xmm0
	movl	%ebx, %edx
	movq	%r14, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	0(%r13,%rbx,8), %xmm0
	leaq	.LC4(%rip), %rsi
	movl	%ebx, %edx
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, %ebp
	ja	.L15
	call	omp_get_wtime@PLT
	leaq	v3(%rip), %r14
	movsd	%xmm0, (%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L16:
	movsd	(%r12,%rax,8), %xmm0
	addsd	0(%r13,%rax,8), %xmm0
	movsd	%xmm0, (%r14,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	ja	.L16
	call	omp_get_wtime@PLT
	xorl	%ebx, %ebx
	movsd	%xmm0, 8(%rsp)
	leaq	.LC5(%rip), %r15
	call	omp_get_thread_num@PLT
	testl	%eax, %eax
	jne	.L19
	.p2align 4,,10
	.p2align 3
.L18:
	movsd	(%r14,%rbx,8), %xmm0
	movl	%ebx, %edx
	movq	%r15, %rsi
	movl	$1, %edi
	movl	$1, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, %ebp
	ja	.L18
.L19:
	movsd	8(%rsp), %xmm0
	leal	-1(%rbp), %eax
	leaq	.LC6(%rip), %rsi
	movsd	v3(%rip), %xmm3
	movl	%ebp, %edx
	subsd	(%rsp), %xmm0
	movsd	(%r14,%rax,8), %xmm6
	movsd	0(%r13,%rax,8), %xmm5
	movq	%rax, %rcx
	movsd	(%r12,%rax,8), %xmm4
	movl	%eax, %r9d
	movsd	v2(%rip), %xmm2
	movl	%eax, %r8d
	movsd	v1(%rip), %xmm1
	movl	$1, %edi
	movl	$7, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L30
	addq	$40, %rsp
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
.L14:
	.cfi_restore_state
	call	omp_get_wtime@PLT
	leaq	v1(%rip), %r12
	movsd	%xmm0, (%rsp)
	leaq	v2(%rip), %r13
	call	omp_get_wtime@PLT
	leaq	v3(%rip), %r14
	movsd	%xmm0, 8(%rsp)
	jmp	.L19
.L30:
	call	__stack_chk_fail@PLT
.L29:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	v3,268435456,32
	.comm	v2,268435456,32
	.comm	v1,268435456,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
