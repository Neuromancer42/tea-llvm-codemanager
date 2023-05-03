; ModuleID = 'test/test.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%lu\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@__func__.main = private unnamed_addr constant [5 x i8] c"main\00", align 1
@0 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 noundef %x) #0 {
entry:
  call void @tea_im(i32 1, ptr @foo)
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef @foo)
  %0 = load i32, ptr %x.addr, align 4
  %add = add nsw i32 %0, 1
  ret i32 %add
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  call void @tea_im(i32 3, ptr @main)
  call void @tea_reachable(i32 0, ptr @0)
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p = alloca ptr, align 8
  %c = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 0, ptr %a, align 4
  %0 = load i32, ptr %a, align 4
  %call = call i32 @foo(i32 noundef %0)
  store i32 %call, ptr %b, align 4
  store ptr @foo, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %1)
  %2 = load ptr, ptr %p, align 8
  %3 = load i32, ptr %b, align 4
  call void @tea_ci(i32 1, ptr %2)
  call void @tea_ci(i32 3, ptr %2)
  %call2 = call i32 %2(i32 noundef %3)
  store i32 %call2, ptr %c, align 4
  call void @tea_phval(i32 2, ptr @1, ptr %c)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef @__func__.main)
  %4 = load i32, ptr %b, align 4
  ret i32 %4
}

declare void @tea_reachable(i32, ptr)

declare void @tea_ci(i32, ptr)

declare void @tea_im(i32, ptr)

declare void @tea_phval(i32, ptr, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 716e1b856aa38ef1d988af73413e7e4aadad2ffa)"}
