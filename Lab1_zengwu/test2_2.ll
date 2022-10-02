@tempresult = dso_local global [10 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1


define float @ComputePi() #0 {
  ; pi, float, init 0
  %1 = alloca float, align 4
  store float 0.000000e+00, float* %1, align 4
  ; term, float, init 1
  %2 = alloca float, align 4
  store float 1.000000e+00, float* %2, align 4
  ; n, int, init 0
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %4

;<label>:4:
  ; 判断 n < 50
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 50
  ; 满足则继续比较, 不满足则跳出
  br i1 %6, label %7, label %29

; <label>:7:
  ; 判断 term >= 0.00000001f
  %8 = load float, float* %2, align 4
  %9 = fcmp oge float %8, 0x3E45798EE0000000
  ; 满足则继续执行循环, 不满足则跳出
  br i1 %9, label %10, label %29

; <label>:10:
  ; pi += term
  %11 = load float, float* %1, align 4
  %12 = load float, float* %2, align 4
  %13 = fadd float %11, %8
  store float %13, float* %1, align 4
  ; 判断 n % 5 == 0
  %14 = srem i32 %5, 5
  %15 = icmp eq i32 %14, 0
  ; 满足则继续执行下一句, 否则跳过
  br i1 %15, label %16, label %21

; <label>:16:
  %17 = fmul float 2.000000e+00, %13

  %18 = sdiv i32 %5, 5
  %19 = sext i32 %18 to i64

  %20 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %19
  store float %17, float* %20, align 4

  br label %21

; <label>:21:
  ; n++
  %22 = add nsw i32 %5, 1
  store i32 %22, i32* %3, align 4
  ; n to float
  %23 = sitofp i32 %22 to float
  ; term * n
  %24 = fmul float %12, %23
  ; 2 * n + 1
  %25 = mul nsw i32 2, %22
  %26 = add nsw i32 %25, 1

  %27 = sitofp i32 %26 to float
  %28 = fdiv float %24, %27

  store float %28, float* %2, align 4
  br label %4

; <label>:29:
  %30 = fmul float 2.000000e+00, %13
  ret float %30
}


define i32 @main() #0 {
    ; pi, float
  %1 = alloca float, align 4
  ; 调用ComputePi()计算结果
  %2 = call float @ComputePi()
  ; 将结果保存
  store float %2, float* %1, align 4

  %3 = fpext float %2 to double
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %3)
  
  call void @putch(i32 10)
  ; n, const int, init 10
  %4 = alloca i32, align 4
  store i32 10, i32* %4, align 4
  ; i, int, init 0
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:
  %7 = load i32, i32* %5, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %15

; <label>:9:
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %10
  
  %12 = load float, float* %11, align 4
  %13 = fpext float %12 to double
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %13)
  
  call void @putch(i32 10)
  
  %14 = add nsw i32 %7, 1
  store i32 %14, i32* %5, align 4
  br label %6

; <label>:15:
  ret i32 0
}

declare void @putf(i8*, ...) #1

declare void @putch(i32) #1

