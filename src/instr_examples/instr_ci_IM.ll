; ModuleID = 'instr_ci_IM.c'
source_filename = "instr_ci_IM.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx13.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [12 x i8] c"tea_log.txt\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"a+\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"ci_IM %u %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @__tea__ci_IM(i32 noundef %0, i8* noundef %1, i8* noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.__sFILE*, align 8
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %9 = call %struct.__sFILE* @"\01_fopen"(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  store %struct.__sFILE* %9, %struct.__sFILE** %7, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = load i8*, i8** %6, align 8
  %12 = icmp eq i8* %10, %11
  %13 = zext i1 %12 to i32
  store i32 %13, i32* %8, align 4
  %14 = load %struct.__sFILE*, %struct.__sFILE** %7, align 8
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %8, align 4
  %17 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* noundef %14, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef %15, i32 noundef %16)
  %18 = load %struct.__sFILE*, %struct.__sFILE** %7, align 8
  %19 = call i32 @fclose(%struct.__sFILE* noundef %18)
  ret void
}

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #1

declare i32 @fprintf(%struct.__sFILE* noundef, i8* noundef, ...) #1

declare i32 @fclose(%struct.__sFILE* noundef) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "darwin-stkchk-strong-link" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "darwin-stkchk-strong-link" "frame-pointer"="all" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 3]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Apple clang version 14.0.3 (clang-1403.0.22.14.1)"}
