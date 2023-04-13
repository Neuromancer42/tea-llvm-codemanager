//
// Created by Yifan Chen on 2023/1/12.
//

#include "irmanager.h"
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/IRBuilder.h>
#include <iterator>

using namespace tea;
using namespace std;
using namespace llvm;

IRManager::IRManager(const string& name, std::unique_ptr<llvm::Module> mod) {
    this->name = name;
    this->mod = move(mod);
}   

string IRManager::get_value_type(llvm::Type *t){
    switch(t->getTypeID()){
        case llvm::Type::HalfTyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::BFloatTyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::FloatTyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::DoubleTyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::X86_FP80TyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::FP128TyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::PPC_FP128TyID:
        return "float";
        //printf("    pointer:id:%s, component type:float\n",i.first.c_str()); 
        break;
        case llvm::Type::VoidTyID:
        return "void";
        //printf("    pointer:id:%s, component type:void\n",i.first.c_str()); 
        break;
        case llvm::Type::LabelTyID:
        return "label";
        //printf("    pointer:id:%s, component type:label\n",i.first.c_str()); 
        break;
        case llvm::Type::FunctionTyID:
        return "function";
        break;
        case llvm::Type::MetadataTyID:
        return "metadata";
        //printf("    pointer:id:%s, component type:metadata\n",i.first.c_str()); 
        break;
        case llvm::Type::TokenTyID:
        return "token";
        //printf("    pointer:id:%s, component type:token\n",i.first.c_str()); 
        break;
        case llvm::Type::IntegerTyID:
        return "integer";
        //printf("    pointer:id:%s, component type:integer\n",i.first.c_str()); 
        break;
        case llvm::Type::PointerTyID:
        return "pointer";
        //printf("    pointer:id:%s, component type:pointer\n",i.first.c_str()); 
        break;
        case llvm::Type::StructTyID:
        return "struct";
        //printf("    pointer:id:%s, component type:struct\n",i.first.c_str()); 
        break;
        case llvm::Type::ArrayTyID:
        return "array";
        //printf("    pointer:id:%s, component type:array\n",i.first.c_str()); 
        break;
        case llvm::Type::FixedVectorTyID:
        return "vector";
        //printf("    pointer:id:%s, component type:vector\n",i.first.c_str()); 
        break;
        case llvm::Type::ScalableVectorTyID:
        return "vector";
        //printf("    pointer:id:%s, component type:vector\n",i.first.c_str()); 
        break;
        default:
        printf("unknown\n");
        return "unknown";
        break;
    }
    return "";
}

IRManager::IRManager(const string& filename) {
    ctx = make_unique<LLVMContext>();
    SMDiagnostic diag;
    mod = parseIRFile(filename, diag, *ctx);
    printf("3\n");
    /*
    name = string(mod->getName().data());
    name1 = string(mod->getSourceFileName().data());
    name2 = string(mod->getTargetTriple().data());
    name3 = string(mod->getDataLayoutStr().data());
    name4 = string(mod->getModuleInlineAsm().data());
    name5 = mod->getNumNamedValues();
    std::string name6 = mod->getFunctionList().front().getName().data();
    // name6 = mod->getMDKindID();
    printf("getSourceFileName():\n%s\n",name1.c_str());
    printf("getTargetTriple():\n%s\n",name2.c_str());
    printf("getDataLayoutStr():\n%s\n",name3.c_str());
    printf("getModuleInlineAsm():\n%s\n",name4.c_str());
    printf("getNumNamedValues():\n%d\n",name5);
    printf("getFunctionList():\n%s\n",name6.c_str());
    printf("4\n");
    */
    llvm::Module* module = mod.get();   
    for(llvm::Module::iterator MI = module->begin(); MI != module->end(); MI++) {
        llvm::Function &Func = *MI;
        string func_n = Func.getName().data();
        func_ref.insert(make_pair(func_n, &Func));
        //printf("%s\n",function_name.c_str());
        if(Func.isDeclaration()) {
            printf("in decl\n");
            llvm::GlobalValue *GV = dyn_cast<llvm::GlobalValue>(MI);
            std::string gv_n = GV->getName().str();
            printf("global var:%s",gv_n.c_str());
            global_ref.insert(make_pair(gv_n,GV));
            //check whether GV is an alises
            if(auto * GA = dyn_cast<llvm::GlobalAlias>(MI)){
                alias_ref.insert(make_pair(gv_n, GA));
            }
        }

        for(llvm::Function::iterator FI = Func.begin(); FI != Func.end(); FI++) {
            llvm::BasicBlock &BB = *FI;
            //llvm::BasicBlock *BBB = dyn_cast<llvm::BasicBlock>(&BB);
            string bb_n = func_n + "-" + BB.getName().data();
            int inst_cnt = 0;
            //cfg_map.insert(make_pair(a,BBB));
            for(llvm::BasicBlock::iterator j = BB.begin(); j != BB.end(); j++) {
                llvm::Instruction & Inst = *j;
                int op_num = Inst.getNumOperands();
                for(int i = 0; i<op_num; i++){
                    llvm::Value & opi = *Inst.getOperand(i);
                    printf("name:%s, ",opi.getName().str().c_str());
                    std::string opi_name = bb_n + opi.getNameOrAsOperand().data();
                    llvm::Type::TypeID opi_alloc_type = opi.getType()->getTypeID();
                    printf("%s, ",opi_name.c_str());
                    switch(opi_alloc_type){
                        case llvm::Type::HalfTyID:
                        printf("this is halftyid\n");
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::BFloatTyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::FloatTyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::DoubleTyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::X86_FP80TyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::FP128TyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::PPC_FP128TyID:
                        printf("this is float\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::VoidTyID:
                        printf("this is void\n"); 
                        void_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::LabelTyID:
                        printf("this is label\n"); 
                        label_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::MetadataTyID:
                        printf("this is metadata\n"); 
                        break;
                        case llvm::Type::TokenTyID:
                        printf("this is token\n"); 
                        break;
                        case llvm::Type::IntegerTyID:
                        printf("this is integer\n"); 
                        int_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::PointerTyID:
                        printf("this is pointer\n"); 
                        pointer_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::StructTyID:
                        printf("this is struct\n"); 
                        float_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::ArrayTyID:
                        printf("this is array\n"); 
                        array_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        break;
                        case llvm::Type::FixedVectorTyID:
                        printf("this is fixed vec\n"); 
                        break;
                        vector_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        case llvm::Type::ScalableVectorTyID:
                        printf("this is fixed vec\n"); 
                        break;
                        vector_ref.insert(make_pair(opi_name, Inst.getOperand(i)));
                        default:
                        printf("something is error\n");
                        break;
                    }
                }
                /*
                if(auto * Alloc = dyn_cast<llvm::AllocaInst>(&Inst)){
                    llvm::AllocaInst & AInst = *Alloc;
                    string alloc_name = AInst.getName().data();
                    llvm::Type::TypeID alloc_type = AInst.getAllocatedType()->getTypeID();
                    printf("alloc_name:%s.\n",alloc_name.c_str());
                    printf("shit:%d\n",alloc_type);
                    switch(alloc_type){
                        case llvm::Type::HalfTyID:
                        printf("this is halftyid\n");
                        break;
                        case llvm::Type::BFloatTyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::FloatTyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::DoubleTyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::X86_FP80TyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::FP128TyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::PPC_FP128TyID:
                        printf("this is float\n"); 
                        break;
                        case llvm::Type::VoidTyID:
                        printf("this is void\n"); 
                        break;
                        case llvm::Type::LabelTyID:
                        printf("this is label\n"); 
                        break;
                        case llvm::Type::MetadataTyID:
                        printf("this is metadata\n"); 
                        break;
                        case llvm::Type::TokenTyID:
                        printf("this is token\n"); 
                        break;
                        case llvm::Type::IntegerTyID:
                        printf("this is integer\n"); 
                        break;
                        case llvm::Type::PointerTyID:
                        printf("this is pointer\n"); 
                        break;
                        case llvm::Type::StructTyID:
                        printf("this is struct\n"); 
                        break;
                        case llvm::Type::ArrayTyID:
                        printf("this is array\n"); 
                        break;
                        case llvm::Type::FixedVectorTyID:
                        printf("this is fixed vec\n"); 
                        break;
                        default:
                        printf("something is error\n");
                        break;
                    }
                }
                this method is proved not robust
                */
                string inst_n = bb_n + "-" + to_string(inst_cnt);
                inst_map.insert(make_pair(inst_n,&Inst));
                inst_cnt++;
            }
            bb_inum.insert(make_pair(bb_n,inst_cnt));
            printf("valueid:%s\n",bb_n.c_str());
            cfg_map.insert(make_pair(bb_n,&BB));
            for (BasicBlock *Pred : predecessors(&BB)) {
                string pred_func_n = Pred->getParent()->getName().data();
                string pred_bb_n = pred_func_n + "-" + Pred->getName().data();
                cfg.push_back(make_pair(pred_bb_n,bb_n));
            }
        }   
    }
}


string IRManager::get_inst_id(llvm::Instruction * i, std::map<std::string, llvm::Instruction*> inst_m){
    for(auto I:inst_m){
        if(I.second->isSameOperationAs(i)){
            return I.first;
        }
    }
    return i->getNameOrAsOperand();
}


string IRManager::get_name() {
    return name;
}

void IRManager::get_function_names() {
    SymbolTableList<llvm::Function>::iterator function_list_begin = mod->getFunctionList().begin();
    SymbolTableList<llvm::Function>::iterator function_list_end = mod->getFunctionList().end();
    for(;function_list_begin != function_list_end; function_list_begin++){
        std::string name_fun = function_list_begin->getName().data();
        printf("%s\n",name_fun.c_str());
    }
}


void IRManager::get_cfg_contents() {
    for(std::map<string,llvm::BasicBlock*>::iterator i = cfg_map.begin();
        i != cfg_map.end(); i++) {
        printf("Basicblock:%s:\n",i->first.c_str());
        string Func_ID = i->second->getParent()->getName().data();
        string ID = Func_ID + "-" + i->second->getName().data();
        printf("basicblock_entry(");
        //llvm::Instruction & Inst1 = *i->second->begin();
        printf("%s,%s)\n",ID.c_str(),(ID+"-"+to_string(0)).c_str());
        //Inst1.dump();
        printf("basicblock_exit(");
        //llvm::Instruction & Inst2 = *i->second->rbegin();
        printf("%s,%s)\n",ID.c_str(),(ID+"-"+to_string(bb_inum[ID]-1)).c_str());
        //Inst2.dump();
        for(std::vector<std::pair<string,string> >::iterator v = cfg.begin() ;
            v != cfg.end(); v++){
            printf("%s,%s\n",v->first.c_str(),v->second.c_str());
            if(v->second == ID){
                printf("\npred_basicblock:(%s,%s)\n",v->second.c_str(),v->first.c_str());
            }
        }
        printf("instruction messages: \n");
        int inst_cnt = 0;
        for(llvm::BasicBlock::iterator j = i->second->begin(); j != i->second->end(); j++) {
            //llvm::Instruction & Inst = *j;
            printf("instruction_basicblock(%s,%s)\n",(ID+to_string(inst_cnt)).c_str(),ID.c_str());
            //Inst.dump();
            inst_cnt++;
            if(inst_cnt != bb_inum[ID]-1)
                printf("instruction_next(%s,%s)\n",(ID+to_string(inst_cnt)).c_str(),(ID+to_string(inst_cnt+1)).c_str());
        }
    }
}


void IRManager::get_types(){
    printf("void_refs: \n********************************\n");
    for(auto i: void_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("func_refs: \n********************************\n");
    for(auto i: func_ref){
        printf("    int:id:%s, ret_type:%s\n", i.first.c_str(), get_value_type((i.second->getReturnType())).c_str()); 
        printf("    int:id:%s, arg_num:%ld\n", i.first.c_str(), i.second->arg_size()); 
        printf("    int:id:%s, vararg:%s\n", i.first.c_str(), i.second->isVarArg()? "yes":"no"); 
        for(long unsigned int var = 0; var < i.second->arg_size() ; var++){
            printf("    int:id:%s, varnum:%ld, var type:%s\n", i.first.c_str(), var, get_value_type(i.second->getArg(var)->getType()).c_str()); 
            //get arg only supports unsigned int but arg_size() returns unsigned long
        }

    }
    printf("int_refs: \n********************************\n");
    for(auto i: int_ref){
        printf("    int:id:%s, bit_width:%d\n", i.first.c_str(), i.second->getType()->getIntegerBitWidth()); 
    }
    printf("float_refs: \n********************************\n");
    for(auto i: float_ref){
        printf("    float:id:%s, float point type:",i.first.c_str());
        switch(i.second->getType()->getTypeID()){
            case llvm::Type::HalfTyID:
            printf("half\n");
            break;
            case llvm::Type::BFloatTyID:
            printf("half\n"); 
            break;
            case llvm::Type::FloatTyID:
            printf("float\n"); 
            break;
            case llvm::Type::DoubleTyID:
            printf("double\n"); 
            break;
            case llvm::Type::X86_FP80TyID:
            printf("x86_fp80\n"); 
            break;
            case llvm::Type::FP128TyID:
            printf("fp128\n"); 
            break;
            case llvm::Type::PPC_FP128TyID:
            printf("ppc_fp128\n"); 
            break;
            default:
            break;
        }
    }
    printf("void_refs: \n********************************\n");
    for(auto i: pointer_ref){
        printf("    pointer:id:%s, address space: %d\n",i.first.c_str(), i.second->getType()->getPointerAddressSpace());
        if(i.second->getType()->isOpaquePointerTy()){
            printf("this pointer is opaque.\n");
            continue;
        }
        printf("    pointer:id:%s, component type:%s\n",i.first.c_str(),get_value_type(i.second->getType()).c_str());
        
    }
    printf("vector_refs: \n********************************\n");
    for(auto i: vector_ref){
        printf("    vector:id:%s\n, vector size:%d",i.first.c_str(), i.second->getType()->getNumContainedTypes());
        printf("    vector:id:%s, component type:%s\n",i.first.c_str(), get_value_type(i.second->getType()).c_str()); 
        
    }
    printf("label_refs: \n********************************\n");
    for(auto i: label_ref){
        printf("    label:id:%s\n",i.first.c_str());
    }
    printf("array_refs: \n********************************\n");
    for(auto i: array_ref){
        printf("    array:id:%s, size:%ld, component_type:%s\n",i.first.c_str(), i.second->getType()->getArrayNumElements(), get_value_type(i.second->getType()->getArrayElementType()).c_str());
    }
    printf("structure_refs: \n********************************\n");
    for(auto i: structure_ref){
        int field_num = i.second->getType()->getStructNumElements();
        printf("    structure:id:%s, name:%s, opaque:%s, field_nums:%d\n",
            i.first.c_str(), 
            i.second->hasName() ? i.second->getName().data() : "unnamed", 
            i.second->getType()->isOpaquePointerTy() ? "yes" : "no", 
            field_num);
        for(int j = 0; j < field_num; ++j){
            string type_name;
            switch(i.second->getType()->getStructElementType(j)->getTypeID()){
                case llvm::Type::HalfTyID:
                type_name = "halftyid";
                break;
                case llvm::Type::BFloatTyID:
                case llvm::Type::FloatTyID:
                case llvm::Type::DoubleTyID:
                case llvm::Type::X86_FP80TyID:
                case llvm::Type::FP128TyID:
                case llvm::Type::PPC_FP128TyID:
                type_name = "float";
                break;
                case llvm::Type::VoidTyID:
                type_name = "void";
                break;
                case llvm::Type::LabelTyID:
                type_name = "label";
                break;
                case llvm::Type::MetadataTyID:
                type_name = "metadata";
                break;
                case llvm::Type::TokenTyID:
                type_name = "token";
                break;
                case llvm::Type::FunctionTyID:
                type_name = "function";
                break;
                case llvm::Type::IntegerTyID:
                type_name = "integer";
                break;
                case llvm::Type::PointerTyID:
                type_name = "pointer";
                break;
                case llvm::Type::StructTyID:
                type_name = "struct";
                break;
                case llvm::Type::ArrayTyID:
                type_name = "array";
                break;
                case llvm::Type::FixedVectorTyID:
                case llvm::Type::ScalableVectorTyID:
                type_name = "fixed_vec";
                break;
                default:
                type_name = "unknown";
                break;
            }
            printf("        field_%d:%s\n", j, type_name.c_str());
        }
    }
}

void IRManager::get_global_var(){
    printf("global_Vars: \n********************************\n");
    for(auto I:global_ref){
        printf("    id:%s, ty:%s\n", I.first.c_str(), get_value_type(I.second->getType()).c_str());
        printf("    id:%s, name:%s\n", I.first.c_str(), I.first.c_str());
        //printf("    id:%s, alignment:%d\n", I.first.c_str(), I.second->MaxAlignmentExponent);
        printf("    id:%s, link type:%d\n", I.first.c_str(), I.second->getLinkage());
        printf("    id:%s, visibility:%d\n", I.first.c_str(), I.second->getVisibility());
        printf("    id:%s, initializer:%s\n", I.first.c_str(), I.second->getValueName()->getValue()->getName().str().c_str());
        printf("    id:%s, section:%s\n", I.first.c_str(), I.second->getSection().str().c_str());
        printf("    id:%s, threadlocal mode:%d\n", I.first.c_str(), I.second->getThreadLocalMode());
        printf("    id:%s, constant:%d\n", I.first.c_str(), I.second->isConstantUsed());
    }
}

void IRManager::get_aliases(){
    printf("global_Alises: \n*******************************\n");
    for(auto I:alias_ref){
        printf("\tid:%s, ty:%s\n", I.first.c_str(), get_value_type(I.second->getType()).c_str());
        printf("\tid:%s, name:%s\n", I.first.c_str(), I.second->getName().data());
        //the two below are enums, maybe these can be more precisely shown by listing their strs
        printf("\tid:%s, ty:%d\n", I.first.c_str(), I.second->getLinkage());
        printf("\tid:%s, visibility:%d\n", I.first.c_str(), I.second->getVisibility());
        printf("\tid:%s, aliasee:%s\n", I.first.c_str(), I.second->getAliasee()->getName().data());
    }
}



void IRManager::get_functions() {
    printf("functions: \n********************************\n");
    for(auto I:func_ref){
        //what is functiontype really mean? if we cast the get function type method, it'll return func type. I don't
        //know if this is what we want.
        printf("\tid:%s, ty:%s\n", I.first.c_str(), get_value_type(dyn_cast<Type>(I.second->getFunctionType())).c_str());
        printf("\tid:%s, name:%s\n", I.first.c_str(), I.second->getName().data());
        printf("\tid:%s, linkage type:%d\n", I.first.c_str(), I.second->getLinkage());
        printf("\tid:%s, visibility:%d\n", I.first.c_str(), I.second->getVisibility());
        //calling convension is unsigned, what does it mean?
        printf("\tid:%s, calling convension:%d\n", I.first.c_str(), I.second->getCallingConv());
        //ref to none local global
        switch(I.second->getUnnamedAddr()){
            case llvm::GlobalValue::UnnamedAddr::Global:
            printf("\tid:%s, unnamed addr:global\n", I.first.c_str());
            break;
            case llvm::GlobalValue::UnnamedAddr::Local:
            printf("\tid:%s, unnamed addr:local\n", I.first.c_str());
            break;
            case llvm::GlobalValue::UnnamedAddr::None:
            printf("\tid:%s, unnamed addr:none\n", I.first.c_str());
            break;
            default:
            printf("\tsomething is error.\n");
        }
        printf("\tid:%s, alignment:%ld\n", I.first.c_str(), I.second->getAlignment());
        printf("\tid:%s, gc:%s\n", I.first.c_str(), I.second->hasGC()?I.second->getGC().c_str():"no gc");
        //what exactly personally function is?
        printf("\tid:%s, personally function:%s\n", I.first.c_str(), I.second->hasPersonalityFn()?I.second->getPersonalityFn()->getName().data():"no personality fn");
        //attribute has some questions
        //printf("\tid:%s, attribute:%s\n", I.first.c_str(), I.second->getFnAttribute());
        //printf("\tid:%s, return attribute:%s\n", I.first.c_str(), I.second->attri);
        printf("\tid:%s, custom section:%s\n", I.first.c_str(), I.second->getSection().str().c_str());
        for(unsigned int i=0;i < I.second->arg_size(); i++){
            std::string arg_n = I.first + I.second->getArg(i)->getName().data();
            llvm::Argument * arg = I.second->getArg(i);
            arg_ref.insert(make_pair(arg_n, arg));
            printf("\tid:%s, num_arg:%d, arg_id:%s\n", I.first.c_str(), i, arg_n.c_str());
            //also the attribute
            printf("\tid:%s, num_arg:%d, arg_id:%s\n", I.first.c_str(), i, arg_n.c_str());
        }
        printf("\tid:%s, param nums:%ld\n", I.first.c_str(), I.second->arg_size());
    }
}


void IRManager::parse_insts(){
    for(auto Inst:inst_map){
        //terminate inst
        if(auto * Ret = dyn_cast<llvm::ReturnInst>(Inst.second)){
            ret_inst_ref.insert(make_pair(Inst.first, Ret));
        }
        else if(auto * Br = dyn_cast<llvm::BranchInst>(Inst.second)){
            br_inst_ref.insert(make_pair(Inst.first, Br));
        }
        else if(auto * Switch = dyn_cast<llvm::SwitchInst>(Inst.second)){
            switch_inst_ref.insert(make_pair(Inst.first, Switch));
        }
        else if(auto * InBr = dyn_cast<llvm::IndirectBrInst>(Inst.second)){
            inbr_inst_ref.insert(make_pair(Inst.first, InBr));
        }
        else if(auto * UnRe = dyn_cast<llvm::UnreachableInst>(Inst.second)){
            unre_inst_ref.insert(make_pair(Inst.first, UnRe));
        }
        //binary inst
        else if(Inst.second->isBinaryOp()){
            binary_inst_ref.insert(make_pair(Inst.first, Inst.second));
        }
        //memory inst
        else if(auto * Alloc = dyn_cast<llvm::AllocaInst>(Inst.second)){
            alloc_inst_ref.insert(make_pair(Inst.first, Alloc));
        }
        else if(auto * Load = dyn_cast<llvm::LoadInst>(Inst.second)){
            load_inst_ref.insert(make_pair(Inst.first, Load));
        }
        else if(auto * Store = dyn_cast<llvm::StoreInst>(Inst.second)){
            store_inst_ref.insert(make_pair(Inst.first, Store));
        }
        else if(auto * Fence = dyn_cast<llvm::FenceInst>(Inst.second)){
            fence_inst_ref.insert(make_pair(Inst.first, Fence));
        }
        else if(auto * Cmpxchg = dyn_cast<llvm::AtomicCmpXchgInst>(Inst.second)){
            cmpx_inst_ref.insert(make_pair(Inst.first, Cmpxchg));
        }
        else if(auto * Atomic = dyn_cast<llvm::AtomicRMWInst>(Inst.second)){
            atom_inst_ref.insert(make_pair(Inst.first, Atomic));
        }
        else if(auto * GetElePtr = dyn_cast<llvm::GetElementPtrInst>(Inst.second)){
            get_ele_ptr_inst_ref.insert(make_pair(Inst.first, GetElePtr));
        }
        //vector operation inst
        else if(auto * Shuff = dyn_cast<llvm::ShuffleVectorInst>(Inst.second)){
            shu_vec_inst_ref.insert(make_pair(Inst.first, Shuff));
        }
        else if(auto * Insert = dyn_cast<llvm::InsertElementInst>(Inst.second)){
            in_ele_inst_ref.insert(make_pair(Inst.first, Insert));
        }
        else if(auto * Extract = dyn_cast<llvm::ExtractElementInst>(Inst.second)){
            ex_ele_inst_ref.insert(make_pair(Inst.first, Extract));
        }
        //aggregate operation inst
        else if(auto * ExtVal = dyn_cast<llvm::ExtractValueInst>(Inst.second)){
            ex_val_inst_ref.insert(make_pair(Inst.first, ExtVal));
        }
        else if(auto * InsVal = dyn_cast<llvm::InsertValueInst>(Inst.second)){
            in_val_inst_ref.insert(make_pair(Inst.first, InsVal));
        }
        //conversion inst
        else if(auto * Cast = dyn_cast<llvm::CastInst>(Inst.second)){
            conversion_inst_ref.insert(make_pair(Inst.first, Cast));
        }
        //other inst
        else if(auto * Icmp = dyn_cast<llvm::ICmpInst>(Inst.second)){
            icmp_inst_ref.insert(make_pair(Inst.first, Icmp));
        }
        else if(auto * Fcmp = dyn_cast<llvm::FCmpInst>(Inst.second)){
            fcmp_inst_ref.insert(make_pair(Inst.first, Fcmp));
        }
        else if(auto * Select = dyn_cast<llvm::SelectInst>(Inst.second)){
            sel_inst_ref.insert(make_pair(Inst.first, Select));
        }
        else if(auto * Call = dyn_cast<llvm::CallInst>(Inst.second)){
            call_inst_ref.insert(make_pair(Inst.first, Call));
        }
        else if(auto * Phi = dyn_cast<llvm::PHINode>(Inst.second)){
            phi_inst_ref.insert(make_pair(Inst.first, Phi));
        }
        else if(auto * VaArg = dyn_cast<llvm::VAArgInst>(Inst.second)){
            va_arg_inst_ref.insert(make_pair(Inst.first, VaArg));
        }
    }
}

void IRManager::get_terminate_insts(){
    printf("terminater_insts: \n********************************\n");
    printf("\treturn_insts: \n\t********************************\n");
    for(auto I : ret_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        if(auto ret = I.second->getReturnValue()){
            printf("\t\tid: %s, ret: %s\n", I.first.c_str(), get_inst_id(dyn_cast<llvm::Instruction>(ret), inst_map).c_str());
        }
        else{
            printf("\t\tid: %s, ret: null\n", I.first.c_str());
        }
    }
    printf("\tbranch_insts: \n\t********************************\n");
    for(auto I : br_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        if(I.second->isConditional()){
            llvm::Instruction * Inst = dyn_cast<llvm::Instruction>(I.second->getCondition());
            llvm::Value * true_flg = I.second->getOperand(1);
            llvm::Value * false_flg = I.second->getOperand(2);
            printf("\t\tid: %s, cond_inst: %s\n", I.first.c_str(), Inst->getName().str().c_str());
            printf("\t\tid: %s, true flag: %s\n", I.first.c_str(), get_inst_id(dyn_cast<llvm::Instruction>(true_flg), inst_map).c_str());
            printf("\t\tid: %s, false flag: %s\n", I.first.c_str(), get_inst_id(dyn_cast<llvm::Instruction>(false_flg), inst_map).c_str());
        }
        else{
            llvm::Value * dest = dyn_cast<llvm::Value>(I.second->getOperand(0));
            printf("\t\tid: %s, false flag: %s\n", I.first.c_str(), get_inst_id(dyn_cast<llvm::Instruction>(dest), inst_map).c_str());
        }
    }
    printf("\tswitch_insts: \n\t********************************\n");
    for(auto I : switch_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        llvm::Instruction * Inst = dyn_cast<llvm::Instruction>(I.second->getCondition());
        printf("\t\tid: %s, condition: %s", I.first.c_str(), Inst->getName().str().c_str());
        //default jmp label
        llvm:: Value * label = I.second->getOperand(1);
        printf("\t\tid: %s, default label:%s", I.first.c_str(), label->getName().str().c_str());
        printf("\t\tid: %s, num label:%d", I.first.c_str(), I.second->getNumCases());
        int num_cases = I.second->getNumCases();
        for(int i = 0 ; i < num_cases ; i++){
            llvm::Value * caseval_i = I.second->getOperand(2*i+1);
            llvm::Value * caselabel_i = I.second->getOperand(2*(i+1));
            printf("\t\t\tid:%s, case: %d, label: %s\n", I.first.c_str(), i, get_inst_id(dyn_cast<llvm::Instruction>(caselabel_i), inst_map).c_str());
            printf("\t\t\tid:%s, case: %d, value: %s\n", I.first.c_str(), i, caseval_i->getName().str().c_str());
        }
    }
    printf("\ttindirect_branch_insts: \n\t********************************\n");
    for(auto I : inbr_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, addr: %s",I.first.c_str(), I.second->getAddress()->getName().str().c_str());
        printf("\t\tid: %s, num labels: %d", I.first.c_str(), I.second->getNumDestinations());
        int label_num = I.second->getNumDestinations();
        for(int i = 0 ; i < label_num ; i++){
            llvm::Value * addr_i = I.second->getOperand(i);
            printf("\t\t\tid: %s, dest: %d, label: %s", I.first.c_str(), i, get_inst_id(dyn_cast<llvm::Instruction>(addr_i), inst_map).c_str());
        }
    }
    printf("\tunreachable_insts: \n\t********************************\n");
    for(auto I : unre_inst_ref){
        printf("\t\tid: %s\n",I.first.c_str());
    }
}

void IRManager::get_binary_insts(){
    printf("binary_insts: \n********************************\n");
    for(auto I : binary_inst_ref){
        std::string opcode = I.second->getOpcodeName();
        printf("\t%s_inst_id: %s\n", opcode.c_str(), I.first.c_str());
        printf("\t%s_inst_id: %s, first_op: %s\n", opcode.c_str(), I.first.c_str(), I.second->getOperand(0)->getNameOrAsOperand().c_str());
        printf("\t%s_inst_id: %s, second_op: %s\n", opcode.c_str(), I.first.c_str(), I.second->getOperand(1)->getNameOrAsOperand().c_str());
        /* temply deletedxxxxxxxxxxxxxxxxxx
        switch(I.second->getOpcodeName()){
            case llvm::Instruction::Add:
            opcode = "add";
            break;
            case llvm::Instruction::FAdd:
            opcode = "add";
            break;
            case llvm::Instruction::Sub:
            opcode = "add";
            break;
            case llvm::Instruction::FSub:
            opcode = "add";
            break;
            case llvm::Instruction::Mul:
            opcode = "add";
            break;
            case llvm::Instruction::FMul:
            opcode = "add";
            break;
            case llvm::Instruction::UDiv:
            opcode = "add";
            break;
            case llvm::Instruction::SDiv:
            opcode = "add";
            break;
            case llvm::Instruction::FDiv:
            opcode = "add";
            break;
            case llvm::Instruction::URem:
            opcode = "add";
            break;
            case llvm::Instruction::SRem:
            opcode = "add";
            break;
            case llvm::Instruction::FRem:
            break;
            case llvm::Instruction::Shl:
            break;
            case llvm::Instruction::LShr:
            break;
            case llvm::Instruction::AShr:
            break;
            case llvm::Instruction::And:
            break;
            case llvm::Instruction::Or:
            break;
            case llvm::Instruction::Xor:
            break;
            default:
            printf("something is wrong\n");
            break;
        }
        */
    }
}

void IRManager::get_vector_insts(){
    printf("vector_insts: \n********************************\n");
    printf("\textract_element_insts: \n********************************\n");
    for(auto I : ex_ele_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //whether the vector name should use get name or get name or as operand is doubtful
        printf("\t\tid: %s, vector: %s\n", I.first.c_str(), I.second->getOperand(0)->getName().str().c_str());
        printf("\t\tid: %s, index: %s\n", I.first.c_str(), I.second->getOperand(1)->getNameOrAsOperand().c_str());
    }
    printf("\tinsert_element_insts: \n********************************\n");
    for(auto I : in_ele_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //whether the vector name should use get name or get name or as operand is doubtful
        printf("\t\tid: %s, vector: %s\n", I.first.c_str(), I.second->getOperand(0)->getName().str().c_str());
        printf("\t\tid: %s, val: %s\n", I.first.c_str(), I.second->getOperand(1)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, index: %s\n", I.first.c_str(), I.second->getOperand(2)->getNameOrAsOperand().c_str());
    }

    printf("\tshuffle_element_insts: \n********************************\n");
    for(auto I : shu_vec_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //whether the vector name should use get name or get name or as operand is doubtful
        printf("\t\tid: %s, vector1: %s\n", I.first.c_str(), I.second->getOperand(0)->getName().str().c_str());
        printf("\t\tid: %s, vector2: %s\n", I.first.c_str(), I.second->getOperand(1)->getName().str().c_str());
        printf("\t\tid: %s, index: %s\n", I.first.c_str(), I.second->getOperand(2)->getNameOrAsOperand().c_str());
    }

}

void IRManager::get_aggregate_insts(){
    printf("vector_insts: \n********************************\n");
    printf("\textract_element_insts: \n********************************\n");
    for(auto I : ex_val_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //whether the vector name should use get name or get name or as operand is doubtful
        printf("\t\tid: %s, agg: %s\n", I.first.c_str(), I.second->getOperand(0)->getName().str().c_str());
        printf("\t\tid: %s, num indices: %d\n", I.first.c_str(), I.second->getNumIndices());
        for(unsigned int i = 0 ; i < I.second->getNumIndices() ; i++){
            printf("\t\t\tid: %s, indice index: %d, val: %d\n", I.first.c_str(), i, I.second->getIndices()[i]);
        }
    }
    printf("\tinsert_element_insts: \n********************************\n");
    for(auto I : in_val_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //whether the vector name should use get name or get name or as operand is doubtful
        printf("\t\tid: %s, agg: %s\n", I.first.c_str(), I.second->getOperand(0)->getName().str().c_str());
        printf("\t\tid: %s, num indices: %d\n", I.first.c_str(), I.second->getNumIndices());
        printf("\t\tid: %s, val: %s\n", I.first.c_str(), I.second->getOperand(1)->getNameOrAsOperand().c_str());
        for(unsigned int i = 0 ; i < I.second->getNumIndices() ; i++){
            printf("\t\t\tid: %s, indice index: %d, val: %d\n", I.first.c_str(), i, I.second->getIndices()[i]);
        }
        
    }
}

void IRManager::get_memory_insts(){
    printf("memory_insts: \n********************************\n");
    printf("\talloca_insts: \n********************************\n");
    for(auto I : alloc_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, align: %ld\n", I.first.c_str(), I.second->getAlign().value());
        printf("\t\tid: %s, size: %s\n", I.first.c_str(), I.second->getArraySize()->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, type: %s\n", I.first.c_str(), get_value_type(I.second->getAllocatedType()).c_str());
    }
    printf("\tload_insts: \n********************************\n");
    for(auto I : load_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, align: %ld\n", I.first.c_str(), I.second->getAlign().value());
        //the output is a enum class, turn into str if needed
        printf("\t\tid: %s, ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getOrdering()).c_str());
        printf("\t\tid: %s, volatile: %s\n", I.first.c_str(), I.second->isVolatile()?"true":"false");
        printf("\t\tid: %s, address: %u\n", I.first.c_str(), I.second->getPointerAddressSpace());
    }
    printf("\tstore_insts: \n********************************\n");
    for(auto I : store_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, align: %ld\n", I.first.c_str(), I.second->getAlign().value());
        //the output is a enum class, turn into str if needed
        printf("\t\tid: %s, ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getOrdering()).c_str());
        printf("\t\tid: %s, volatile: %s\n", I.first.c_str(), I.second->isVolatile()?"true":"false");
        printf("\t\tid: %s, value: %s\n", I.first.c_str(), I.second->getValueOperand()->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, address: %u\n", I.first.c_str(), I.second->getPointerAddressSpace());
    }
    printf("\tfence_insts: \n********************************\n");
    for(auto I : fence_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //the output is a enum class, turn into str if needed
        printf("\t\tid: %s, ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getOrdering()).c_str());
    }
    printf("\tcmpxarg_insts: \n********************************\n");
    for(auto I : cmpx_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, align: %ld\n", I.first.c_str(), I.second->getAlign().value());
        //the output is a enum class, turn into str if needed
        printf("\t\tid: %s, succ ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getSuccessOrdering()).c_str());
        printf("\t\tid: %s, fail ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getFailureOrdering()).c_str());
        printf("\t\tid: %s, volatile: %s\n", I.first.c_str(), I.second->isVolatile()?"true":"false");
        printf("\t\tid: %s, cmp value: %s\n", I.first.c_str(), I.second->getCompareOperand()->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, address: %u\n", I.first.c_str(), I.second->getPointerAddressSpace());
        printf("\t\tid: %s, new value: %s\n", I.first.c_str(), I.second->getNewValOperand()->getNameOrAsOperand().c_str());
    }
    printf("\tatomic_insts: \n********************************\n");
    for(auto I : atom_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        //the output is a enum class, turn into str if needed
        printf("\t\tid: %s, ordering: %s\n", I.first.c_str(), get_ordering_kind(I.second->getOrdering()).c_str());
        // not sure whether get opcode name will return the correct name
        printf("\t\tid: %s, operator: %s\n", I.first.c_str(), I.second->getOpcodeName());
        printf("\t\tid: %s, volatile: %s\n", I.first.c_str(), I.second->isVolatile()?"true":"false");
        printf("\t\tid: %s, address: %u\n", I.first.c_str(), I.second->getPointerAddressSpace());
        printf("\t\tid: %s, new value: %s\n", I.first.c_str(), I.second->getValOperand()->getNameOrAsOperand().c_str());
    }
    printf("\tatomic_insts: \n********************************\n");
    for(auto I : get_ele_ptr_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, inbound: %s\n", I.first.c_str(), I.second->isInBounds()?"ture":"false");
        printf("\t\tid: %s, address: %u\n", I.first.c_str(), I.second->getPointerAddressSpace());
        printf("\t\tid: %s, indice num: %u\n", I.first.c_str(), I.second->getNumIndices());
        /* how to get the indexed array?
        // TODO: use iterator
        for(int i = 0 ; i < I.second->getNumIndices(); i ++){
            printf("\t\t\tid: %s. indice index: %d, val: %s\n", I.first.c_str(), i, I.second->get)
        }
        */
    }
}



void IRManager::get_conversion_insts(){
    printf("conversion_insts: \n********************************\n");
    for(auto I : conversion_inst_ref){
        printf("\tid: %s\n", I.first.c_str());
        string op_type = I.second->getOpcodeName();
        printf("\t%s_id: %s, value: %s\n", op_type.c_str(), I.first.c_str(), I.second->getOperand(0)->getNameOrAsOperand().c_str());
        printf("\t%s_id: %s, src type: %s\n", op_type.c_str(), I.first.c_str(), get_value_type(I.second->getSrcTy()).c_str());
        printf("\t%s_id: %s, value: %s\n", op_type.c_str(), I.first.c_str(), get_value_type(I.second->getDestTy()).c_str());
    }
}


void IRManager::get_other_insts(){
    printf("other_insts: \n********************************\n");
    printf("\ticmp_insts: \n\t********************************\n");
    for(auto I : icmp_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, cond: %s\n", I.first.c_str(), I.second->getOperand(0)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, first op: %s\n", I.first.c_str(), I.second->getOperand(2)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, second op: %s\n", I.first.c_str(), I.second->getOperand(3)->getNameOrAsOperand().c_str());
    }
    printf("\tfcmp_insts: \n\t********************************\n");
    for(auto I : fcmp_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, cond: %s\n", I.first.c_str(), I.second->getOperand(0)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, first op: %s\n", I.first.c_str(), I.second->getOperand(2)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, second op: %s\n", I.first.c_str(), I.second->getOperand(3)->getNameOrAsOperand().c_str());
    }
    printf("\tphi_insts: \n\t********************************\n");
    for(auto I : phi_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, type: %s\n", I.first.c_str(), get_value_type(I.second->getType()).c_str());
        printf("\t\tid: %s, pairs num: %u\n", I.first.c_str(), I.second->getNumOperands()/2);
        for(unsigned int i = 0 ; i < I.second->getNumOperands()/2 ; i++){
            // not sure if correct
            printf("\t\t\tid: %s, pair num: %d, value: %s\n", I.first.c_str(), i, I.second->getOperand(2*i+1)->getNameOrAsOperand().c_str());
            printf("\t\t\tid: %s, pair num: %d, label: %s\n", I.first.c_str(), i, I.second->getOperand(2*i+2)->getNameOrAsOperand().c_str());
        }
        printf("\t\tid: %s, second op: %s\n", I.first.c_str(), I.second->getOperand(3)->getNameOrAsOperand().c_str());
    }
    printf("\tselect_insts: \n\t********************************\n");
    for(auto I : sel_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, cond: %s\n", I.first.c_str(), I.second->getOperand(0)->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, true value: %s\n", I.first.c_str(), I.second->getTrueValue()->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, false value: %s\n", I.first.c_str(), I.second->getFalseValue()->getNameOrAsOperand().c_str());
    }
    printf("\tva_arg_insts: \n\t********************************\n");
    for(auto I : va_arg_inst_ref){
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, type: %s\n", I.first.c_str(), get_value_type(I.second->getType()).c_str());
        printf("\t\tid: %s, arg list: %s\n", I.first.c_str(), I.second->getPointerOperand()->getNameOrAsOperand().c_str());
    }
    printf("\tcall_insts: \n\t********************************\n");
    for(auto I : call_inst_ref){
        //string call_func_signature = "";
        printf("\t\tid: %s\n", I.first.c_str());
        printf("\t\tid: %s, func name: %s\n", I.first.c_str(), I.second->getCalledFunction()->getNameOrAsOperand().c_str());
        printf("\t\tid: %s, tail call avalible: %s\n", I.first.c_str(), I.second->isTailCall()?"yes":"no");
        printf("\t\tid: %s, ret type: %s\n", I.first.c_str(), get_value_type(I.second->getCalledFunction()->getReturnType()).c_str());
        for(auto J : I.second->getCalledFunction()->getAttributes().getAttributes(llvm::AttributeList::FunctionIndex)){
            printf("\t\t\tid:%s, fn attributes: %s\n", I.first.c_str(), J.getAsString().c_str());
        }
        for(auto J : I.second->getCalledFunction()->getAttributes().getAttributes(llvm::AttributeList::ReturnIndex)){
            printf("\t\t\tid:%s, ret attributes: %s\n", I.first.c_str(), J.getAsString().c_str());
            //call_func_signature += get_value_type(I.second->getCalledFunction()->getReturnType());
        }
        unsigned int param_num = I.second->arg_size();
        for(unsigned j = 0 ; j < param_num ; j++){
            printf("\t\t\tid:%s, param num: %u, param: %s\n", I.first.c_str(), j, I.second->getArgOperand(j)->getNameOrAsOperand().c_str());
            for(auto J : I.second->getCalledFunction()->getAttributes().getAttributes(j+1)){
                printf("\t\t\t\tid:%s, param num: %u, param attributes: %s\n", I.first.c_str(), j, J.getAsString().c_str());
            }
            /*
            if(j == 0){
                call_func_signature += "(";
            }
            else{
                call_func_signature += " ";
            }
            call_func_signature += get_value_type(I.second->getArgOperand(j)->getType());
            if(j == param_num - 1){
                call_func_signature += ")";
            }
            */
            //string streaming maybe more efficient
            
        }
        std::string func_type = formatv("{0}", * (I.second->getFunctionType()));
        printf("\t\tid: %s, calling conv: %u\n", I.first.c_str(), I.second->getCallingConv());
        printf("\t\tid: %s, calling signature: %s\n", I.first.c_str(), func_type.c_str());
        printf("\t\tid: %s, calling method: %s\n", I.first.c_str(), I.second->isIndirectCall()?"indirect":"direct");

    }
}


string IRManager::get_conv_kind(llvm::CallingConv::ID id){
    return "";
}


string IRManager::get_ordering_kind(llvm::AtomicOrdering ao){
    std::string ordering_kind = "";
    switch(ao){
        case llvm::AtomicOrdering::Acquire:
        ordering_kind = "Acquire";
        break;
        case llvm::AtomicOrdering::AcquireRelease:
        ordering_kind = "AcquireRelease";
        break;
        /*
        //last kind has the same value with sequentiallyconsistent
        case llvm::AtomicOrdering::LAST:
        ordering_kind = "LAST";
        break;
        */
        case llvm::AtomicOrdering::Monotonic:
        ordering_kind = "Monotonic";
        break;
        case llvm::AtomicOrdering::NotAtomic:
        ordering_kind = "NotAtomic";
        break;
        case llvm::AtomicOrdering::Release:
        ordering_kind = "Release";
        break;
        case llvm::AtomicOrdering::SequentiallyConsistent:
        ordering_kind = "SequentiallyConsistent";
        break;
        case llvm::AtomicOrdering::Unordered:
        ordering_kind = "Unordered";
        break;
        default:
        printf("something is error\n");
    }
    return ordering_kind;
}



