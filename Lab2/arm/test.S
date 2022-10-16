	@ tempresult[10]存放在bss段
	.bss
	.align	2
	.type	tempresult, %object
	.size	tempresult, 40
tempresult:
	.space	40
	
	@ 调用putf()时参数"%f"存放在data段
	.data
.FORMAT_FLOAT:
	.ascii	"%f\000"
	

	@ float ComputePi(int max_iter_num), 存放在text段
	.text
	.align	1
	.global	tempresult
	.global	ComputePi
	.syntax unified
	.thumb
	.type	ComputePi, %function
ComputePi:
	push	{r7}
	mov	r7, sp
	sub	sp, sp, #20
	str	r0, [r7, #-4] @max_iter_num
	@ float pi = 0
	mov	r3, #0
	str	r3, [r7, #-8] @pi
	@ float term = 1
	mov	r3, #1065353216	@0b00111111100000000000000000000000
	str	r3, [r7, #-12] @term
	@ int n = 0
	mov	r5, #0
	str	r5, [r7, #-16] @n

	@ s15 = pi, s14 = term, r4 = n
	vldr	s15, [r7, #-8]
	vldr	s14, [r7, #-12]
	ldr	r4, [r7, #-16]
	
	@ while循环体
.PI_Loop:
	@ n >= max_iter_num 时跳转到.PI_out
	cmp	r4, r0
	bge	.PI_out
	@ term < 0.00000001f 时跳转到.PI_out
	vldr	s13, .PI_PARAMETER
	vcmpe.f32	s14, s13
	vmrs	APSR_nzcv, FPSCR
	blt	.PI_out

	@ pi += term
	vadd.f32	s15, s15, s14
	@ r3 = n % 5
	ldr     r5, .PI_PARAMETER + 4
	smull	r6, r5, r5, r4
	asr	r6, r5, #1
	asr	r5, r4, #31
	sub	r3, r6, r5
	mov	r2, #5
	mul	r3, r3, r2
	@ r6 = (n % 5 == 0)
	sub	r6, r4, r3
	@ if (n % 5 != 0) 跳转到.PI_IF_FINISH
	cmp	r6, #0
	bne	.PI_IF_FINISH

	@ r3 = n / 5
	ldr r5, .PI_PARAMETER + 4
	smull	r6, r5, r5, r4
	asr	r6, r5, #1
	asr	r5, r4, #31
	sub	r3, r6, r5
	lsl	r3, r3, #2

	@ s13 = 2 * pi
	vadd.f32	s13, s15, s15
	
	@ r2 = &tempresult[0]
	ldr	r2, .PI_PARAMETER + 8
.PI_GET_TEMPRESULT:
	add	r2, r2, pc
	@ r3 = &tempresult[n / 5]
	add	r3, r3, r2
	@ [r3] = s13, 即tempresult[n / 5] = 2 * pi
	vstr	s13, [r3]

.PI_IF_FINISH:
	@ n++
	add	r4, r4, #1

	@ s13 = float(n)
	vmov	s13, r4
	vcvt.f32.s32	s13, s13
	@ s13 = n * term
	vmul.f32	s13, s13, s14
	@ r5 = 2 * n + 1
	lsl	r5, r4, #1
	add	r5, r5, #1
	@ s12 = float(2 * n + 1)
	vmov	s12, r5
	vcvt.f32.s32	s12, s12
	@ s14 = s13 / s12, 即term = term * n / (2 * n + 1)
	vdiv.f32	s14, s13, s12
	vstr	s14, [r7, #-12]
	b	.PI_Loop

.PI_out:
	@ return 2 * pi
	vadd.f32	s15, s15, s15
	mov	sp, r7
	ldr	r7, [sp], #4
	bx	lr

.PI_PARAMETER:
	.word	841731191
	.word   1717986919 @ 0x66666667
	.word	tempresult - (.PI_GET_TEMPRESULT + 4)


	@ int main(), 存放在text段
	.text
	.align	1
	.global	main
	.syntax unified
	.type	main, %function
main:
	push	{r7, lr}
	mov	r7, sp
	sub	sp, sp, #16
	
	@ float pi = ComputePi(50)
	mov	r0, #50
	bl	ComputePi(PLT)
	vstr	s15, [r7] @pi

	@ putf("%f", pi)
	ldr	r1, .MAIN_PARAMETER
.CALL_PUTF1:
	add	r1, r1, pc
	mov	r0, r1
	vldr	s15, [r7]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	bl	putf(PLT)
	@ putch('\n')
	ldr	r0, .MAIN_PARAMETER + 4
	bl	putch(PLT)

	@ const int n = 10
	mov	r4, #10
	str	r4, [r7, #-4] @n
	@ int i = 0
	mov	r5, #0
	str	r5, [r7, #-8] @i

	@ while循环体, i >= n 时跳转到.MAIN_out
.MAIN_Loop:
	@ r4 = n, r5 = i
	ldr	r4, [r7, #-4]
	ldr	r5, [r7, #-8]
	cmp	r5, r4
	bge	.MAIN_out

	ldr	r3, .MAIN_PARAMETER + 8
.MAIN_GET_TEMPRESULT:
	add	r3, r3, pc
	mov	r2, r3
	mov	r3, r5
	lsl	r3, r3, #2
	add	r3, r3, r2
	vldr	s15, [r3]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7

	@ putf("%f", tempresult[i])
	ldr	r1, .MAIN_PARAMETER + 12
.CALL_PUTF2:
	add	r1, r1, pc
	mov	r0, r1
	bl	putf(PLT)
	@ putch('\n')
	ldr	r0, .MAIN_PARAMETER + 4
	bl	putch(PLT)
	@ i++
	add	r5, r5, #1
	str	r5, [r7, #-8]
	b	.MAIN_Loop

.MAIN_out:
	@ return 0
	mov	r0, #0
	mov	sp, r7
	pop	{r7, pc}

.MAIN_PARAMETER:
	.word	.FORMAT_FLOAT - (.CALL_PUTF1 + 4)
	.word	10 @"\n"
	.word	tempresult - (.MAIN_GET_TEMPRESULT + 4)
	.word	.FORMAT_FLOAT - (.CALL_PUTF2 + 4)