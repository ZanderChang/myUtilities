; ModuleID = 'final.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"0x%x 0x%x\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"A\0A\00", align 1
@.str.1.2 = private unnamed_addr constant [3 x i8] c"B\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"HH\0A\00", align 1

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp8mm(i64 %Arg1, i64 %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i64, align 8
  %Arg2.addr.i = alloca i64, align 8
  %Arg1.addr = alloca i64, align 8
  %Arg2.addr = alloca i64, align 8
  %PC = alloca i64, align 8
  store i64 %Arg1, i64* %Arg1.addr, align 8
  store i64 %Arg2, i64* %Arg2.addr, align 8
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i64, i64* %Arg1.addr, align 8
  %4 = load i64, i64* %Arg2.addr, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i64 %3, i64* %Arg1.addr.i, align 8
  store i64 %4, i64* %Arg2.addr.i, align 8
  %5 = load i64, i64* %Arg1.addr.i, align 8
  %6 = load i64, i64* %Arg2.addr.i, align 8
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i64 %5, i64 %6)
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp8mm(i64 %Arg1, i64 %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i64, align 8
  %Arg2.addr.i = alloca i64, align 8
  %Arg1.addr = alloca i64, align 8
  %Arg2.addr = alloca i64, align 8
  %PC = alloca i64, align 8
  store i64 %Arg1, i64* %Arg1.addr, align 8
  store i64 %Arg2, i64* %Arg2.addr, align 8
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i64, i64* %Arg1.addr, align 8
  %4 = load i64, i64* %Arg2.addr, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i64 %3, i64* %Arg1.addr.i, align 8
  store i64 %4, i64* %Arg2.addr.i, align 8
  %5 = load i64, i64* %Arg1.addr.i, align 8
  %6 = load i64, i64* %Arg2.addr.i, align 8
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i64 %5, i64 %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp4jj(i32 zeroext %Arg1, i32 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i32, align 4
  %Arg2.addr.i = alloca i32, align 4
  %Arg1.addr = alloca i32, align 4
  %Arg2.addr = alloca i32, align 4
  %PC = alloca i64, align 8
  store i32 %Arg1, i32* %Arg1.addr, align 4
  store i32 %Arg2, i32* %Arg2.addr, align 4
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i32, i32* %Arg1.addr, align 4
  %4 = load i32, i32* %Arg2.addr, align 4
  store i64 %2, i64* %PC.addr.i, align 8
  store i32 %3, i32* %Arg1.addr.i, align 4
  store i32 %4, i32* %Arg2.addr.i, align 4
  %5 = load i32, i32* %Arg1.addr.i, align 4
  %6 = load i32, i32* %Arg2.addr.i, align 4
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %5, i32 %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 zeroext %Arg1, i32 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i32, align 4
  %Arg2.addr.i = alloca i32, align 4
  %Arg1.addr = alloca i32, align 4
  %Arg2.addr = alloca i32, align 4
  %PC = alloca i64, align 8
  store i32 %Arg1, i32* %Arg1.addr, align 4
  store i32 %Arg2, i32* %Arg2.addr, align 4
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i32, i32* %Arg1.addr, align 4
  %4 = load i32, i32* %Arg2.addr, align 4
  store i64 %2, i64* %PC.addr.i, align 8
  store i32 %3, i32* %Arg1.addr.i, align 4
  store i32 %4, i32* %Arg2.addr.i, align 4
  %5 = load i32, i32* %Arg1.addr.i, align 4
  %6 = load i32, i32* %Arg2.addr.i, align 4
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %5, i32 %6)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp2tt(i16 zeroext %Arg1, i16 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i16, align 2
  %Arg2.addr.i = alloca i16, align 2
  %Arg1.addr = alloca i16, align 2
  %Arg2.addr = alloca i16, align 2
  %PC = alloca i64, align 8
  store i16 %Arg1, i16* %Arg1.addr, align 2
  store i16 %Arg2, i16* %Arg2.addr, align 2
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i16, i16* %Arg1.addr, align 2
  %4 = load i16, i16* %Arg2.addr, align 2
  store i64 %2, i64* %PC.addr.i, align 8
  store i16 %3, i16* %Arg1.addr.i, align 2
  store i16 %4, i16* %Arg2.addr.i, align 2
  %5 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %5 to i32
  %6 = load i16, i16* %Arg2.addr.i, align 2
  %conv1.i = zext i16 %6 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp2tt(i16 zeroext %Arg1, i16 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i16, align 2
  %Arg2.addr.i = alloca i16, align 2
  %Arg1.addr = alloca i16, align 2
  %Arg2.addr = alloca i16, align 2
  %PC = alloca i64, align 8
  store i16 %Arg1, i16* %Arg1.addr, align 2
  store i16 %Arg2, i16* %Arg2.addr, align 2
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i16, i16* %Arg1.addr, align 2
  %4 = load i16, i16* %Arg2.addr, align 2
  store i64 %2, i64* %PC.addr.i, align 8
  store i16 %3, i16* %Arg1.addr.i, align 2
  store i16 %4, i16* %Arg2.addr.i, align 2
  %5 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %5 to i32
  %6 = load i16, i16* %Arg2.addr.i, align 2
  %conv1.i = zext i16 %6 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp1hh(i8 zeroext %Arg1, i8 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i8, align 1
  %Arg2.addr.i = alloca i8, align 1
  %Arg1.addr = alloca i8, align 1
  %Arg2.addr = alloca i8, align 1
  %PC = alloca i64, align 8
  store i8 %Arg1, i8* %Arg1.addr, align 1
  store i8 %Arg2, i8* %Arg2.addr, align 1
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i8, i8* %Arg1.addr, align 1
  %4 = load i8, i8* %Arg2.addr, align 1
  store i64 %2, i64* %PC.addr.i, align 8
  store i8 %3, i8* %Arg1.addr.i, align 1
  store i8 %4, i8* %Arg2.addr.i, align 1
  %5 = load i8, i8* %Arg1.addr.i, align 1
  %conv.i = zext i8 %5 to i32
  %6 = load i8, i8* %Arg2.addr.i, align 1
  %conv1.i = zext i8 %6 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp1hh(i8 zeroext %Arg1, i8 zeroext %Arg2) #0 {
entry:
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i8, align 1
  %Arg2.addr.i = alloca i8, align 1
  %Arg1.addr = alloca i8, align 1
  %Arg2.addr = alloca i8, align 1
  %PC = alloca i64, align 8
  store i8 %Arg1, i8* %Arg1.addr, align 1
  store i8 %Arg2, i8* %Arg2.addr, align 1
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %3 = load i8, i8* %Arg1.addr, align 1
  %4 = load i8, i8* %Arg2.addr, align 1
  store i64 %2, i64* %PC.addr.i, align 8
  store i8 %3, i8* %Arg1.addr.i, align 1
  store i8 %4, i8* %Arg2.addr.i, align 1
  %5 = load i8, i8* %Arg1.addr.i, align 1
  %conv.i = zext i8 %5 to i32
  %6 = load i8, i8* %Arg2.addr.i, align 1
  %conv1.i = zext i8 %6 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @a() #3 {
entry:
  %aa = alloca i32, align 4
  %bb = alloca i32, align 4
  store i32 12, i32* %aa, align 4
  %0 = load i32, i32* %aa, align 4
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  %cmp = icmp sgt i32 %0, 13
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 14, i32* %aa, align 4
  store i32 90, i32* %bb, align 4
  %1 = load i32, i32* %bb, align 4
  %2 = load i32, i32* %aa, align 4
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  %cmp1 = icmp sgt i32 %1, %2
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1.2, i32 0, i32 0))
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #3 {
entry:
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %m, align 4
  %0 = load i32, i32* %m, align 4
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 -1, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 -1, i32 %0)
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 -1, i32 %0)
  %cmp = icmp sgt i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @a()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+popcnt,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
