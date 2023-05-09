; ModuleID = 'test1.c'
source_filename = "test1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx13.0.0"

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
define i32 @bar(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub nsw i32 %0, 1
  ret i32 %sub
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
entry:
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
  store ptr @bar, ptr %p, align 8
  store ptr @foo, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  %2 = load i32, ptr %b, align 4
  %call1 = call i32 %1(i32 noundef %2)
  store i32 %call1, ptr %c, align 4
  %3 = load i32, ptr %c, align 4
  ret i32 %3
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 15.0.7"}
