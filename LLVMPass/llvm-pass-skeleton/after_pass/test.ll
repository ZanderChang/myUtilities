; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"A\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"B\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"HH\0A\00", align 1
@__afl_area_ptr = external global i8*
@__afl_prev_loc = external thread_local global i32

; Function Attrs: noinline nounwind optnone uwtable
define void @a() #0 {
entry:
  %0 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %1 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %2 = xor i32 %0, 45017
  %3 = getelementptr i8, i8* %1, i32 %2
  %4 = load i8, i8* %3, !nosanitize !2
  %5 = add i8 %4, 1
  store i8 %5, i8* %3, !nosanitize !2
  store i32 22508, i32* @__afl_prev_loc, !nosanitize !2
  %aa = alloca i32, align 4
  %bb = alloca i32, align 4
  store i32 12, i32* %aa, align 4
  %6 = load i32, i32* %aa, align 4
  %cmp = icmp sgt i32 %6, 13
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %8 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %9 = xor i32 %7, 23358
  %10 = getelementptr i8, i8* %8, i32 %9
  %11 = load i8, i8* %10, !nosanitize !2
  %12 = add i8 %11, 1
  store i8 %12, i8* %10, !nosanitize !2
  store i32 11679, i32* @__afl_prev_loc, !nosanitize !2
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %14 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %15 = xor i32 %13, 60354
  %16 = getelementptr i8, i8* %14, i32 %15
  %17 = load i8, i8* %16, !nosanitize !2
  %18 = add i8 %17, 1
  store i8 %18, i8* %16, !nosanitize !2
  store i32 30177, i32* @__afl_prev_loc, !nosanitize !2
  store i32 14, i32* %aa, align 4
  store i32 90, i32* %bb, align 4
  %19 = load i32, i32* %bb, align 4
  %20 = load i32, i32* %aa, align 4
  %cmp1 = icmp sgt i32 %19, %20
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %21 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %22 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %23 = xor i32 %21, 19051
  %24 = getelementptr i8, i8* %22, i32 %23
  %25 = load i8, i8* %24, !nosanitize !2
  %26 = add i8 %25, 1
  store i8 %26, i8* %24, !nosanitize !2
  store i32 9525, i32* @__afl_prev_loc, !nosanitize !2
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %27 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %28 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %29 = xor i32 %27, 49131
  %30 = getelementptr i8, i8* %28, i32 %29
  %31 = load i8, i8* %30, !nosanitize !2
  %32 = add i8 %31, 1
  store i8 %32, i8* %30, !nosanitize !2
  store i32 24565, i32* @__afl_prev_loc, !nosanitize !2
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %1 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %2 = xor i32 %0, 25404
  %3 = getelementptr i8, i8* %1, i32 %2
  %4 = load i8, i8* %3, !nosanitize !2
  %5 = add i8 %4, 1
  store i8 %5, i8* %3, !nosanitize !2
  store i32 12702, i32* @__afl_prev_loc, !nosanitize !2
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %m, align 4
  %6 = load i32, i32* %m, align 4
  %cmp = icmp sgt i32 %6, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %8 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %9 = xor i32 %7, 28426
  %10 = getelementptr i8, i8* %8, i32 %9
  %11 = load i8, i8* %10, !nosanitize !2
  %12 = add i8 %11, 1
  store i8 %12, i8* %10, !nosanitize !2
  store i32 14213, i32* @__afl_prev_loc, !nosanitize !2
  call void @a()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = load i32, i32* @__afl_prev_loc, !nosanitize !2
  %14 = load i8*, i8** @__afl_area_ptr, !nosanitize !2
  %15 = xor i32 %13, 33484
  %16 = getelementptr i8, i8* %14, i32 %15
  %17 = load i8, i8* %16, !nosanitize !2
  %18 = add i8 %17, 1
  store i8 %18, i8* %16, !nosanitize !2
  store i32 16742, i32* @__afl_prev_loc, !nosanitize !2
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!2 = !{}
