#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include "llvm/Transforms/Instrumentation.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

Function *SanCovTraceCmpFunction[4];
Function *SanCovTraceConstCmpFunction[4];
Function *SanCovTraceSwitchFunction;
Function *SanCovTraceStrcmpFunction;
Function *SanCovTracePC;
InlineAsm *EmptyAsm;

SanitizerCoverageOptions Options;
const DataLayout *DL;
LLVMContext *C;
Module *CurModule;

char *SanCovTraceCmp1 = "__sanitizer_cov_trace_cmp1";
char *SanCovTraceCmp2 = "__sanitizer_cov_trace_cmp2";
char *SanCovTraceCmp4 = "__sanitizer_cov_trace_cmp4";
char *SanCovTraceCmp8 = "__sanitizer_cov_trace_cmp8";
char *SanCovTraceConstCmp1 = "__sanitizer_cov_trace_const_cmp1";
char *SanCovTraceConstCmp2 = "__sanitizer_cov_trace_const_cmp2";
char *SanCovTraceConstCmp4 = "__sanitizer_cov_trace_const_cmp4";
char *SanCovTraceConstCmp8 = "__sanitizer_cov_trace_const_cmp8";
char *SanCovTraceSwitchName = "__sanitizer_cov_trace_switch";
char *SanCovTraceStrcmpName = "__sanitizer_cov_trace_strcmp";
char *SanCovTracePCName = "__sanitizer_cov_trace_pc";

// Data Type
Type *VoidTy;
Type *Int64Ty, *Int64PtrTy;
Type *Int32Ty;
Type *Int16Ty;
Type *Int8Ty;

namespace
{
    struct CollectCMPPass : public ModulePass
    {
        static char ID;
        CollectCMPPass() : ModulePass(ID) {}

        bool runOnModule(Module &M) override;
        bool runOnFunction(Function &F);
    };
} // namespace

char CollectCMPPass::ID = 0;

void InjectTraceForCmp(ArrayRef<Instruction *> CmpTraceTargets)
{
    for (auto I : CmpTraceTargets)
    {
        if (ICmpInst *ICMP = dyn_cast<ICmpInst>(I))
        {
            IRBuilder<> IRB(ICMP);
            Value *A0 = ICMP->getOperand(0);
            Value *A1 = ICMP->getOperand(1);
            if (!A0->getType()->isIntegerTy())
                continue;
            uint64_t TypeSize = DL->getTypeStoreSizeInBits(A0->getType());
            int CallbackIdx = TypeSize == 8 ? 0 : TypeSize == 16 ? 1 : TypeSize == 32 ? 2 : TypeSize == 64 ? 3 : -1;
            if (CallbackIdx < 0)
                continue;
            // __sanitizer_cov_trace_cmp((type_size << 32) | predicate, A0, A1);
            auto CallbackFunc = SanCovTraceCmpFunction[CallbackIdx];
            bool FirstIsConst = isa<ConstantInt>(A0);
            bool SecondIsConst = isa<ConstantInt>(A1);
            // If both are const, then we don't need such a comparison.
            if (FirstIsConst && SecondIsConst)
                continue;
            // If only one is const, then make it the first callback argument.
            if (FirstIsConst || SecondIsConst)
            {
                CallbackFunc = SanCovTraceConstCmpFunction[CallbackIdx];
                if (SecondIsConst)
                    std::swap(A0, A1);
            }

            auto Ty = Type::getIntNTy(*C, TypeSize);
            IRB.CreateCall(CallbackFunc, {IRB.CreateIntCast(A0, Ty, true), IRB.CreateIntCast(A1, Ty, true)});
        }
    }
}

void InjectTraceForSwitch(ArrayRef<Instruction *> SwitchTraceTargets)
{
    for (auto I : SwitchTraceTargets)
    {
        if (SwitchInst *SI = dyn_cast<SwitchInst>(I))
        {
            IRBuilder<> IRB(I);
            SmallVector<Constant *, 16> Initializers;
            Value *Cond = SI->getCondition();
            if (Cond->getType()->getScalarSizeInBits() > Int64Ty->getScalarSizeInBits())
                continue;
            Initializers.push_back(ConstantInt::get(Int64Ty, SI->getNumCases()));
            Initializers.push_back(ConstantInt::get(Int64Ty, Cond->getType()->getScalarSizeInBits()));
            if (Cond->getType()->getScalarSizeInBits() < Int64Ty->getScalarSizeInBits())
            {
                Cond = IRB.CreateIntCast(Cond, Int64Ty, false);
            }

            for (auto It : SI->cases())
            {
                Constant *C = It.getCaseValue();
                if (C->getType()->getScalarSizeInBits() < Int64Ty->getScalarSizeInBits())
                {
                    C = ConstantExpr::getCast(CastInst::ZExt, It.getCaseValue(), Int64Ty);
                }
                Initializers.push_back(C);
            }
            std::sort(Initializers.begin() + 2, Initializers.end(),
                      [](const Constant *A, const Constant *B) { return cast<ConstantInt>(A)->getLimitedValue() < cast<ConstantInt>(B)->getLimitedValue(); });

            ArrayType *ArrayOfInt64Ty = ArrayType::get(Int64Ty, Initializers.size());
            GlobalVariable *GV = new GlobalVariable(
                *CurModule, ArrayOfInt64Ty, false, GlobalVariable::InternalLinkage,
                ConstantArray::get(ArrayOfInt64Ty, Initializers),
                "__sancov_gen_cov_switch_values");

            IRB.CreateCall(SanCovTraceSwitchFunction, {Cond, IRB.CreatePointerCast(GV, Int64PtrTy)});
        }
    }
}

void InjectTraceForStrcmp(ArrayRef<Instruction *> StrcmpTraceTargets)
{
    for (auto I : StrcmpTraceTargets)
    {
        IRBuilder<> IRB(I);

        if (CallInst *call_inst = dyn_cast<CallInst>(I))
        {

            if (call_inst->getNumArgOperands() == 2)
            {
                Value *V0 = call_inst->getArgOperand(0);
                Value *V1 = call_inst->getArgOperand(1);

                IRB.CreateCall(SanCovTraceStrcmpFunction, {IRB.CreatePointerCast(V0, Int64PtrTy), IRB.CreatePointerCast(V1, Int64PtrTy)});
            }

            // 静态分析时提取const字符串
            for (size_t i = 0; i < call_inst->getNumArgOperands(); i++)
            {
                Value *ArgValue = call_inst->getArgOperand(i);

                ConstantExpr *ConstantArg = dyn_cast<ConstantExpr>(ArgValue);
                if (ConstantArg == nullptr) // not const data (user input?)
                    continue;

                GlobalVariable *GV = dyn_cast<GlobalVariable>(ConstantArg->getOperand(0));
                ConstantDataArray *AR = dyn_cast<ConstantDataArray>(GV->getInitializer());
                StringRef StringData = AR->getRawDataValues();
                outs() << "[STRCMP] " << StringData << "\n";

                // ConstantArg->getOperand(0)->getType()->getTypeID() 15 PointerTyID
            }
        }
    }
}

void InjectCoverage(ArrayRef<BasicBlock *> BlocksToInstrument)
{
    for (auto BB : BlocksToInstrument)
    {
        BasicBlock::iterator IP = BB->getFirstInsertionPt();
        IRBuilder<> IRB(&*IP);
        IRB.CreateCall(SanCovTracePC); // gets the PC using GET_CALLER_PC.
        IRB.CreateCall(EmptyAsm, {}); // Avoids callback merge.
    }
}

bool CollectCMPPass::runOnFunction(Function &F)
{
    if (F.empty() || F.getName().contains("__sanitizer_") || F.getLinkage() == GlobalValue::AvailableExternallyLinkage)
    {
        return false;
    }

    SmallVector<Instruction *, 8> CmpTraceTargets;
    SmallVector<Instruction *, 8> SwitchTraceTargets;
    SmallVector<Instruction *, 8> StrcmpTraceTargets;
    SmallVector<BasicBlock *, 16> BlocksToInstrument;

    bool isMain = F.getName().equals("main") ? true : false;

    for (auto &BB : F)
    {
        outs() << "[BB] " << BB.getName() << "\n";
        BlocksToInstrument.push_back(&BB);
        for (auto &Inst : BB)
        {
            if (isa<ICmpInst>(&Inst))
                CmpTraceTargets.push_back(&Inst);
            if (isa<SwitchInst>(&Inst))
                SwitchTraceTargets.push_back(&Inst);
            if (isa<CallInst>(&Inst))
            {
                CallInst *call_inst = dyn_cast<CallInst>(&Inst);
                Function *fn = call_inst->getCalledFunction();
                if (fn == NULL)
                {
                    Value *v = call_inst->getCalledValue();
                    fn = dyn_cast<Function>(v->stripPointerCasts());
                    if (fn == NULL)
                        continue;
                }
                std::string fn_name = fn->getName();

                if (fn_name.compare("strcmp") == 0) // strcmp, strncmp, strcasecmp, strncasecmp, memcmp
                {
                    StrcmpTraceTargets.push_back(&Inst);
                }
            }
        }
    }

    InjectCoverage(BlocksToInstrument);
    InjectTraceForCmp(CmpTraceTargets);
    InjectTraceForSwitch(SwitchTraceTargets);
    InjectTraceForStrcmp(StrcmpTraceTargets);

    return true;
}

llvm::StringRef getRealFunctionName(Module &M, char *name)
{
    for (auto &F : M)
    {
        if (F.getName().contains(name))
        {
            outs() << name << " -> " << F.getName() << "\n";
            return F.getName();
        }
    }
    return "";
}

bool CollectCMPPass::runOnModule(Module &M)
{
    CurModule = &M;
    C = &(M.getContext());
    DL = &M.getDataLayout();
    Triple TargetTriple = Triple(M.getTargetTriple());

    std::string moduleName = M.getName();
    auto i = moduleName.rfind('/', moduleName.length());
    if (i != std::string::npos)
    {
        moduleName = moduleName.substr(i + 1, moduleName.length() - i);
    }
    outs() << "[+] " << moduleName << "\n";

    //
    IRBuilder<> IRB(*C);
    VoidTy = Type::getVoidTy(*C);
    Int64Ty = IRB.getInt64Ty();
    Int64PtrTy = PointerType::getUnqual(IRB.getInt64Ty());
    Int32Ty = IRB.getInt32Ty();
    Int16Ty = IRB.getInt16Ty();
    Int8Ty = IRB.getInt8Ty();

    SanCovTraceCmpFunction[0] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceCmp1), VoidTy, Int8Ty, Int8Ty));
    SanCovTraceCmpFunction[1] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceCmp2), VoidTy, Int16Ty, Int16Ty));
    SanCovTraceCmpFunction[2] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceCmp4), VoidTy, Int32Ty, Int32Ty));
    SanCovTraceCmpFunction[3] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceCmp8), VoidTy, Int64Ty, Int64Ty));

    SanCovTraceConstCmpFunction[0] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceConstCmp1), VoidTy, Int8Ty, Int8Ty));
    SanCovTraceConstCmpFunction[1] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceConstCmp2), VoidTy, Int16Ty, Int16Ty));
    SanCovTraceConstCmpFunction[2] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceConstCmp4), VoidTy, Int32Ty, Int32Ty));
    SanCovTraceConstCmpFunction[3] = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceConstCmp8), VoidTy, Int64Ty, Int64Ty));

    SanCovTraceSwitchFunction = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceSwitchName), VoidTy, Int64Ty, Int64PtrTy));

    SanCovTraceStrcmpFunction = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTraceStrcmpName), VoidTy, Int64PtrTy, Int64PtrTy));

    SanCovTracePC = checkSanitizerInterfaceFunction(M.getOrInsertFunction(getRealFunctionName(M, SanCovTracePCName), VoidTy));

    // We insert an empty inline asm after cov callbacks to avoid callback merge.
    EmptyAsm = InlineAsm::get(FunctionType::get(IRB.getVoidTy(), false), StringRef(""), StringRef(""), /*hasSideEffects=*/true);

    // Make sure smaller parameters are zero-extended to i64 as required by the x86_64 ABI.
    if (TargetTriple.getArch() == Triple::x86_64)
    {
        for (int i = 0; i < 3; i++)
        {
            SanCovTraceCmpFunction[i]->addParamAttr(0, Attribute::ZExt);
            SanCovTraceCmpFunction[i]->addParamAttr(1, Attribute::ZExt);
            SanCovTraceConstCmpFunction[i]->addParamAttr(0, Attribute::ZExt);
            SanCovTraceConstCmpFunction[i]->addParamAttr(1, Attribute::ZExt);
        }
    }

    for (auto &F : M)
    {
        outs() << "[F] " << F.getName() << "\n";
        runOnFunction(F);
    }

    return true;
}

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
// clang -Xclang -load -Xclang build/skeleton/libCollectCMPPass.so test.c -o test
static void registerCollectCMPPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new CollectCMPPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_OptimizerLast, registerCollectCMPPass);
static RegisterStandardPasses RegisterMyPass0(PassManagerBuilder::EP_EnabledOnOptLevel0, registerCollectCMPPass);

// used for
// clang -c -emit-llvm test.c // .bc
// clang -S -emit-llvm test.c // .ll
// opt -load build/skeleton/libCollectCMPPass.so -CollectCMPPass test.bc/test.ll
static RegisterPass<CollectCMPPass> X("CollectCMPPass", "CollectCMPPass For CFG",
                                      false /* Only looks at CFG */,
                                      false /* Analysis Pass */);

// opt --dot-cfg test.ll
// dot -Tpng cfg.a.dot > cfg.a.png

// clang -emit-llvm -c -I/data2/zhangzheng1/tools/llvm-6.0/usr/local/include SanCovTraceCmp.cpp # SanCovTraceCmp.bc
// clang -emit-llvm -c test.c # test.bc
// llvm-link SanCovTraceCmp.bc test.bc -o main.bc
// clang++ -fPIC CollectCMP.cpp -o libCollectCMPPass.so `llvm-config --cxxflags` -shared
// opt -load libCollectCMPPass.so -CollectCMPPass main.bc -o final.bc
// lli final.bc
// llvm-dis final.bc # final.ll
// opt --dot-cfg final.ll
// dot -Tpng cfg.main.dot > cfg.main.png
// llc -filetype=obj final.bc # final.o
// gcc final.o -o final