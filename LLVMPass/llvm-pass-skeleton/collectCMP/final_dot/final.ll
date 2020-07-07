; ModuleID = 'final.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"[PC] 0x%x\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"[STRCMP] %s %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"CMP\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"[%s] [0x%x] 0x%x 0x%x\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"SWITCH-16\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"SWITCH-32\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"SWITCH-64\00", align 1
@str1 = constant [5 x i8] c"abcd\00", align 1
@str2 = constant [5 x i8] c"abCd\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"A\0A\00", align 1
@.str.1.8 = private unnamed_addr constant [4 x i8] c"A-\0A\00", align 1
@.str.2.9 = private unnamed_addr constant [3 x i8] c"B\0A\00", align 1
@.str.3.10 = private unnamed_addr constant [4 x i8] c"B-\0A\00", align 1
@.str.4.11 = private unnamed_addr constant [21 x i8] c"Case1: Value is: %d\0A\00", align 1
@.str.5.12 = private unnamed_addr constant [21 x i8] c"Case2: Value is: %d\0A\00", align 1
@.str.6.13 = private unnamed_addr constant [21 x i8] c"Case3: Value is: %d\0A\00", align 1
@.str.7.14 = private unnamed_addr constant [23 x i8] c"Default: Value is: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"EQ\0A\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"NEQ\0A\00", align 1
@__sancov_gen_cov_switch_values = internal global [5 x i64] [i64 3, i64 32, i64 1, i64 2, i64 3]

; Function Attrs: noinline optnone uwtable
define void @_Z24__sanitizer_cov_trace_pcv() #0 {
entry:
  %PC = alloca i64, align 8
  %0 = call i8* @llvm.returnaddress(i32 0)
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %PC, align 8
  %2 = load i64, i64* %PC, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i64 %2)
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline optnone uwtable
define void @_Z28__sanitizer_cov_trace_strcmpPmS_(i64* %Arg1, i64* %Arg2) #3 {
entry:
  %Arg1.addr = alloca i64*, align 8
  %Arg2.addr = alloca i64*, align 8
  store i64* %Arg1, i64** %Arg1.addr, align 8
  store i64* %Arg2, i64** %Arg2.addr, align 8
  %0 = load i64*, i64** %Arg1.addr, align 8
  %1 = load i64*, i64** %Arg2.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i64* %0, i64* %1)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp8mm(i64 %Arg1, i64 %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i64 %3, i64* %Arg1.addr.i, align 8
  store i64 %4, i64* %Arg2.addr.i, align 8
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i64, i64* %Arg1.addr.i, align 8
  %8 = load i64, i64* %Arg2.addr.i, align 8
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i64 %7, i64 %8)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp8mm(i64 %Arg1, i64 %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i64 %3, i64* %Arg1.addr.i, align 8
  store i64 %4, i64* %Arg2.addr.i, align 8
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i64, i64* %Arg1.addr.i, align 8
  %8 = load i64, i64* %Arg2.addr.i, align 8
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i64 %7, i64 %8)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp4jj(i32 zeroext %Arg1, i32 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i32 %3, i32* %Arg1.addr.i, align 4
  store i32 %4, i32* %Arg2.addr.i, align 4
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i32, i32* %Arg1.addr.i, align 4
  %8 = load i32, i32* %Arg2.addr.i, align 4
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %7, i32 %8)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 zeroext %Arg1, i32 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i32 %3, i32* %Arg1.addr.i, align 4
  store i32 %4, i32* %Arg2.addr.i, align 4
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i32, i32* %Arg1.addr.i, align 4
  %8 = load i32, i32* %Arg2.addr.i, align 4
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %7, i32 %8)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp2tt(i16 zeroext %Arg1, i16 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i16 %3, i16* %Arg1.addr.i, align 2
  store i16 %4, i16* %Arg2.addr.i, align 2
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %7 to i32
  %8 = load i16, i16* %Arg2.addr.i, align 2
  %conv1.i = zext i16 %8 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp2tt(i16 zeroext %Arg1, i16 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i16 %3, i16* %Arg1.addr.i, align 2
  store i16 %4, i16* %Arg2.addr.i, align 2
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %7 to i32
  %8 = load i16, i16* %Arg2.addr.i, align 2
  %conv1.i = zext i16 %8 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp1hh(i8 zeroext %Arg1, i8 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i8 %3, i8* %Arg1.addr.i, align 1
  store i8 %4, i8* %Arg2.addr.i, align 1
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i8, i8* %Arg1.addr.i, align 1
  %conv.i = zext i8 %7 to i32
  %8 = load i8, i8* %Arg2.addr.i, align 1
  %conv1.i = zext i8 %8 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp1hh(i8 zeroext %Arg1, i8 zeroext %Arg2) #3 {
entry:
  %type.addr.i = alloca i8*, align 8
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
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %2, i64* %PC.addr.i, align 8
  store i8 %3, i8* %Arg1.addr.i, align 1
  store i8 %4, i8* %Arg2.addr.i, align 1
  %5 = load i8*, i8** %type.addr.i, align 8
  %6 = load i64, i64* %PC.addr.i, align 8
  %7 = load i8, i8* %Arg1.addr.i, align 1
  %conv.i = zext i8 %7 to i32
  %8 = load i8, i8* %Arg2.addr.i, align 1
  %conv1.i = zext i8 %8 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %5, i64 %6, i32 %conv.i, i32 %conv1.i)
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z28__sanitizer_cov_trace_switchmPm(i64 %Val, i64* %Cases) #3 {
entry:
  %type.addr.i18 = alloca i8*, align 8
  %PC.addr.i19 = alloca i64, align 8
  %Arg1.addr.i20 = alloca i64, align 8
  %Arg2.addr.i21 = alloca i64, align 8
  %type.addr.i13 = alloca i8*, align 8
  %PC.addr.i14 = alloca i64, align 8
  %Arg1.addr.i15 = alloca i32, align 4
  %Arg2.addr.i16 = alloca i32, align 4
  %type.addr.i = alloca i8*, align 8
  %PC.addr.i = alloca i64, align 8
  %Arg1.addr.i = alloca i16, align 2
  %Arg2.addr.i = alloca i16, align 2
  %Val.addr = alloca i64, align 8
  %Cases.addr = alloca i64*, align 8
  %N = alloca i64, align 8
  %ValSizeInBits = alloca i64, align 8
  %Vals = alloca i64*, align 8
  %PC = alloca i64, align 8
  %i = alloca i64, align 8
  %Token = alloca i64, align 8
  store i64 %Val, i64* %Val.addr, align 8
  store i64* %Cases, i64** %Cases.addr, align 8
  %0 = load i64*, i64** %Cases.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0
  %1 = load i64, i64* %arrayidx, align 8
  store i64 %1, i64* %N, align 8
  %2 = load i64*, i64** %Cases.addr, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %2, i64 1
  %3 = load i64, i64* %arrayidx1, align 8
  store i64 %3, i64* %ValSizeInBits, align 8
  %4 = load i64*, i64** %Cases.addr, align 8
  %add.ptr = getelementptr inbounds i64, i64* %4, i64 2
  store i64* %add.ptr, i64** %Vals, align 8
  %5 = call i8* @llvm.returnaddress(i32 0)
  %6 = ptrtoint i8* %5 to i64
  store i64 %6, i64* %PC, align 8
  store i64 0, i64* %Token, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8
  %8 = load i64, i64* %N, align 8
  %cmp = icmp ult i64 %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %ValSizeInBits, align 8
  %cmp2 = icmp eq i64 %9, 16
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %10 = load i64, i64* %PC, align 8
  %11 = load i64, i64* %i, align 8
  %add = add i64 %10, %11
  %12 = load i64*, i64** %Vals, align 8
  %13 = load i64, i64* %i, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %12, i64 %13
  %14 = load i64, i64* %arrayidx3, align 8
  %conv = trunc i64 %14 to i16
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i8** %type.addr.i, align 8
  store i64 %add, i64* %PC.addr.i, align 8
  store i16 %conv, i16* %Arg1.addr.i, align 2
  store i16 0, i16* %Arg2.addr.i, align 2
  %15 = load i8*, i8** %type.addr.i, align 8
  %16 = load i64, i64* %PC.addr.i, align 8
  %17 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %17 to i32
  %18 = load i16, i16* %Arg2.addr.i, align 2
  %conv1.i = zext i16 %18 to i32
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %15, i64 %16, i32 %conv.i, i32 %conv1.i)
  br label %if.end12

if.else:                                          ; preds = %for.body
  %19 = load i64, i64* %ValSizeInBits, align 8
  %cmp4 = icmp eq i64 %19, 32
  br i1 %cmp4, label %if.then5, label %if.else9

if.then5:                                         ; preds = %if.else
  %20 = load i64, i64* %PC, align 8
  %21 = load i64, i64* %i, align 8
  %add6 = add i64 %20, %21
  %22 = load i64*, i64** %Vals, align 8
  %23 = load i64, i64* %i, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %22, i64 %23
  %24 = load i64, i64* %arrayidx7, align 8
  %conv8 = trunc i64 %24 to i32
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i8** %type.addr.i13, align 8
  store i64 %add6, i64* %PC.addr.i14, align 8
  store i32 %conv8, i32* %Arg1.addr.i15, align 4
  store i32 0, i32* %Arg2.addr.i16, align 4
  %25 = load i8*, i8** %type.addr.i13, align 8
  %26 = load i64, i64* %PC.addr.i14, align 8
  %27 = load i32, i32* %Arg1.addr.i15, align 4
  %28 = load i32, i32* %Arg2.addr.i16, align 4
  %call.i17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %25, i64 %26, i32 %27, i32 %28)
  br label %if.end

if.else9:                                         ; preds = %if.else
  %29 = load i64, i64* %PC, align 8
  %30 = load i64, i64* %i, align 8
  %add10 = add i64 %29, %30
  %31 = load i64*, i64** %Vals, align 8
  %32 = load i64, i64* %i, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %31, i64 %32
  %33 = load i64, i64* %arrayidx11, align 8
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8** %type.addr.i18, align 8
  store i64 %add10, i64* %PC.addr.i19, align 8
  store i64 %33, i64* %Arg1.addr.i20, align 8
  store i64 0, i64* %Arg2.addr.i21, align 8
  %34 = load i8*, i8** %type.addr.i18, align 8
  %35 = load i64, i64* %PC.addr.i19, align 8
  %36 = load i64, i64* %Arg1.addr.i20, align 8
  %37 = load i64, i64* %Arg2.addr.i21, align 8
  %call.i22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0), i8* %34, i64 %35, i64 %36, i64 %37)
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then5
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end12
  %38 = load i64, i64* %i, align 8
  %inc = add i64 %38, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @a() #4 {
entry:
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %aa = alloca i32, align 4
  %bb = alloca i32, align 4
  %num = alloca i32, align 4
  store i32 12, i32* %aa, align 4
  %0 = load i32, i32* %aa, align 4
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 13, i32 %0)
  %cmp = icmp sgt i32 %0, 13
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.8, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  store i32 14, i32* %aa, align 4
  store i32 90, i32* %bb, align 4
  %1 = load i32, i32* %bb, align 4
  %2 = load i32, i32* %aa, align 4
  call void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %1, i32 %2)
  %cmp2 = icmp sgt i32 %1, %2
  br i1 %cmp2, label %if.then3, label %if.else5

if.then3:                                         ; preds = %if.end
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.9, i32 0, i32 0))
  br label %if.end7

if.else5:                                         ; preds = %if.end
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.10, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.else5, %if.then3
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  store i32 2, i32* %num, align 4
  %3 = load i32, i32* %num, align 4
  %add = add nsw i32 %3, 2
  %4 = zext i32 %add to i64
  call void @_Z28__sanitizer_cov_trace_switchmPm(i64 %4, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values, i32 0, i32 0))
  switch i32 %add, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb9
    i32 3, label %sw.bb11
  ]

sw.bb:                                            ; preds = %if.end7
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %5 = load i32, i32* %num, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4.11, i32 0, i32 0), i32 %5)
  br label %sw.bb9

sw.bb9:                                           ; preds = %if.end7, %sw.bb
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %6 = load i32, i32* %num, align 4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5.12, i32 0, i32 0), i32 %6)
  br label %sw.bb11

sw.bb11:                                          ; preds = %if.end7, %sw.bb9
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %7 = load i32, i32* %num, align 4
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6.13, i32 0, i32 0), i32 %7)
  br label %sw.default

sw.default:                                       ; preds = %if.end7, %sw.bb11
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %8 = load i32, i32* %num, align 4
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7.14, i32 0, i32 0), i32 %8)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #4 {
entry:
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  %result = alloca i32, align 4
  %str = alloca [50 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %m, align 4
  %0 = load i32, i32* %m, align 4
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 -1, i32 %0)
  %cmp = icmp sgt i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  call void @a()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %str, i32 0, i32 0
  %call = call i32 (i8*, ...) bitcast (i32 (...)* @gets to i32 (i8*, ...)*)(i8* %arraydecay)
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %str, i32 0, i32 0
  %1 = bitcast i8* %arraydecay1 to i64*
  call void @_Z28__sanitizer_cov_trace_strcmpPmS_(i64* %1, i64* bitcast ([5 x i8]* @str1 to i64*))
  %call2 = call i32 @strcmp(i8* %arraydecay1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str1, i32 0, i32 0)) #6
  store i32 %call2, i32* %result, align 4
  %2 = load i32, i32* %result, align 4
  call void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 0, i32 %2)
  %cmp3 = icmp eq i32 %2, 0
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  br label %if.end8

if.else:                                          ; preds = %if.end
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  %arraydecay6 = getelementptr inbounds [50 x i8], [50 x i8]* %str, i32 0, i32 0
  %3 = load i32, i32* %result, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* %arraydecay6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str1, i32 0, i32 0), i32 %3)
  br label %if.end8

if.end8:                                          ; preds = %if.else, %if.then4
  call void @_Z24__sanitizer_cov_trace_pcv()
  call void asm sideeffect "", ""()
  ret i32 0
}

declare i32 @gets(...) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+popcnt,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
