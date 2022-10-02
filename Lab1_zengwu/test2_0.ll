; float tempresult [10]
@tempresult = common global [10 x float] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1

; 函数: ComputePi
; 参数: 无
; 返回值: float
define float @ComputePi() #0 {
  ; float pi = 0
  %1 = alloca float, align 4
  store float 0.000000e+00, float* %1, align 4
  ; float term = 1
  %2 = alloca float, align 4
  store float 1.000000e+00, float* %2, align 4
  ; int n = 0
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %4

; <label>:4:
  ; n => %5
  %5 = load i32, i32* %3, align 4
  ; 判断 n<50
  %6 = icmp slt i32 %5, 50
  ; 满足则跳转至 label7 继续执行, 不满足则跳至 label29 退出
  br i1 %6, label %7, label %29

; <label>:7:
  ; term => %8
  %8 = load float, float* %2, align 4
  ; 判断 term>=0.00000001f
  %9 = fcmp oge float %8, 0x3E45798EE0000000
  ; 满足则跳转至 label10 继续执行, 不满足则跳至 label29 退出
  br i1 %9, label %10, label %29

; <label>:10:
  ; pi => %11
  %11 = load float, float* %1, align 4
  ; term => %12
  %12 = load float, float* %2, align 4
  ; pi += term
  %13 = fadd float %11, %8
  store float %13, float* %1, align 4
  ; 判断 n%5==0
  %14 = srem i32 %5, 5
  %15 = icmp eq i32 %14, 0
  ; 满足则跳转至 label16 继续执行, 不满足则跳转至 label21 退出
  br i1 %15, label %16, label %21

; <label>:16:
  ; 2 * pi
  %17 = fmul float 2.000000e+00, %13 ;2*pi
  ; n / 5
  %18 = sdiv i32 %5, 5
  %19 = sext i32 %18 to i64
  ; &tempresult[n / 5]
  %20 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %19
  store float %17, float* %20, align 4
  br label %21

; <label>:21:
  ; n++
  %22 = add nsw i32 %5, 1
  store i32 %22, i32* %3, align 4
  ; n(float)
  %23 = sitofp i32 %22 to float
  ; term * n
  %24 = fmul float %12, %23
  ; 2 * n + 1
  %25 = mul nsw i32 2, %22
  %26 = add nsw i32 %25, 1
  %27 = sitofp i32 %26 to float
  ; term = term * n / (2 * n + 1);
  %28 = fdiv float %24, %27
  store float %28, float* %2, align 4
  ; 回到 label4 继续判断是否执行
  br label %4

; <label>:29:
  ; pi => %30
  %30 = load float, float* %1, align 4
  ; 2 * pi
  %31 = fmul float 2.000000e+00, %30
  ; return
  ret float %31
}

; 函数: main
; 参数: int argc, char const *argv[]
; 返回值: int
define i32 @main() #0 {
  ; float pi = ComputePi();
  %1 = alloca float, align 4 ;pi
  %2 = call float @ComputePi()
  store float %2, float* %1, align 4
  ; pi to double
  %3 = fpext float %2 to double
  ; putf("%f", pi);
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %3)
  ; putch('\n');
  call void @putch(i32 10)

  ; const int n = 10;
  %4 = alloca i32, align 4
  store i32 10, i32* %4, align 4
  ; int i = 0
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:
  ; i => %7
  %7 = load i32, i32* %5, align 4
  ; 判断 i<n
  %8 = icmp slt i32 %7, 10
  ; 满足则跳转至 label9 继续执行, 不满足则跳至 label15 退出
  br i1 %8, label %9, label %15

; <label>:9:
  ; tempresult[i] 
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds [10 x float], [10 x float]* @tempresult, i64 0, i64 %10 
  %12 = load float, float* %11, align 4
  ; tempresult[i] to double
  %13 = fpext float %12 to double
  ; putf("%f", tempresult[i]);
  call void (i8*, ...) @putf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %13)
  ; putch('\n');
  call void @putch(i32 10)
  
  ; i++
  %14 = add nsw i32 %7, 1
  store i32 %14, i32* %5, align 4
  ; 回到 label6 继续判断是否执行
  br label %6

; <label>:15:
  ret i32 0
}

; 库函数void putf(char a[], ...)声明
declare void @putf(i8*, ...) #1

; 库函数void putch(int a)声明
declare void @putch(i32) #1