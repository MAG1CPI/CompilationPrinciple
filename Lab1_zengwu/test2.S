	.text
	.file	"test2_0.ll"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function ComputePi
.LCPI0_0:
	.long	841731191               # float 9.99999993E-9
	.text
	.globl	ComputePi
	.p2align	4, 0x90
	.type	ComputePi,@function
ComputePi:                              # @ComputePi
	.cfi_startproc
# %bb.0:
	movl	$0, -8(%rsp)
	movl	$1065353216, -12(%rsp)  # imm = 0x3F800000
	movl	$0, -4(%rsp)
	movss	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rsp)
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%ecx, %xmm2
	mulss	%xmm2, %xmm1
	leal	3(%rax,%rax), %eax
	xorps	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	divss	%xmm2, %xmm1
	movss	%xmm1, -12(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rsp), %eax
	cmpl	$49, %eax
	jg	.LBB0_6
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movss	-12(%rsp), %xmm2        # xmm2 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm2
	jb	.LBB0_6
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movss	-12(%rsp), %xmm1        # xmm1 = mem[0],zero,zero,zero
	addss	-8(%rsp), %xmm2
	movss	%xmm2, -8(%rsp)
	movslq	%eax, %rcx
	imulq	$1717986919, %rcx, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	leal	(%rcx,%rdx), %esi
	leal	(%rsi,%rsi,4), %esi
	cmpl	%esi, %eax
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	addss	%xmm2, %xmm2
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	movss	%xmm2, tempresult(,%rcx,4)
	jmp	.LBB0_5
.LBB0_6:
	movss	-8(%rsp), %xmm0         # xmm0 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm0
	retq
.Lfunc_end0:
	.size	ComputePi, .Lfunc_end0-ComputePi
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	callq	ComputePi
	movss	%xmm0, 12(%rsp)
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	putf
	movl	$10, %edi
	callq	putch
	movl	$10, 8(%rsp)
	movl	$0, 4(%rsp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	movss	tempresult(,%rbx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	putf
	movl	$10, %edi
	callq	putch
	leal	1(%rbx), %eax
	movl	%eax, 4(%rsp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rbx
	cmpq	$9, %rbx
	jle	.LBB1_2
# %bb.3:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	tempresult,@object      # @tempresult
	.comm	tempresult,40,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%f"
	.size	.L.str, 3


	.section	".note.GNU-stack","",@progbits
