@tempresult = dso_local global [10 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1


define float @ComputePi() #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float 0.000000e+00, float* %1, align 4
  store float 1.000000e+00, float* %2, align 4
  store i32 0, i32* %3, align 4
  br label %4

;<label>:4:                                      ; preds = %26, %0
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 50
  br i1 %6, label %7, label %10

;<label>:7:                                      ; preds = %4
  %8 = load float, float* %2, align 4
  %9 = fcmp oge float %8, 0x3E45798EE0000000
  br label %10

;<label>:10:                                     ; preds = %7, %4
  %11 = phi i1 [ false, %4 ], [ %9, %7 ]
  br i1 %11, label %12, label %38

;<label>:12:                                     ; preds = %10
  %13 = load float, float* %2, align 4
  %14 = load float, float* %1, align 4
  %15 = fadd float %14, %13
  store float %15, float* %1, align 4
  %16 = load i32, i32* %3, align 4
  %17 = srem i32 %16, 5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %26

;<label>:19:                                     ; preds = %12
  %20 = load float, float* %1, align 4
  %21 = fmul float 2.000000e+00, %20
  %22 = load i32, i32* %3, align 4
  %23 = sdiv i32 %22, 5
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %24
  store float %21, float* %25, align 4
  br label %26

; <label>:26:                                     ; preds = %19, %12
  %27 = load i32, i32* %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %3, align 4
  %29 = load float, float* %2, align 4
  %30 = load i32, i32* %3, align 4
  %31 = sitofp i32 %30 to float
  %32 = fmul float %29, %31
  %33 = load i32, i32* %3, align 4
  %34 = mul nsw i32 2, %33
  %35 = add nsw i32 %34, 1
  %36 = sitofp i32 %35 to float
  %37 = fdiv float %32, %36
  store float %37, float* %2, align 4
  br label %4

; <label>:38:                                     ; preds = %10
  %39 = load float, float* %1, align 4
  %40 = fmul float 2.000000e+00, %39
  ret float %40
}


define dso_local i32 @main() #0 {
  ;%1
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4

  ;%2->pi
  %2 = alloca float, align 4

 

 
  
  %3 = call float @ComputePi()

  store float %3, float* %2, align 4

  %4 = fpext float %3 to double
  
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), double %4)
  
  call void @putch(i32 10)

  ;%5->n
  %5 = alloca i32, align 4
  store i32 10, i32* %5, align 4

  ;%6->i
  %6 = alloca i32, align 4
  store i32 0, i32* %6, align 4
  br label %7

;<label>:7:                                                ; preds = %11, %0
  ;%8=i
  %8 = load i32, i32* %6, align 4

  ;%9=(i<n)
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %18

;<label>:10:                                               ; preds = %8
  ;%11=i
  %11 = load i32, i32* %6, align 4

  ;将%11扩展到64位
  %12 = sext i32 %11 to i64

  ;%13->tempresult[i]
  %13 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %12
  
  ;14%=tempresult[i]
  %14 = load float, float* %13, align 4
  
  ;将%14扩展到double
  %15 = fpext float %14 to double
  
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), double %15)
  
  call void @putch(i32 10)

  ;%16=i
  %16 = load i32, i32* %6, align 4

  ;%17=i+1
  %17 = add nsw i32 %16, 1

  ;i=%17
  store i32 %17, i32* %6, align 4
  br label %7

;<label>:18:                                               ; preds = %8
  ret i32 0
}

declare dso_local void @putf(i8*, ...) #1

declare dso_local void @putch(i32) #1

