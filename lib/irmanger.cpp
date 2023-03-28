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
        //printf("%s\n",function_name.c_str());
        if(Func.isDeclaration()) {
            continue;
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
                    std::string opi_name = bb_n + opi.getName().data();
                    llvm::Type::TypeID opi_alloc_type = opi.getType()->getTypeID();
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
    //TODO: functype
    printf("void_refs: \n********************************\n");
    for(auto i: int_ref){
        printf("    int:id:%s, bit_width:%d\n",i.first.c_str(),i.second->); 
    }
    printf("void_refs: \n********************************\n");
    for(auto i: float_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("void_refs: \n********************************\n");
    for(auto i: pointer_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("void_refs: \n********************************\n");
    for(auto i: vector_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("void_refs: \n********************************\n");
    for(auto i: label_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("void_refs: \n********************************\n");
    for(auto i: array_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
    printf("void_refs: \n********************************\n");
    for(auto i: structure_ref){
        printf("    void:id:%s\n",i.first.c_str());
    }
}