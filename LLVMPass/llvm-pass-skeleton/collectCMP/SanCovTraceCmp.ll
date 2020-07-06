; ModuleID = 'SanCovTraceCmp.cpp'
source_filename = "SanCovTraceCmp.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.llvm::raw_ostream" = type <{ i32 (...)**, i8*, i8*, i8*, i32, [4 x i8] }>
%"class.llvm::StringRef" = type { i8*, i64 }

$_ZN4llvm11raw_ostreamlsEPKc = comdat any

$_ZN4llvm11raw_ostreamlsENS_9StringRefE = comdat any

$_ZN4llvm11raw_ostreamlsEj = comdat any

$_ZN4llvm11raw_ostreamlsEi = comdat any

$_ZN4llvm11raw_ostreamlsEh = comdat any

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i64, i64* %Arg1.addr.i, align 8
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"* %call.i, i64 %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i64, i64* %Arg2.addr.i, align 8
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"* %call2.i, i64 %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #1

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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i64, i64* %Arg1.addr.i, align 8
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"* %call.i, i64 %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i64, i64* %Arg2.addr.i, align 8
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"* %call2.i, i64 %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z26__sanitizer_cov_trace_cmp4jj(i32 %Arg1, i32 %Arg2) #0 {
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i32, i32* %Arg1.addr.i, align 4
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEj(%"class.llvm::raw_ostream"* %call.i, i32 %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i32, i32* %Arg2.addr.i, align 4
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEj(%"class.llvm::raw_ostream"* %call2.i, i32 %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline optnone uwtable
define void @_Z32__sanitizer_cov_trace_const_cmp4jj(i32 %Arg1, i32 %Arg2) #0 {
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i32, i32* %Arg1.addr.i, align 4
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEj(%"class.llvm::raw_ostream"* %call.i, i32 %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i32, i32* %Arg2.addr.i, align 4
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEj(%"class.llvm::raw_ostream"* %call2.i, i32 %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %5 to i32
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEi(%"class.llvm::raw_ostream"* %call.i, i32 %conv.i)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i16, i16* %Arg2.addr.i, align 2
  %conv3.i = zext i16 %6 to i32
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEi(%"class.llvm::raw_ostream"* %call2.i, i32 %conv3.i)
  %call5.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call4.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i16, i16* %Arg1.addr.i, align 2
  %conv.i = zext i16 %5 to i32
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEi(%"class.llvm::raw_ostream"* %call.i, i32 %conv.i)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i16, i16* %Arg2.addr.i, align 2
  %conv3.i = zext i16 %6 to i32
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEi(%"class.llvm::raw_ostream"* %call2.i, i32 %conv3.i)
  %call5.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call4.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i8, i8* %Arg1.addr.i, align 1
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEh(%"class.llvm::raw_ostream"* %call.i, i8 zeroext %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i8, i8* %Arg2.addr.i, align 1
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEh(%"class.llvm::raw_ostream"* %call2.i, i8 zeroext %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
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
  %call.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv()
  %5 = load i8, i8* %Arg1.addr.i, align 1
  %call1.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEh(%"class.llvm::raw_ostream"* %call.i, i8 zeroext %5)
  %call2.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call1.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %6 = load i8, i8* %Arg2.addr.i, align 1
  %call3.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEh(%"class.llvm::raw_ostream"* %call2.i, i8 zeroext %6)
  %call4.i = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %call3.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

declare dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm4outsEv() #2

declare dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"*, i64) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEPKc(%"class.llvm::raw_ostream"* %this, i8* %Str) #3 comdat align 2 {
entry:
  %this.addr.i = alloca %"class.llvm::StringRef"*, align 8
  %Str.addr.i = alloca i8*, align 8
  %this.addr = alloca %"class.llvm::raw_ostream"*, align 8
  %Str.addr = alloca i8*, align 8
  %agg.tmp = alloca %"class.llvm::StringRef", align 8
  store %"class.llvm::raw_ostream"* %this, %"class.llvm::raw_ostream"** %this.addr, align 8
  store i8* %Str, i8** %Str.addr, align 8
  %this1 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %this.addr, align 8
  %0 = load i8*, i8** %Str.addr, align 8
  store %"class.llvm::StringRef"* %agg.tmp, %"class.llvm::StringRef"** %this.addr.i, align 8
  store i8* %0, i8** %Str.addr.i, align 8
  %this1.i = load %"class.llvm::StringRef"*, %"class.llvm::StringRef"** %this.addr.i, align 8
  %Data.i = getelementptr inbounds %"class.llvm::StringRef", %"class.llvm::StringRef"* %this1.i, i32 0, i32 0
  %1 = load i8*, i8** %Str.addr.i, align 8
  store i8* %1, i8** %Data.i, align 8
  %Length.i = getelementptr inbounds %"class.llvm::StringRef", %"class.llvm::StringRef"* %this1.i, i32 0, i32 1
  %2 = load i8*, i8** %Str.addr.i, align 8
  %tobool.i = icmp ne i8* %2, null
  br i1 %tobool.i, label %cond.true.i, label %cond.false.i

cond.true.i:                                      ; preds = %entry
  %3 = load i8*, i8** %Str.addr.i, align 8
  %call.i = call i64 @strlen(i8* %3) #6
  br label %_ZN4llvm9StringRefC2EPKc.exit

cond.false.i:                                     ; preds = %entry
  br label %_ZN4llvm9StringRefC2EPKc.exit

_ZN4llvm9StringRefC2EPKc.exit:                    ; preds = %cond.true.i, %cond.false.i
  %cond.i = phi i64 [ %call.i, %cond.true.i ], [ 0, %cond.false.i ]
  store i64 %cond.i, i64* %Length.i, align 8
  %4 = bitcast %"class.llvm::StringRef"* %agg.tmp to { i8*, i64 }*
  %5 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 1
  %8 = load i64, i64* %7, align 8
  %call = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsENS_9StringRefE(%"class.llvm::raw_ostream"* %this1, i8* %6, i64 %8)
  ret %"class.llvm::raw_ostream"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsENS_9StringRefE(%"class.llvm::raw_ostream"* %this, i8* %Str.coerce0, i64 %Str.coerce1) #3 comdat align 2 {
entry:
  %this.addr.i11 = alloca %"class.llvm::StringRef"*, align 8
  %this.addr.i9 = alloca %"class.llvm::StringRef"*, align 8
  %this.addr.i = alloca %"class.llvm::StringRef"*, align 8
  %retval = alloca %"class.llvm::raw_ostream"*, align 8
  %Str = alloca %"class.llvm::StringRef", align 8
  %this.addr = alloca %"class.llvm::raw_ostream"*, align 8
  %Size = alloca i64, align 8
  %0 = bitcast %"class.llvm::StringRef"* %Str to { i8*, i64 }*
  %1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %0, i32 0, i32 0
  store i8* %Str.coerce0, i8** %1, align 8
  %2 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %0, i32 0, i32 1
  store i64 %Str.coerce1, i64* %2, align 8
  store %"class.llvm::raw_ostream"* %this, %"class.llvm::raw_ostream"** %this.addr, align 8
  %this1 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %this.addr, align 8
  store %"class.llvm::StringRef"* %Str, %"class.llvm::StringRef"** %this.addr.i, align 8
  %this1.i = load %"class.llvm::StringRef"*, %"class.llvm::StringRef"** %this.addr.i, align 8
  %Length.i = getelementptr inbounds %"class.llvm::StringRef", %"class.llvm::StringRef"* %this1.i, i32 0, i32 1
  %3 = load i64, i64* %Length.i, align 8
  store i64 %3, i64* %Size, align 8
  %4 = load i64, i64* %Size, align 8
  %OutBufEnd = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 2
  %5 = load i8*, i8** %OutBufEnd, align 8
  %OutBufCur = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 3
  %6 = load i8*, i8** %OutBufCur, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %5 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp = icmp ugt i64 %4, %sub.ptr.sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %"class.llvm::StringRef"* %Str, %"class.llvm::StringRef"** %this.addr.i11, align 8
  %this1.i12 = load %"class.llvm::StringRef"*, %"class.llvm::StringRef"** %this.addr.i11, align 8
  %Data.i13 = getelementptr inbounds %"class.llvm::StringRef", %"class.llvm::StringRef"* %this1.i12, i32 0, i32 0
  %7 = load i8*, i8** %Data.i13, align 8
  %8 = load i64, i64* %Size, align 8
  %call3 = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostream5writeEPKcm(%"class.llvm::raw_ostream"* %this1, i8* %7, i64 %8)
  store %"class.llvm::raw_ostream"* %call3, %"class.llvm::raw_ostream"** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %9 = load i64, i64* %Size, align 8
  %tobool = icmp ne i64 %9, 0
  br i1 %tobool, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.end
  %OutBufCur5 = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 3
  %10 = load i8*, i8** %OutBufCur5, align 8
  store %"class.llvm::StringRef"* %Str, %"class.llvm::StringRef"** %this.addr.i9, align 8
  %this1.i10 = load %"class.llvm::StringRef"*, %"class.llvm::StringRef"** %this.addr.i9, align 8
  %Data.i = getelementptr inbounds %"class.llvm::StringRef", %"class.llvm::StringRef"* %this1.i10, i32 0, i32 0
  %11 = load i8*, i8** %Data.i, align 8
  %12 = load i64, i64* %Size, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 %12, i32 1, i1 false)
  %13 = load i64, i64* %Size, align 8
  %OutBufCur7 = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 3
  %14 = load i8*, i8** %OutBufCur7, align 8
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %13
  store i8* %add.ptr, i8** %OutBufCur7, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.end
  store %"class.llvm::raw_ostream"* %this1, %"class.llvm::raw_ostream"** %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %15 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %retval, align 8
  ret %"class.llvm::raw_ostream"* %15
}

declare dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostream5writeEPKcm(%"class.llvm::raw_ostream"*, i8*, i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #5

; Function Attrs: noinline optnone uwtable
define linkonce_odr dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEj(%"class.llvm::raw_ostream"* %this, i32 %N) #3 comdat align 2 {
entry:
  %this.addr = alloca %"class.llvm::raw_ostream"*, align 8
  %N.addr = alloca i32, align 4
  store %"class.llvm::raw_ostream"* %this, %"class.llvm::raw_ostream"** %this.addr, align 8
  store i32 %N, i32* %N.addr, align 4
  %this1 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %this.addr, align 8
  %0 = load i32, i32* %N.addr, align 4
  %conv = zext i32 %0 to i64
  %call = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEm(%"class.llvm::raw_ostream"* %this1, i64 %conv)
  ret %"class.llvm::raw_ostream"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEi(%"class.llvm::raw_ostream"* %this, i32 %N) #3 comdat align 2 {
entry:
  %this.addr = alloca %"class.llvm::raw_ostream"*, align 8
  %N.addr = alloca i32, align 4
  store %"class.llvm::raw_ostream"* %this, %"class.llvm::raw_ostream"** %this.addr, align 8
  store i32 %N, i32* %N.addr, align 4
  %this1 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %this.addr, align 8
  %0 = load i32, i32* %N.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEl(%"class.llvm::raw_ostream"* %this1, i64 %conv)
  ret %"class.llvm::raw_ostream"* %call
}

declare dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEl(%"class.llvm::raw_ostream"*, i64) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostreamlsEh(%"class.llvm::raw_ostream"* %this, i8 zeroext %C) #3 comdat align 2 {
entry:
  %retval = alloca %"class.llvm::raw_ostream"*, align 8
  %this.addr = alloca %"class.llvm::raw_ostream"*, align 8
  %C.addr = alloca i8, align 1
  store %"class.llvm::raw_ostream"* %this, %"class.llvm::raw_ostream"** %this.addr, align 8
  store i8 %C, i8* %C.addr, align 1
  %this1 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %this.addr, align 8
  %OutBufCur = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 3
  %0 = load i8*, i8** %OutBufCur, align 8
  %OutBufEnd = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 2
  %1 = load i8*, i8** %OutBufEnd, align 8
  %cmp = icmp uge i8* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %C.addr, align 1
  %call = call dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostream5writeEh(%"class.llvm::raw_ostream"* %this1, i8 zeroext %2)
  store %"class.llvm::raw_ostream"* %call, %"class.llvm::raw_ostream"** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8, i8* %C.addr, align 1
  %OutBufCur2 = getelementptr inbounds %"class.llvm::raw_ostream", %"class.llvm::raw_ostream"* %this1, i32 0, i32 3
  %4 = load i8*, i8** %OutBufCur2, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %OutBufCur2, align 8
  store i8 %3, i8* %4, align 1
  store %"class.llvm::raw_ostream"* %this1, %"class.llvm::raw_ostream"** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load %"class.llvm::raw_ostream"*, %"class.llvm::raw_ostream"** %retval, align 8
  ret %"class.llvm::raw_ostream"* %5
}

declare dereferenceable(40) %"class.llvm::raw_ostream"* @_ZN4llvm11raw_ostream5writeEh(%"class.llvm::raw_ostream"*, i8 zeroext) #2

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+popcnt,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
