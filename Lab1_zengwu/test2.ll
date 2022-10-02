; ModuleID = 'test2.c'
source_filename = "test2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@tempresult = global [10 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@_sysy_start = common global %struct.timeval zeroinitializer, align 8
@_sysy_end = common global %struct.timeval zeroinitializer, align 8
@_sysy_l1 = common global [1024 x i32] zeroinitializer, align 16
@_sysy_l2 = common global [1024 x i32] zeroinitializer, align 16
@_sysy_h = common global [1024 x i32] zeroinitializer, align 16
@_sysy_m = common global [1024 x i32] zeroinitializer, align 16
@_sysy_s = common global [1024 x i32] zeroinitializer, align 16
@_sysy_us = common global [1024 x i32] zeroinitializer, align 16
@_sysy_idx = common global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define float @ComputePi() #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float 0.000000e+00, float* %1, align 4
  store float 1.000000e+00, float* %2, align 4
  store i32 0, i32* %3, align 4
  br label %4

4:                                      ; preds = %26, %0
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 50
  br i1 %6, label %7, label %10

7:                                      ; preds = %4
  %8 = load float, float* %2, align 4
  %9 = fcmp oge float %8, 0x3E45798EE0000000
  br label %10

10:                                     ; preds = %7, %4
  %11 = phi i1 [ false, %4 ], [ %9, %7 ]
  br i1 %11, label %12, label %38

12:                                     ; preds = %10
  %13 = load float, float* %2, align 4
  %14 = load float, float* %1, align 4
  %15 = fadd float %14, %13
  store float %15, float* %1, align 4
  %16 = load i32, i32* %3, align 4
  %17 = srem i32 %16, 5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %26

19:                                     ; preds = %12
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

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = call float @ComputePi()
  store float %5, float* %2, align 4
  %6 = load float, float* %2, align 4
  %7 = fpext float %6 to double
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %7)
  call void @putch(i32 10)
  store i32 10, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %8

; <label>:8:                                      ; preds = %11, %0
  %9 = load i32, i32* %4, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %19

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %13
  %15 = load float, float* %14, align 4
  %16 = fpext float %15 to double
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %16)
  call void @putch(i32 10)
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %8

; <label>:19:                                     ; preds = %8
  ret i32 0
}

declare void @putf(i8*, ...) #1

declare void @putch(i32) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
