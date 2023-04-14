#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>
#include "llvm/IR/IRBuilder.h"

using namespace llvm;
using namespace std;

int main(){
    unique_ptr<llvm::LLVMContext> ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    unique_ptr<llvm::Module> mod = parseIRFile("test.ll", diag, *ctx);
    string name = string(mod->getName().data());

    string methName = "main";

    Module *M = mod.get();

    Type *int64Type = Type::getInt64Ty(M->getContext());
    Type *voidType = Type::getVoidTy(M->getContext());
    Type *ptr8Type = Type::getInt8PtrTy(M->getContext());

    FunctionType *ReachableFuncTy = FunctionType::get(voidType, {ptr8Type}, false);

    static const char *ReachableFunction = "tea_reachable";
    static Function *ReachableFunc = (Function*)M->getOrInsertFunction(ReachableFunction, ReachableFuncTy).getCallee();

    Value *Name = M->getOrInsertGlobal(methName, ptr8Type);

    for(Module::iterator mi = M->begin(); mi != M->end(); mi++){
        Function &F = *mi;
        if(F.isDeclaration()) continue;
        if(F.getName() == methName){
            printf("ffff\n");
            BasicBlock &BB0 = *F.begin();
            Instruction &I0 = *BB0.begin();
            IRBuilder<> builder(&I0);
            builder.SetInsertPoint(&I0);
            builder.CreateCall(ReachableFuncTy, ReachableFunc, {Name});
        }
    }
}