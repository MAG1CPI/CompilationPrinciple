; ModuleID = 'test1_1.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.student = type { i32, float }

@.str = private unnamed_addr constant [31 x i8] c"input num, score1 and score2:\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%d%f%f\00", align 1
@s = common global %struct.student zeroinitializer, align 4
@score1 = common global float 0.000000e+00, align 4
@score2 = common global float 0.000000e+00, align 4
@.str.2 = private unnamed_addr constant [28 x i8] c"Num:%d\0AMaxScore(.2f):%.2f\0A\0A\00", align 1
@main.b = private unnamed_addr constant [5 x i32] [i32 8, i32 4, i32 10, i32 2, i32 6], align 16
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 {
  %1 = alloca [5 x i32], align 16
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0))
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i32* getelementptr inbounds (%struct.student, %struct.student* @s, i32 0, i32 0), float* @score1, float* @score2)
  %4 = load float, float* @score1, align 4
  %5 = load float, float* @score2, align 4
  %6 = fcmp ogt float %4, %5
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %0
  %8 = load float, float* @score1, align 4
  br label %11

; <label>:9:                                      ; preds = %0
  %10 = load float, float* @score2, align 4
  br label %11

; <label>:11:                                     ; preds = %9, %7
  %12 = phi float [ %8, %7 ], [ %10, %9 ]
  store float %12, float* getelementptr inbounds (%struct.student, %struct.student* @s, i32 0, i32 1), align 4
  %13 = load i32, i32* getelementptr inbounds (%struct.student, %struct.student* @s, i32 0, i32 0), align 4
  %14 = load float, float* getelementptr inbounds (%struct.student, %struct.student* @s, i32 0, i32 1), align 4
  %15 = fpext float %14 to double
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i32 0, i32 0), i32 %13, double %15)
  %17 = bitcast [5 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* bitcast ([5 x i32]* @main.b to i8*), i64 20, i32 16, i1 false)
  %18 = getelementptr inbounds [5 x i32], [5 x i32]* %1, i32 0, i32 0
  call void @sort(i32* %18, i32 5)
  br label %19

; <label>:19:                                     ; preds = %27, %11
  %.0 = phi i32 [ 4, %11 ], [ %20, %27 ]
  %20 = add nsw i32 %.0, -1
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds [5 x i32], [5 x i32]* %1, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %23)
  %25 = icmp slt i32 %20, 0
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %19
  br label %28

; <label>:27:                                     ; preds = %19
  br label %19

; <label>:28:                                     ; preds = %26
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define void @sort(i32*, i32) #0 {
  br label %3

; <label>:3:                                      ; preds = %35, %2
  %.02 = phi i32 [ 0, %2 ], [ %36, %35 ]
  %4 = icmp slt i32 %.02, %1
  br i1 %4, label %5, label %37

; <label>:5:                                      ; preds = %3
  %6 = add nsw i32 %.02, 1
  br label %7

; <label>:7:                                      ; preds = %19, %5
  %.01 = phi i32 [ %.02, %5 ], [ %.1, %19 ]
  %.0 = phi i32 [ %6, %5 ], [ %20, %19 ]
  %8 = icmp slt i32 %.0, %1
  br i1 %8, label %9, label %21

; <label>:9:                                      ; preds = %7
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %12, %15
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %9
  br label %18

; <label>:18:                                     ; preds = %17, %9
  %.1 = phi i32 [ %.0, %17 ], [ %.01, %9 ]
  br label %19

; <label>:19:                                     ; preds = %18
  %20 = add nsw i32 %.0, 1
  br label %7

; <label>:21:                                     ; preds = %7
  %22 = icmp ne i32 %.01, %.02
  br i1 %22, label %23, label %34

; <label>:23:                                     ; preds = %21
  %24 = sext i32 %.02 to i64
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = sext i32 %.01 to i64
  %28 = getelementptr inbounds i32, i32* %0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %.02 to i64
  %31 = getelementptr inbounds i32, i32* %0, i64 %30
  store i32 %29, i32* %31, align 4
  %32 = sext i32 %.01 to i64
  %33 = getelementptr inbounds i32, i32* %0, i64 %32
  store i32 %26, i32* %33, align 4
  br label %34

; <label>:34:                                     ; preds = %23, %21
  br label %35

; <label>:35:                                     ; preds = %34
  %36 = add nsw i32 %.02, 1
  br label %3

; <label>:37:                                     ; preds = %3
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
