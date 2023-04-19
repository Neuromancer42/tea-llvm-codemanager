# Relations of LLVM IR

> Note:
>
> This relational representation is inspired by the not-yet-implemented design of 
> [LLVM Relational Representation](https://github.com/petablox/petablox/wiki/LLVM-Relational-Representation)
> from [petablox](https://github.com/petablox/petablox).
> 
> The main difference comes that this version adapts to typed-datalog like [souffle](https://souffle-lang.github.io/). 
> Along with type-system, it is more convenient to write rules with these relations.
> 
> Moreover, some modifications are made according to updates of LLVM. Currently, it fits **LLVM 15.0.x** only

The main principle of these proposed relations is "deferred-abstraction". It means that the generated set of tuples is 
isomorphic to the original IR program, i.e. we can rebuild exactly the same program back from them. (but we may drop 
most of the intrinsics / metadata). Abstraction steps is made afterward by future datalog rules.

## Auxiliaries
Some elements are universal.

domains:
* **Z** for natural numbers, which are used to represent ordinals for function parameters, structure fields, phi nodes
* **C** for constants, also used for array/vector size, type width, e.t.c.


## Control Flow
Control flow are represented as graphs over *basicblocks*, and each basicblock is composed a series of *instructions*:

domains: 
* **B** for `BasicBlock`
* **P** for `Instruction` (it's abbreviation of Program-point)

relations:
* `basicblock_pred(bb_pred:B, bb_next:B)`
* `basicblock_entry(bb:B, entry_inst:P)`
* `basicblock_exit(bb:B, exit_inst:P)`
* `instruction_basicblock(inst:P, bb:B)`, an instruction `inst` belongs to a basicblock `bb`
* `instruction_next(inst:P, next:P)`

## Types
Types are handled by the type system of LLVM IR. Necessary features of types are recorded (and abstracted) via relation predicates.
Though the string representation of type objects contains complete information, it is not recommended to parse from it.

domains:
* **T** for `Type`

relations:
* Void Type
  + `void_type(ty:T)`
* Function Type
  + `fn_type(ty:T)` 
  + `fn_type_varargs(ty:T)`, this function type `ty` can accept variable arguments
  + `fn_type_return(fn_ty:T, ret_ty:T)`, this function type `fn_ty` has return type `ret_ty`
  + `fn_type_nparams(fn_ty:T, n:Z)`, this function type `fn_ty` has `n` parameters
  + `fn_type_param(fn_ty:T, i:Z, param_ty:T)`, the `i`-th parameter of function type `fn_ty` has type `param_ty`
* Integer Type
  + `integer_type(ty:T)`
* FloatingPoint Type
  + `floatingpoint_type(ty:T)`
* Pointer Type
  + `pointer_type(ty:T)`
  + `pointer_type_opaque(ty:T)`, the pointer type `ty` is opaque. 
  Note that starting from 15.0, LLVM IR pointers are by default **opaque**, and contains no information of the pointee type.
  For more details, see the [doc of opaque pointers](https://releases.llvm.org/15.0.0/docs/OpaquePointers.html)
  + `pointer_type_component(ty:T, pointee_ty:T)`, the pointee-type relation is preserved, for: 
    1. compatibility for previous versions of LLVM; and 
    2. special needs of typed pointers for GPU targets such as DXIL or SPIR-V
  + `pointer_type_addr_space(ty:T, addr:AS)`, the pointer `ty` can be in specific address space `addr`
* Vector Type
  + `vector_type(ty:T)`
  + `vector_type_size(ty:T, size:C)`, a fixed-length vector type `ty` has length `size`
  + `vector_type_min_size(ty:T, min_size:C)`, a scalable vector type `ty` has minimum length `min_size` // ???
  + `vector_type_component(ty:T, comp_ty:T)`, the content of vector type `ty` has type `comp_ty`
* Array Type
  + `array_type(ty:T)`
  + `array_type_size(ty:T, size:C)`, an array type `ty` has length `size`
  + `array_type_component(ty:T, comp_ty:T)`, an array type `ty` has content type `comp_ty`
* Struct Type
  + `struct_type(ty:T)`
  + `struct_type_name(ty:T, name:AS)`, a struct type my have a name
  + `opaque_struct_type(ty:T)`, a struct type may be opaque (i.e. declared here but defined in other places)
  + `struct_type_nfields(ty:T, n:Z)`, a struct type `ty` has `n` fields
  + `struct_type_field(ty:T, i:Z, f_ty:T)`, the `i`-th field of struct type `ty` has type `f_ty`
* Label
  + `label(ty:T)`
* Unhandled types: `Token`, `Metadata`, `X86_amx`, `X86_mmx`

## Variables
* Common for all variables (or operands)
  + `variable_type(v:V, ty:T)`
* Constant data
  + `variable_const_int(v:V, c:C)`
  + `variable_const_fp(v:V, c:C)`
  + `variable_const_ptr_null(v:V)`
  + `variable_const_token_none(v:V)`
* Complex constants
  + structure constants
    - `variable_const_struct(v:V)`
    - `variable_const_struct_nfields(v:V, n:Z)`
    - `variable_const_struct_field(v:V, i:Z, sub:V)`
  + array constants
    - `variable_const_array(v:V)`
    - `variable_const_array_len(v:V, len:C)`
    - `variable_const_array_elem(v:V, elem:V)` // TODO should this be marked as cardinals?
  + vector constants
    - `variable_const_vector(v:V)`
    - `variable_const_vector_len(v:V, len:C)`
    - `variable_const_vecotr_elem(v:V, elem:V)`
  + zero initializer
    - `variable_const_aggzero(v:V)`
  + constant sequential
  + *skip* metadata
* Global and functions
  + global variable
    - `variable_global(v:V)`
    - `variable_global_type(v:V, ty:T)`
    - `variable_global_linkage(v:V, link:L)`
    - `variable_global_align(v:V, align:C)`
    - `variabel_global_init(v:V, init_val:C)`
  + global aliases
    -`variable_alias(v:V)`
    -`variable_alias_aliasee(v:V, aliasee:V)`
  + ifunc
    - `variable_ifunc(v:V)`
    - `variable_ifunc_resolver(v:V, m:M)`
  + functions
    - `variable_func(v:V, m:M)`
* Undef and poison
  + `variable_undef(v:V)`
  + `variable_undef_poison(v:V)`
* address of basicblocks
  + `variable_blockaddr(v:V, b:B)`
* *skip* DSO local equivalent
* *skip* NO CFI
* constant expressions
  + `variable_constexpr(v:V)`
* expressions, common for both constexprs and instructions
  + unary operations, `<uop>` = `fneg`
    -`operation_unary_<uop>(res:V, inner:V)`, refined handling of some operators
  + binary operations, `<bop>` = `add` / `fadd` / `sub` / `fsub` / `mul` / `fmul` / `udiv` / `sdiv` / `fdiv` / `urem` / `srem` / `frem` / `shl` / `lshr` / `ashr` / `and` / `or` / `xor`
    -`operation_binary_<bop>(res:V, left:V, right:V)`, refined handling of some operators,
  + vector operations
    - `operation_extractelement(res:V, base:V, idx:V)`
    - `operation_insertelement(res:V, base:V, elem:V, idx:V)`
    - `operation_shufflevector(res:V, v1:V, v2:V, mask:V)`
  + aggregate operations
    - `operation_extractvalue_base(res:V, base:V)`
    - `operation_extractvalue_nindices(res:V, n:Z)`
    - `operation_extractvalue_index(res:V, i:Z, id:Z)`
  + `getelementptr`
    - `operation_gep_inbounds(res:V)`
    - `operation_gep_base(res:V, addr:V)`
    - `operation_gep_type(res:V, ty:T)`
    - `operation_gep_nindices(res:V, n:Z)`
    - `operation_gep_index_field(res:V, i:Z, f:Z)`
    - `operation_gep_index_offset(res:V, i:Z, off:V)`
  + conversion operations, `<castop>` = `trunc` / `zext` / `sext` / `fptoui` / `fptosi` / `uitofp` / `sitofp` / `fptrunc` / `fpext` / `ptrtoint` / `inttoptr` / `bitcast`
    * `operation_cast_<castop>(res:V, src:V, from_ty:T, to_ty:T)`
  + `icmp`, `<pred>` = `eq` / `ne` / `ugt` / `uge` / `ult` / `ule` / `sgt` / `sge` / `slt` / `sle`
    - `operation_icmp_<pred>(res:V, left:V, right:V)`
  + `fcmp`, `<pred>` = `false` / `oeq` / `ogt` / `oge` / `olt` / `ole` / `one` / `ord` / `ueq` / `ugt` / `uge` / `ult` / `ule` / `une` / `uno` / `true`
    - `operation_fcmp_<pred>(res:V, left:V, right:V)`
  
## Functions
> The `Function` class represents a single procedure in LLVM. It is actually 
> one of the more complex classes in the LLVM hierarchy because it must keep 
> track of a large amount of data. The Function class keeps track of a list of
> `BasicBlocks`, a list of formal `Arguments`, and a `SymbolTable`
> --[LLVM Language Reference](https://llvm.org/docs/LangRef.html#functions)

domains:
* **M** for `Function`

relations:
* `main_function(fn:M)`, the main entry function (usually `main`)
* `function_type(fn:M, ty:T)`, a function `fn` has type `ty`
* `function_name(fn:M, name:V)`, a function `fn` has a `name`, this name is also an identifier referring to this function
* `function_linkage(fn:M, link:L)`
* `function_nparams(fn:M, n:Z)`, a function `fn` has `n` arguments
* `function_param(fn:M, i:Z, arg:V)`, the `i`-th argument of a function `fn` is variable `arg`
* `function_extern(fn:M)`, the function `fn` is declared only and needs linkage.
* `function_entry(fn:M, bb:B)`, the function `fn` has a definition and the entry block is `bb`

## Instructions

relations:
- terminator instructions
  * `ret`
    + `instruction_ret(inst:P)`, instruction `inst` is a return instruction.
    + `instruction_ret_var(inst:P, v:V)`, instruction `inst` returns value of variable `v`
    + `instruction_ret_void(inst:P)`, instruction `inst` has no return value
  * `br`
    + `instruction_br(inst:P)`, instruction `inst` is a branch instruction
    + `instruction_br_cond(inst:P)`, instruction `inst` is a conditional branch
    + `instruction_br_cond_var(br_inst:P, v:V)`, conditional branch `br_inst` has condition `v`
    + `instruction_br_cond_iftrue(br_inst:P, l:B)`, conditional branch `br_inst` goes to basicblock `l` if the condition is satisfied
    + `instruction_br_cond_iffalse(br_inst:P, l:B)`, conditional branch `br_inst` goes to basicblock `l` if the condition is unsatisfied
    + `instruction_br_uncond(inst:P)`, instruction `inst` is an unconditional branch
    + `instruction_br_uncond_goto(br_inst:P, l:B)`, unconditional branch `br_inst` goes to basicblock `l`
  * `switch`
    + `instruction_switch(inst:P)`, instruction `inst` is a switch instruction
    + `instruction_switch_var(inst:P, v:V)`, switch instruction `inst` has condition `v`
    + `instruction_switch_default(sw_inst:P, l:B)`, switch instruction `sw_inst` has default destination `l`
    + `instruction_switch_ncases(sw_inst:P, n:Z)`, switch instruction `sw_inst` has `n` cases
    + `instruction_switch_case_val(sw_inst:P, i:Z, cval:C)`, the `i`-th case of `sw_inst` compares to value constant `cval`
    + `instruction_switch_case_goto(sw_inst:P, i:Z, l:B)`, the `i`-th case of `sw_isnt` goes to basicblock `l` if condition matches
  * `indirectbr`
    + `instruction_indirectbr(inst:P)`, instruction `inst` is an indirectbranch
    + `instruction_indirectbr_addr(inst:P, p:V)`, indirectbr `inst` has target specified by pointer `p`
    + `instruction_indirectbr_nlabels(inst:P, n:Z)`, indirectbr `inst` has `n` possible destinations
    + `instruction_indirectbr_label(inst:P, i:Z, l:B)`, the `i`-th label of indirectbr `inst` goes to basicblock `l`
  * `invoke`
    + `instruction_invk(inst:P)`
    + `instruction_invk_void(inst:P)`
    + `instruction_invk_res(inst:P, var:V)`
    + `instruction_invk_static(inst:P, func:M)`
    + `instruction_invk_dynamic(inst:P, fptr:V)`
    + `instruction_invk_nargs(inst:P, n:Z)`
    + `instruction_invk_arg(inst:P, i:Z, arg:V)`
    + `instruction_invk_normaldest(inst:P, normal_dest:B)`
    + `instruction_invk_exceptiondest(inst:P, execption_dest:B)`
  * `callbr`
    + `instruction_callbr(inst:P)`
    + `instruction_callbr_void(inst:P)`
    + `instruction_callbr_res(inst:P, var:V)`
    + `instruction_callbr_static(inst:P, func:M)`
    + `instruction_callbr_dynamic(inst:P, fptr:V)`
    + `instruction_callbr_nargs(inst:P, n:Z)`
    + `instruction_callbr_arg(inst:P, i:Z, arg:V)`
    + `instruction_callbr_fallthrough(inst:P, dest:B)`
    + `instruction_callbr_indirect(inst:P, dest:B)`
  * `resume`
    + `instruction_resume(inst:P)`
    + `instruction_resume_var(inst:P, v:V)`
  * `catchswitch`
    + `instruction_catchswitch(inst:P)`
    + `instruction_catchswitch_res(inst:P, res:V)`
    + `instruction_catchswitch_within(inst:P, pad:V)`
    + `instruction_catchswitch_handler(inst:P, handler:B)`
    + `instruction_catchswitch_unwindlabel(inst:P, dest:B)`
    + `instruction_catchswitch_unwindcaller(inst:P)`
  * `catchret`
    + `instruction_catchret(inst:P)`
    + `instruction_catchret_fromto(inst:P, pad:V, label:B)`
  * `cleanupret`
    + `instruction_cleanupret(inst:P)`
    + `instruction_cleanupret_from(inst:P, pad:V)`
    + `instruction_cleanupret_unwindlabel(inst:P, dest:B)`
    + `instruction_cleanupret_unwindcaller(inst:P)`
  * `unreachable`
    + `instruction_unreachable(inst:P)`, instruction `inst` is unreachable
  + `insertvalue`
    * `instruction_insertvalue(inst:P)`, instruction `inst` is an insertvalue operation
    * `instruction_insertvalue_res(inst:P, res:V)`
    * `instruction_insertvalue_base(inst:P, base:V)`
    * `instruction_insertvalue_elem(inst:P, elem:V)`
    * `instruction_insertvalue_nindices(inst:P, n:Z)`
    * `instruction_insertvalue_index(inst:P, i:Z, id:Z)`
- memory access and addressing operations
  + `alloca`
    * `instruction_alloca(inst:P)`
    * `instruction_alloca_res(inst:P, res:V)`
    * `instruction_alloca_type(inst:P, ty:T)`
    * `instruction_alloca_size(inst:P, n:V)`
    * `instruction_alloca_align(inst:P, align:C)`
  + `load`
    * `instruction_load(inst:P)`
    * `instruction_load_volatile(inst:P)`, a load instruction `inst` may be marked as *volatile* to tell optimizers not to modify its order of execution // TODO: this is needless for analysis
    * `instruction_load_ordering(inst:P, ord:ORD)`, if a load instruction `inst` is *atomic*, then an ordering `ord` should be specified
    * `instruction_load_res(inst:P, res:V)`, a load instruction `inst` fetches the loaded value in variable `res`
    * `instruction_load_addr(inst:P, ptr:V)`
    * `instruction_load_align(inst:P, align:C)`
  + `store`
    * `instruction_store(inst:P)`
    * `instruction_store_volatile(inst:P)`
    * `instruction_store_ordering(inst:P, ord:ORD)`
    * `instruction_store_var(inst:P, v:V)`
    * `instruction_store_addr(inst:P, ptr:V)`
    * `instruction_store_align(inst:P, align:C)`
  + `fence`
    * `instruction_fence(inst:P)`
    * `instruction_fence_ordering(inst:P, ord:ORD)`
  + `cmpxchg`
    * `instruction_cmpxchg(inst:P)`
    * `instruction_cmpxchg_weak(inst:P)`
    * `instruction_cmpxchg_strong(inst:P)`
    * `instruction_cmpxchg_volatile(inst:P)`
    * `instruction_cmpxchg_succ_ordering(inst:P, ord:ORD)`
    * `instruction_cmpxchg_fail_ordering(inst:P, ord:ORD)`
    * `instruction_cmpxchg_addr(inst:P, ptr:V)`
    * `instruction_cmpxchg_cmp(inst:P, var:V)`
    * `instruction_cmpxchg_new(inst:P, new:V)`
  + `atomicrmw`, `<bop>` = `xchg` / `add` / `sub` / `and` / `nand` / `or` / `xor` / `max` / `min` / `umax` / `umin` / `fadd` / `fsub` / `fmax` / `fmin` / `bad`
    * `instruction_atomicrmw(inst:P)`
    * `instruction_atomicrmw_volatile(inst:P)`
    * `instruction_atomicrmw_ordering(inst:P, ord:ORD)`
    * `instruction_atomicrmw_<bop>(inst:P, addr:V, val:V)`, the *atomicrmw* instruction `inst` reads value from address `addr`, applies `<bop>` with value `val`, and then stores result to `addr`;
- other operations
  + `phi`
    * `instruction_phi(inst:P)`
    * `instruction_phi_res(inst:P, res:V)`
    * `instruction_phi_npairs(inst:P, n:Z)`
    * `instruction_phi_pair(inst:P, i:Z, var:V, l:B)`
  + `select`
    * `instruction_select(inst:P)`
    * `instruction_select_expr(inst:P, res:V, cond:V, true_v:V, false_v:V)`
  + `freeze`
    * `instruction_freeze(inst:P)`
    * `instruction_freeze_var(inst:P, var:V)`
  + `call`
    * `instruction_call(inst:P)`
    * `instruction_call_void(inst:P)`
    * `instruction_call_res(inst:P, var:V)`
    * `instruction_call_static(inst:P, func:M)`
    * `instruction_call_dynamic(inst:P, fptr:V)`
    * `instruction_call_nargs(inst:P, n:Z)`
    * `instruction_call_arg(inst:P, i:Z, arg:V)`
  + `vaarg`
    * `instruction_vaarg(inst:P)`
    * `instruction_vaarg_expr(inst:P, res:V, list:V)`
  + `landingpad`
    * `instruction_landingpad(inst:P)`
    * `instruction_landingpad_res(inst:P, res:V)`
    * `instruction_landingpad_cleanup(inst:P)`
    * `instruction_landingpad_nocleanup(inst:P)`
    * `instruction_landingpad_nclses(inst:P, n:Z)`
    * `instruction_landingpad_cls_catch(inst:P, i:Z, v:V)`
    * `instruction_landingpad_cls_filter(inst:P, i:Z, c:C)`
  + `catchpad`
    * `instruction_catchpad(inst:P)`
    * `instruction_catchpad_res(inst:P, res:V)`
    * `instruction_catchpad_within(inst:P, v:V)`
    * `instruction_catchpad_nargs(inst:P, n:Z)`
    * `instruction_catchpad_arg(inst:P, i:Z, arg:V)`
  + `cleanuppad`
    * `instruction_cleanuppad(inst:P)`
    * `instruction_cleanuppad_res(inst:P, res:V)`
    * `instruction_cleanuppad_within(inst:P, parent:B)`
    * `instruction_cleanuppad_nargs(inst:P, n:Z)`
    * `instruction_cleanuppad_arg(inst:P, i:Z, arg:V)`
- pure operations, these operations compute over values and does not touch memory nor control flow
  + `instruction_op(inst:P)`
  + `instruction_op_res(inst:P, res:V)`
    * unary operations, `<uop>` = `fneg`
    * binary operations, `<bop>` = `add` / `fadd` / `sub` / `fsub` / `mul` / `fmul` / `udiv` / `sdiv` / `fdiv` / `urem` / `srem` / `frem` / `shl` / `lshr` / `ashr` / `and` / `or` / `xor`
    * vector operations, `extractelement`, `insertelement`, `shuffleelement`
    * aggregate operations, `extractvalue`, `insertvalue`
    * `getelementptr`
    * conversion operations, `<castop>` = `trunc` / `zext` / `sext` / `fptoui` / `fptosi` / `uitofp` / `sitofp` / `fptrunc` / `fpext` / `ptrtoint` / `inttoptr` / `bitcast`
    * `icmp`, `<pred>` = `eq` / `ne` / `ugt` / `uge` / `ult` / `ule` / `sgt` / `sge` / `slt` / `sle`
    * `fcmp`, `<pred>` = `false` / `oeq` / `ogt` / `oge` / `olt` / `ole` / `one` / `ord` / `ueq` / `ugt` / `uge` / `ult` / `ule` / `une` / `uno` / `true`
