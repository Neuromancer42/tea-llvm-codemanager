for code like `examples/test1.c`:
```c
int foo(int x) {
    return x + 1;
}
int bar(int x) {
    return x - 1;
}
int main() {
    int a = 0;
    int b = foo(a);
    int (*p)(int);
    p = bar;
    p = foo;
    int c = p(b);
    return c;
}
```

and datalog rule of **Context-Insensitive Points-to Analysis**
```
ci_pt(var, addr) :- alloca(var, addr).
ci_pt(var, addr) :- load(var, ptr), ci_pt(ptr, h), ci_hpt(h, addr).
ci_hpt(h, addr) :- store(var, ptr), ci_pt(ptr, h), ci_pt(var, addr).
ci_IM(inst, func) :- P_static_invk(inst, func).
ci_IM(inst, func) :- P_dyn_invk(inst, ptr), ci_pt(ptr, addr), FuncAddr(func, addr).
reachableM(meth) :- main(meth).
reachableM(callee) :- reachableM(caller), MP(caller, inst), ci_IM(inst, callee).
```

provenance:
```
reachableM(foo) <- reachableM(main) /\ MP(foo, 14) /\ ci_IM(14, foo)
reachableM(bar) <- reachableM(main) /\ MP(foo, 14) /\ ci_IM(14, bar)

ci_IM(14, foo) <- P_dyn_invk(14, %1) /\ ci_pt(%1, &foo) /\ FuncAddr(foo, &foo)
ci_IM(14, bar) <- P_dyn_invk(14, %1) /\ ci_pt(%1, &bar) /\ FuncAddr(foo, &bar)

ci_pt(%1, &foo) <- load(%1, %p) /\ ci_pt(%p, &p) /\ ci_hpt(&p, &foo)
ci_pt(%1, &bar) <- load(%1, %p) /\ ci_pt(%p, &p) /\ ci_hpt(&p, &bar)

ci_hpt(&p, %foo) <- store(@foo, %p) /\ ci_pt(%p, &p) /\ ci_pt(@foo, &foo)
ci_hpt(&p, %bar) <- store(@bar, %p) /\ ci_pt(%p, &p) /\ ci_pt(@bar, &bar)
```

instrumenting `ci_IM(14, foo), ci_IM(14, bar), reachableM(foo), reachableM(bar)` 
```c
define i32 @foo(i32 noundef %x) #0 {
entry:
  call void @__tea__reachableM(i32 0) // !!!
  %x.addr = alloca i32, align 4
  ...
}
define i32 @bar(i32 noundef %x) #0 {
entry:
  call void @__tea__reachableM(i32 3) // !!!
  %x.addr = alloca i32, align 4
  ...
}
define i32 @main() #0 {
entry:
  ...
  %1 = load ptr, ptr %p, align 8
  %2 = load i32, ptr %b, align 4
  call void @__tea__ci_IM(i32 2, ptr %1, ptr @foo) // !!!
  call void @__tea__ci_IM(i32 5, ptr %1, ptr @bar) // !!!
  %call1 = call i32 %1(i32 noundef %2)
  ...
}
```

```c;  
void __tea__ci_IM(unsigned tid, void * called, void * target){
    int match = called == target;
    TEA_LOG("ci_IM %u %d\n", tid, match);
}

void __tea__reachableM(unsigned tid){
    TEA_LOG("reachableM %u\n", tid);
}
```

executing the instrumented, the instrumented info collects:
```shell
reachableM 0
ci_IM 2 1
ci_IM 5 0
reachableM 0
```

it proves:
```
reachableM(foo)
ci_IM(14, foo)
```
and negates:
```
ci_IM(14, bar)
```