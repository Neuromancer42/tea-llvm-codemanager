; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx13.0.0"

%struct.aaaa = type { i32, i32, float, double, ptr, %struct.bbbb, [114 x double] }
%struct.bbbb = type { i32, float }

@testt = global i32 0, align 4
@aaaa = global i32 2, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %add = add nsw i32 %0, 1
  ret i32 %add
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca float, align 4
  %d = alloca double, align 8
  %e = alloca %struct.aaaa, align 8
  %f = alloca [2 x %struct.aaaa], align 16
  %g = alloca ptr, align 8
  %saved_stack = alloca ptr, align 8
  %__vla_expr0 = alloca i64, align 8
  store i32 0, ptr %retval, align 4
  store i32 0, ptr %a, align 4
  %0 = load i32, ptr %a, align 4
  %call = call i32 @foo(i32 noundef %0)
  store i32 %call, ptr %b, align 4
  store float 1.000000e+00, ptr %c, align 4
  store double 2.000000e+00, ptr %d, align 8
  %k = getelementptr inbounds %struct.aaaa, ptr %e, i32 0, i32 6
  %arrayidx = getelementptr inbounds [114 x double], ptr %k, i64 0, i64 1
  store double 1.000000e-01, ptr %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds [2 x %struct.aaaa], ptr %f, i64 0, i64 0
  %k2 = getelementptr inbounds %struct.aaaa, ptr %arrayidx1, i32 0, i32 6
  %arrayidx3 = getelementptr inbounds [114 x double], ptr %k2, i64 0, i64 2
  store double 2.000000e-01, ptr %arrayidx3, align 8
  %arraydecay = getelementptr inbounds [2 x %struct.aaaa], ptr %f, i64 0, i64 0
  store ptr %arraydecay, ptr %g, align 8
  %1 = load ptr, ptr %g, align 8
  %arrayidx4 = getelementptr inbounds %struct.aaaa, ptr %1, i64 1
  %k5 = getelementptr inbounds %struct.aaaa, ptr %arrayidx4, i32 0, i32 6
  %arrayidx6 = getelementptr inbounds [114 x double], ptr %k5, i64 0, i64 3
  store double 1.300000e+00, ptr %arrayidx6, align 8
  %2 = load i32, ptr %b, align 4
  %3 = zext i32 %2 to i64
  %4 = call ptr @llvm.stacksave()
  store ptr %4, ptr %saved_stack, align 8
  %vla = alloca i32, i64 %3, align 16
  store i64 %3, ptr %__vla_expr0, align 8
  %5 = load i32, ptr %b, align 4
  store i32 %5, ptr %retval, align 4
  %6 = load ptr, ptr %saved_stack, align 8
  call void @llvm.stackrestore(ptr %6)
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 15.0.7"}
