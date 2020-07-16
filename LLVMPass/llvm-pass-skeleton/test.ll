; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.7 = private unnamed_addr constant [23 x i8] c"Default: Value is: %d\0A\00", align 1
@str1 = dso_local constant [5 x i8] c"abcd\00", align 1, !dbg !0
@str2 = dso_local local_unnamed_addr constant [5 x i8] c"abCd\00", align 1, !dbg !6
@str = private unnamed_addr constant [3 x i8] c"A-\00", align 1
@str.10 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@str.11 = private unnamed_addr constant [4 x i8] c"NEQ\00", align 1
@str.12 = private unnamed_addr constant [3 x i8] c"EQ\00", align 1
@0 = internal constant [15 x i8] c"test.c|a|entry\00"
@1 = internal constant [18 x i8] c"test.c|main|entry\00"
@2 = internal constant [21 x i8] c"test.c|main|if.then4\00"
@3 = internal constant [20 x i8] c"test.c|main|if.else\00"
@4 = internal constant [20 x i8] c"test.c|main|if.end8\00"

; Function Attrs: nounwind uwtable
define dso_local void @a() local_unnamed_addr #0 !dbg !17 {
entry:
  call void @__sanitizer_cov_trace_pc(i64* bitcast ([15 x i8]* @0 to i64*)), !dbg !25
  call void asm sideeffect "", ""(), !dbg !25
  call void @llvm.dbg.value(metadata i32 12, metadata !21, metadata !DIExpression()), !dbg !25
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i64 0, i64 0)), !dbg !26
  call void @llvm.dbg.value(metadata i32 14, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i32 90, metadata !23, metadata !DIExpression()), !dbg !29
  %puts22 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.10, i64 0, i64 0)), !dbg !30
  call void @llvm.dbg.value(metadata i32 2, metadata !24, metadata !DIExpression()), !dbg !33
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i32 2), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !37 {
entry:
  call void @__sanitizer_cov_trace_pc(i64* bitcast ([18 x i8]* @1 to i64*))
  call void asm sideeffect "", ""()
  %str = alloca [50 x i8], align 16
  call void @llvm.dbg.value(metadata i32 0, metadata !41, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata i32 12, metadata !21, metadata !DIExpression()) #5, !dbg !54
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i64 0, i64 0)) #5, !dbg !58
  call void @llvm.dbg.value(metadata i32 14, metadata !21, metadata !DIExpression()) #5, !dbg !54
  call void @llvm.dbg.value(metadata i32 90, metadata !23, metadata !DIExpression()) #5, !dbg !59
  %puts22.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.10, i64 0, i64 0)) #5, !dbg !60
  call void @llvm.dbg.value(metadata i32 2, metadata !24, metadata !DIExpression()) #5, !dbg !61
  %call13.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i32 2) #5, !dbg !62
  %0 = getelementptr inbounds [50 x i8], [50 x i8]* %str, i64 0, i64 0, !dbg !63
  call void @llvm.lifetime.start.p0i8(i64 50, i8* nonnull %0) #5, !dbg !63
  call void @llvm.dbg.declare(metadata [50 x i8]* %str, metadata !43, metadata !DIExpression()), !dbg !64
  %call = call i32 (i8*, ...) bitcast (i32 (...)* @gets to i32 (i8*, ...)*)(i8* nonnull %0) #5, !dbg !65
  %1 = bitcast i8* %0 to i64*, !dbg !66
  call void @__sanitizer_cov_trace_strcmp(i64* %1, i64* bitcast ([5 x i8]* @str1 to i64*), i64 5), !dbg !66
  %memcmp = call i32 @memcmp(i8* nonnull %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str1, i64 0, i64 0), i64 5), !dbg !66
  call void @llvm.dbg.value(metadata i32 %memcmp, metadata !42, metadata !DIExpression()), !dbg !67
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %memcmp), !dbg !68
  %cmp3 = icmp eq i32 %memcmp, 0, !dbg !68
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !70

if.then4:                                         ; preds = %entry
  call void @__sanitizer_cov_trace_pc(i64* bitcast ([21 x i8]* @2 to i64*)), !dbg !71
  call void asm sideeffect "", ""(), !dbg !71
  %puts14 = call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i64 0, i64 0)), !dbg !71
  br label %if.end8, !dbg !73

if.else:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc(i64* bitcast ([20 x i8]* @3 to i64*)), !dbg !74
  call void asm sideeffect "", ""(), !dbg !74
  %puts = call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.11, i64 0, i64 0)), !dbg !74
  br label %if.end8

if.end8:                                          ; preds = %if.else, %if.then4
  call void @__sanitizer_cov_trace_pc(i64* bitcast ([20 x i8]* @4 to i64*)), !dbg !76
  call void asm sideeffect "", ""(), !dbg !76
  call void @llvm.lifetime.end.p0i8(i64 50, i8* nonnull %0) #5, !dbg !76
  ret i32 0, !dbg !77
}

declare dso_local i32 @gets(...) local_unnamed_addr #4

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #6

declare void @__sanitizer_cov_trace_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_const_cmp1(i8 zeroext, i8 zeroext)

declare void @__sanitizer_cov_trace_const_cmp2(i16 zeroext, i16 zeroext)

declare void @__sanitizer_cov_trace_const_cmp4(i32 zeroext, i32 zeroext)

declare void @__sanitizer_cov_trace_const_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_strcmp(i64*, i64*, i64)

declare void @__sanitizer_cov_trace_pc(i64*)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "str1", scope: !2, file: !3, line: 42, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 8.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "test.c", directory: "/home/zhangzheng1/zhangzheng1/codes/myUtilities/LLVMPass/llvm-pass-skeleton")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "str2", scope: !2, file: !3, line: 42, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 40, elements: !11)
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{!12}
!12 = !DISubrange(count: 5)
!13 = !{i32 2, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{!"clang version 8.0.1 "}
!17 = distinct !DISubprogram(name: "a", scope: !3, file: !3, line: 4, type: !18, scopeLine: 5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !20)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{!21, !23, !24}
!21 = !DILocalVariable(name: "aa", scope: !17, file: !3, line: 6, type: !22)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocalVariable(name: "bb", scope: !17, file: !3, line: 17, type: !22)
!24 = !DILocalVariable(name: "num", scope: !17, file: !3, line: 28, type: !22)
!25 = !DILocation(line: 6, column: 9, scope: !17)
!26 = !DILocation(line: 13, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !3, line: 12, column: 5)
!28 = distinct !DILexicalBlock(scope: !17, file: !3, line: 7, column: 9)
!29 = !DILocation(line: 17, column: 9, scope: !17)
!30 = !DILocation(line: 20, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 19, column: 5)
!32 = distinct !DILexicalBlock(scope: !17, file: !3, line: 18, column: 9)
!33 = !DILocation(line: 28, column: 9, scope: !17)
!34 = !DILocation(line: 38, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !17, file: !3, line: 30, column: 5)
!36 = !DILocation(line: 40, column: 1, scope: !17)
!37 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 44, type: !38, scopeLine: 45, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !40)
!38 = !DISubroutineType(types: !39)
!39 = !{!22}
!40 = !{!41, !42, !43, !47, !52}
!41 = !DILocalVariable(name: "m", scope: !37, file: !3, line: 46, type: !22)
!42 = !DILocalVariable(name: "result", scope: !37, file: !3, line: 52, type: !22)
!43 = !DILocalVariable(name: "str", scope: !37, file: !3, line: 53, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocalVariable(name: "__s1_len", scope: !48, file: !3, line: 58, type: !49)
!48 = distinct !DILexicalBlock(scope: !37, file: !3, line: 58, column: 14)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 62, baseType: !51)
!50 = !DIFile(filename: "/data2/zhangzheng1/tools/llvm-8.0.1/usr/local/lib/clang/8.0.1/include/stddef.h", directory: "")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocalVariable(name: "__s2_len", scope: !48, file: !3, line: 58, type: !49)
!53 = !DILocation(line: 46, column: 9, scope: !37)
!54 = !DILocation(line: 6, column: 9, scope: !17, inlinedAt: !55)
!55 = distinct !DILocation(line: 49, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !3, line: 48, column: 5)
!57 = distinct !DILexicalBlock(scope: !37, file: !3, line: 47, column: 9)
!58 = !DILocation(line: 13, column: 9, scope: !27, inlinedAt: !55)
!59 = !DILocation(line: 17, column: 9, scope: !17, inlinedAt: !55)
!60 = !DILocation(line: 20, column: 9, scope: !31, inlinedAt: !55)
!61 = !DILocation(line: 28, column: 9, scope: !17, inlinedAt: !55)
!62 = !DILocation(line: 38, column: 9, scope: !35, inlinedAt: !55)
!63 = !DILocation(line: 53, column: 5, scope: !37)
!64 = !DILocation(line: 53, column: 10, scope: !37)
!65 = !DILocation(line: 55, column: 5, scope: !37)
!66 = !DILocation(line: 58, column: 14, scope: !48)
!67 = !DILocation(line: 52, column: 9, scope: !37)
!68 = !DILocation(line: 59, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !37, file: !3, line: 59, column: 9)
!70 = !DILocation(line: 59, column: 9, scope: !37)
!71 = !DILocation(line: 61, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !3, line: 60, column: 5)
!73 = !DILocation(line: 62, column: 5, scope: !72)
!74 = !DILocation(line: 65, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 64, column: 5)
!76 = !DILocation(line: 75, column: 1, scope: !37)
!77 = !DILocation(line: 74, column: 5, scope: !37)
