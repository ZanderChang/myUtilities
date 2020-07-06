#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/CFG.h"

#include "llvm/IR/Constants.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/Debug.h"

#include <string>
#include <set>

using namespace llvm;

namespace
{
    struct SkeletonPass : public ModulePass
    {
        static char ID;
        SkeletonPass() : ModulePass(ID) {}

        bool runOnModule(Module &M) override;

    };
} // namespace

char SkeletonPass::ID = 0;

std::map<std::string, int> func2cov;

std::string bbGetName(BasicBlock &bb)
{
    std::string funcName = bb.getParent()->getName();
    std::string name = bb.getName();

    if (name.empty())
    {
        std::string Str;
        raw_string_ostream OS(Str);
        bb.printAsOperand(OS, false);
        bb.setName(OS.str());
    }

    return funcName + name;
}

int getFuncCov(Function &f, std::set<std::string> &s)
{
    for (auto &bb : f)
    {
        std::string bbName = bbGetName(bb);
        if (s.count(bbName) == 0)
        {
            s.insert(bbName);
            for (auto &inst : bb)
            {
                if (CallInst* call_inst = dyn_cast<CallInst>(&inst))
                {
                    Function* fn = call_inst->getCalledFunction();
                    getFuncCov(*fn, s);
                }
            }
        }
    }

    return s.size();
}

bool SkeletonPass::runOnModule(Module &M)
{
    LLVMContext &C = M.getContext();

    std::string moduleName = M.getName();
    auto i = moduleName.rfind('/', moduleName.length());
    if (i != std::string::npos)
    {
        moduleName = moduleName.substr(i + 1, moduleName.length() - i);
    }

    outs() << "[+] " << moduleName << "\n";

    std::set<std::string> s;

    for (auto &F : M)
    {
        s.clear();
        func2cov[F.getName()] = getFuncCov(F, s);
        // std::string funcName = F.getName();
        // outs() << "[F] " << funcName << "\n";
        // func2cov[funcName] = 0;
        // for (auto &BB : F)
        // {
        //     func2cov[funcName] += 1;
        //     BlockAddress* BA = BlockAddress::get(&F, &BB);
        //     outs() << "[B] " << bbGetName(&BB) << " " << *BA << "\n";
        //     for (succ_iterator PI = succ_begin(&BB), E = succ_end(&BB); PI != E; ++PI)
        //     {
        //         BasicBlock *SuccBB = *PI;
        //         outs() << "[SUCC] " << SuccBB->getName() << "\n";
        //     }
        //     for (auto Inst = BB.begin(); Inst != BB.end(); Inst++)
        //     {
        //         Instruction &inst = *Inst;
        //         if (CallInst* call_inst = dyn_cast<CallInst>(&inst))
        //         {
        //             Function* fn = call_inst->getCalledFunction();
        //             outs() << "[I] " << inst.getOpcodeName() << " " << fn->getName() << "\n";
        //         }
        //         else
        //         {
        //             outs() << "[I] " << inst.getOpcodeName() << "\n";
        //         }
        //     }
        // }
    }


    std::map<std::string, int>::iterator b = func2cov.begin();
    std::map<std::string, int>::iterator e = func2cov.end();
    while (b != e)
    {
        outs() << b->first << ": " << b->second << "\n";
        b++;
    }
    func2cov.clear();

    return true;
}

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
// clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.so test.c -o test
static void registerSkeletonPass(const PassManagerBuilder &, legacy::PassManagerBase &PM)
{
    PM.add(new SkeletonPass());
}
static RegisterStandardPasses RegisterMyPass(PassManagerBuilder::EP_OptimizerLast, registerSkeletonPass);
static RegisterStandardPasses RegisterMyPass0(PassManagerBuilder::EP_EnabledOnOptLevel0, registerSkeletonPass);

// used for 
// clang -c -emit-llvm test.c // .bc 
// clang -S -emit-llvm test.c // .ll 
// opt -load build/skeleton/libSkeletonPass.so -SkeletonPass test.bc/test.ll
static RegisterPass<SkeletonPass> X("SkeletonPass", "SkeletonPass For CFG",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

// opt --dot-cfg test.ll
// dot -Tpng cfg.a.dot > cfg.a.png