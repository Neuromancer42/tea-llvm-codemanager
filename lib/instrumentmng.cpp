#include "instrumentmng.h"
#include <iostream>
#include <fstream>
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>
#include "llvm/IR/IRBuilder.h"

using namespace tea;
using namespace std;
using namespace llvm;

InstrumentMgr::InstrumentMgr(const string& name, std::unique_ptr<Module> mod){
    this->name = name;
    this->mod = move(mod);
}

InstrumentMgr::InstrumentMgr(const string& filename){
    ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    mod = parseIRFile(filename, diag, *ctx);
    name = string(mod->getName().data());
}

string InstrumentMgr::get_name() {
    return name;
}

Module* InstrumentMgr::get_mod(){
    return mod.get();
}

bool InstrumentMgr::handleInstrumentReq(map<string, string> options, vector<analysis::Tuple> tuples){
    bool ret_code = false;
    for(int i = 0; i < (int)tuples.size(); ++i){
        analysis::Tuple &t = tuples[i];
        string typeName = t.rel_name();
        if(typeName == "ReachableM"){
            int size = t.attribute_size();
            assert(size == 1 && "error attr size of reachablem");
            ret_code = instrumentReachableM(i, t.attribute(0));
        }
        else if(typeName == "CI-IM"){
            int size = t.attribute_size();
            assert(size == 2 && "error attr size of ci-im");
            ret_code = instrumentCIIM(i, t.attribute(0), t.attribute(1));
        }
        else if(typeName == "PHVal"){
            int size = t.attribute_size();
            assert(size == 2 && "error attr size of phval");
            ret_code = instrumentPHVal(i, t.attribute(0), t.attribute(1));
        }
        else{
            assert("error type");
        }
    }

    Module *M = this->get_mod();
    string outstring;
    raw_string_ostream os(outstring);
    ofstream outfile;
    M->print(os, NULL);
    outfile.open("tea_instrumented.ll");
    outfile << outstring;
    outfile.close();

    return ret_code;
}

bool InstrumentMgr::instrumentReachableM(int i, string methName){
    Module *M = mod.get();

    Type *int32Type = Type::getInt32Ty(M->getContext());
    Type *voidType = Type::getVoidTy(M->getContext());
    Type *ptr8Type = Type::getInt8PtrTy(M->getContext());

    FunctionType *ReachableFuncTy = FunctionType::get(voidType, {int32Type, ptr8Type}, false);

    static const char *ReachableFunction = "tea_reachable";
    static Function *ReachableFunc = (Function*)M->getOrInsertFunction(ReachableFunction, ReachableFuncTy).getCallee();

    for(Module::iterator mi = M->begin(); mi != M->end(); mi++){
        Function &F = *mi;
        if(F.isDeclaration()) continue;
        if(F.getName() == methName){
            BasicBlock &BB0 = *F.begin();
            Instruction &I0 = *BB0.begin();
            IRBuilder<> builder(&I0);
            Value *name = builder.CreateGlobalStringPtr(methName);
            Value *tid = ConstantInt::getSigned(int32Type, i);
            builder.SetInsertPoint(&I0);
            builder.CreateCall(ReachableFuncTy, ReachableFunc, {tid, name});
        }
    }
    return true;
}

bool InstrumentMgr::instrumentCIIM(int i, string invk, string meth){
    Module *M = mod.get();

    Type *int32Type = Type::getInt32Ty(M->getContext());
    Type *ptr64Type = Type::getInt64PtrTy(M->getContext());
    Type *voidType = Type::getVoidTy(M->getContext());
    //Type *ptr8Type = Type::getInt8PtrTy(M->getContext());

    FunctionType *CIIMFuncTy = FunctionType::get(voidType, {int32Type, ptr64Type}, false);

    static const char *CIFunction = "tea_ci";
    static const char *IMFunction = "tea_im";
    static Function *CIFunc = (Function*)M->getOrInsertFunction(CIFunction, CIIMFuncTy).getCallee();
    static Function *IMFunc = (Function*)M->getOrInsertFunction(IMFunction, CIIMFuncTy).getCallee();

    for(Module::iterator mi = M->begin(); mi != M->end(); mi++){
        Function &F = *mi;
        if(F.isDeclaration()) continue;
        if(F.getName() == meth){
            BasicBlock &BB0 = *F.begin();
            Instruction &I0 = *BB0.begin();
            IRBuilder<> builder(&I0);
            //Value *name = builder.CreateGlobalStringPtr(meth);
            Value *imFunc = &F;
            Value *tid = ConstantInt::getSigned(int32Type, i);
            builder.SetInsertPoint(&I0);
            builder.CreateCall(CIIMFuncTy, IMFunc, {tid, imFunc});
        }
    }

    TRAVERSE_INST_OPEN
    CallInst *callInst = dyn_cast<CallInst>(&I);
    if(callInst){
        if(callInst->getCalledFunction() &&
           callInst->getCalledFunction()->getName().equals(invk)){
            IRBuilder<> builder(callInst);
            //Value *name = builder.CreateGlobalStringPtr(invk);
            Value *ciFunc = callInst->getCalledFunction();
            Value *tid = ConstantInt::getSigned(int32Type, i);
            builder.SetInsertPoint(callInst);
            builder.CreateCall(CIIMFuncTy, IMFunc, {tid, ciFunc});
        }
        if(callInst->isIndirectCall()){
            Value *calledOperand = callInst->getCalledOperand();
            LoadInst *loadInst = dyn_cast<LoadInst>(calledOperand);
            while(loadInst){
                calledOperand = loadInst->getPointerOperand();
                loadInst = dyn_cast<LoadInst>(calledOperand);
            }
            if(calledOperand->getName().equals(invk)){
                IRBuilder<> builder(callInst);
                //Value *name = builder.CreateGlobalStringPtr(invk);
                Value *tid = ConstantInt::getSigned(int32Type, i);
                builder.SetInsertPoint(callInst);
                builder.CreateCall(CIIMFuncTy, CIFunc, {tid, callInst->getCalledOperand()});
            }
        }
    }
    TRAVERSE_INST_CLOSE
    return true;
}

bool InstrumentMgr::instrumentPHVal(int i, string inst, string var){
    Module *M = mod.get();

    //Type *int64Type = Type::getInt64Ty(M->getContext());
    Type *voidType = Type::getVoidTy(M->getContext());
    Type *ptr8Type = Type::getInt8PtrTy(M->getContext());
    Type *int32Type = Type::getInt32Ty(M->getContext());
    Type *ptr32Type = Type::getInt32PtrTy(M->getContext());

    FunctionType *PHValFuncTy = FunctionType::get(voidType, {int32Type, ptr8Type, ptr32Type}, false);

    static const char *PHValFunction = "tea_phval";
    static Function *PHValFunc = (Function*)M->getOrInsertFunction(PHValFunction, PHValFuncTy).getCallee();

    Value *val;

    TRAVERSE_INST_OPEN
    if(var.compare(I.getName().data()) == 0){
        val = dyn_cast<Value>(&I);
    }
    TRAVERSE_INST_CLOSE

    TRAVERSE_INST_OPEN
    string inststring;
    raw_string_ostream insts(inststring);
    I.print(insts, NULL);
    if(inst.compare(inststring) == 0){
        IRBuilder<> builder(&I);
        Value *name = builder.CreateGlobalStringPtr(var);
        Value *tid = ConstantInt::getSigned(int32Type, i);
        builder.SetInsertPoint(&I);
        val = builder.CreateBitOrPointerCast(val, ptr32Type, "castto32");
        builder.CreateCall(PHValFuncTy, PHValFunc, {tid, name, val});
    }
    TRAVERSE_INST_CLOSE
    return true;
}