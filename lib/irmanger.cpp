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

        }
        else if(auto * Load = dyn_cast<llvm::LoadInst>(Inst.second)){

        }
        //vector operation inst
        else if(auto * vec = dyn_cast<llvm::ShuffleVectorInst>(Inst.second)){

        }
        else if(auto * aggregate = dyn_cast<llvm::Agg>(Inst))
    }
}


