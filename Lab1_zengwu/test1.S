	.file	"test1.c"
	.text
	.comm	s,8,8
	.comm	score1,4,4
	.comm	score2,4,4
	.section	.rodata
.LC0:
	.string	"input num, score1 and score2:"
.LC1:
	.string	"%d%f%f"
.LC2:
	.string	"Num:%d\nMaxScore(.2f):%.2f\n\n"
.LC3:
	.string	"%d\n"
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
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	score2(%rip), %rcx
	leaq	score1(%rip), %rdx
	leaq	s(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movss	score1(%rip), %xmm0
	movss	score2(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L11
	movss	score1(%rip), %xmm0
	jmp	.L4
.L11:
	movss	score2(%rip), %xmm0
.L4:
	movss	%xmm0, 4+s(%rip)
	movss	4+s(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	s(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$8, -32(%rbp)
	movl	$4, -28(%rbp)
	movl	$10, -24(%rbp)
	movl	$2, -20(%rbp)
	movl	$6, -16(%rbp)
	movl	$5, -36(%rbp)
	movl	-36(%rbp), %edx
	leaq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	sort
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -40(%rbp)
.L7:
	movl	-40(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -40(%rbp)
	cltq
	movl	-32(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -40(%rbp)
	js	.L13
	jmp	.L7
.L13:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	sort
	.type	sort, @function
sort:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L15
.L20:
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L16
.L18:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L17
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
.L17:
	addl	$1, -8(%rbp)
.L16:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L18
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	je	.L19
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L19:
	addl	$1, -16(%rbp)
.L15:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L20
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	sort, .-sort
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
