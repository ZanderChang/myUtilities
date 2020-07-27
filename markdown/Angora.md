# llvm

## compiler

### Angora/llvm_mode/compiler/angora_clang.c
Angora/bin/angora_clang

Angora/bin/angora_clang++

```sh
+ ANGORA_USE_ASAN=1 USE_FAST=1 ../bin/angora-clang mini/mini.c -lz -o mini/mini.fast

clang mini/mini.c -lz -o mini/mini.fast
 -Xclang -load -Xclang ../bin/pass/libUnfoldBranchPass.so 
 -Xclang -load -Xclang ../bin/pass/libAngoraPass.so 
 -mllvm -angora-dfsan-abilist=../bin/rules/angora_abilist.txt 
 -mllvm -angora-dfsan-abilist=../bin/rules/dfsan_abilist.txt 
 -mllvm -angora-exploitation-list=../bin/rules/exploitation_list.txt 
 -pie -fpic -Qunused-arguments -U_FORTIFY_SOURCE -fsanitize=address -g -O3 -funroll-loops 
 ../bin/lib/libruntime_fast.a 
 -Wl,--no-as-needed -Wl,--gc-sections -ldl -lpthread -lm

+ USE_TRACK=1 ../bin/angora-clang mini/mini.c -lz -o mini/mini.taint

clang mini/mini.c -lz -o mini/mini.taint
 -Xclang -load -Xclang ../bin/pass/libUnfoldBranchPass.so 
 -Xclang -load -Xclang ../bin/pass/libAngoraPass.so 
 -mllvm -TrackMode 
 -mllvm -angora-dfsan-abilist=../bin/rules/angora_abilist.txt 
 -mllvm -angora-dfsan-abilist=../bin/rules/dfsan_abilist.txt 
 -mllvm -angora-exploitation-list=../bin/rules/exploitation_list.txt 
 -Xclang -load -Xclang ../bin/pass/libDFSanPass.so 
 -mllvm -angora-dfsan-abilist2=../bin/rules/angora_abilist.txt 
 -mllvm -angora-dfsan-abilist2=../bin/rules/dfsan_abilist.txt 
 -pie -fpic -Qunused-arguments -g -O3 -funroll-loops 
 -Wl,--whole-archive ../bin/lib/libdfsan_rt-x86_64.a -Wl,--no-whole-archive -Wl,
 --dynamic-list=../bin/lib/libdfsan_rt-x86_64.a.syms 
 ../bin/lib/libruntime.a 
 ../bin/lib/libDFSanIO.a 
 -lstdc++ -lrt -Wl,--no-as-needed -Wl,--gc-sections -ldl -lpthread -lm
```

## pass

### Angora/llvm_mode/pass/AngoraPass.cc

- AngoraLLVMPass::getInstructionId 为每条Inst分配Cid

### Angora/llvm_mode/pass/DFSanPass.cc

- DFSanFunction::combineOperandShadows

```cpp
if (Inst->getOpcode() == Instruction::SExt) { // Sign extend integers 转换
    IRBuilder<> IRB(Inst);
    CallInst *Call = 
        IRB.CreateCall(DFS.DFSanMarkSignedFn, {Shadow, DFS.ZeroShadow}); // dfsan_mark_signed
    Call->addAttribute(AttributeList::ReturnIndex, Attribute::ZExt);
    Call->addAttribute(0, Attribute::ZExt);
    Call->addAttribute(1, Attribute::ZExt);
  }
```

- DFSanFunction::combineShadows

```cpp
bool is_signed = false;
  switch (Pos->getOpcode()) {
  // case Instruction::SExt: // in combine operandshadows..
  case Instruction::SDiv:
  case Instruction::SRem: // eturns the remainder from the signed division of its two operands
  case Instruction::AShr: // (arithmetic shift right) returns the first operand shifted to the right a specified number of bits with sign extension
    is_signed = true;
    break;
  case Instruction::And: // returns the bitwise logical and of its two operands
    if (Pos->getNumOperands() == 2) {
      Value *Arg1 = Pos->getOperand(0);
      Value *Arg2 = Pos->getOperand(1);
      if (Arg1->getType()->isIntegerTy() && Arg2->getType()->isIntegerTy()) {
        IRBuilder<> IRB(Pos);
        if (isa<ConstantInt>(Arg1) && V2 != DFS.ZeroShadow) { // Constant
          CallInst *Call = IRB.CreateCall(DFS.DFSanCombineAndFn, {V2}); // dfsan_combine_and_ins
          Call->addAttribute(0, Attribute::ZExt);
        } else if (isa<ConstantInt>(Arg2) && V1 != DFS.ZeroShadow) {
          CallInst *Call = IRB.CreateCall(DFS.DFSanCombineAndFn, {V1}); // dfsan_combine_and_ins
          Call->addAttribute(0, Attribute::ZExt);
        }
      }
    }
    break;
  default:
    // LangOptions::SOB_Undefined && bits < 32(i16 will be optimization to
    // remove usw) see
    // https://github.com/llvm-mirror/clang/blob/release_40/lib/CodeGen/CGExprScalar.cpp
    // detect nsw attribute: which the most important thing to mark signed
    // integer.
    if (OverflowingBinaryOperator *op = dyn_cast<OverflowingBinaryOperator>(Pos)) {
      if (op->hasNoSignedWrap() && !op->hasNoUnsignedWrap())
        is_signed = true;
    } else if (CmpInst *op = dyn_cast<CmpInst>(Pos)) {
      if (op->isSigned())
        is_signed = true;
    }
    break;
  }

  if (is_signed) {
    IRBuilder<> IRB(Pos);
    CallInst *Call = IRB.CreateCall(DFS.DFSanMarkSignedFn, {V1, V2}); // dfsan_mark_signed
    Call->addAttribute(AttributeList::ReturnIndex, Attribute::ZExt);
    Call->addAttribute(0, Attribute::ZExt);
    Call->addAttribute(1, Attribute::ZExt);
  }

  switch (Pos->getOpcode()) {
  case Instruction::Add:
  case Instruction::Sub:
  case Instruction::Mul:
  case Instruction::UDiv:
  case Instruction::SDiv:
  case Instruction::SRem:
    // case Instruction::Shl:
    // case Instruction::AShr:
    // case Instruction::LShr:
    IRBuilder<> IRB(Pos);
    Value *Arg1 = Pos->getOperand(0);
    int num_bits = Arg1->getType()->getScalarSizeInBits();
    int num_bytes = num_bits / 8;
    if (num_bytes > 0 && num_bits % 8 == 0) {
      Value *SizeArg = ConstantInt::get(DFS.ShadowTy, num_bytes);
      CallInst *Call = IRB.CreateCall(DFS.DFSanInferShapeFn, {V1, V2, SizeArg}); // dfsan_infer_shape_in_math_op
      Call->addAttribute(1, Attribute::ZExt);
      Call->addAttribute(2, Attribute::ZExt);
    }
    break;
  }
```

## rules
## libcxx
## external_lib
Angora/bin/lib/libDFSanIO.a，一些系统函数的`__dfsw_`

Angora/bin/lib/libZlibRt.a

### Angora/llvm_mode/external_lib/io_func.c
`__dfsw_`包装IO相关函数，调用`dfsan_create_label`为每个byte创建和`dfsan_set_label`设置label，offset为fd当前位置

## dfsan_rt

### Angora/llvm_mode/dfsan_rt/dfsan/dfsan.cc
指向`Rust`导出的函数

```cpp
extern "C" SANITIZER_INTERFACE_ATTRIBUTE dfsan_label
dfsan_mark_signed(dfsan_label l1, dfsan_label l2) {
  if (l1 > 0) __angora_tag_set_mark_sign(l1);
  if (l2 > 0) __angora_tag_set_mark_sign(l2);
  return 0;
}

extern "C" SANITIZER_INTERFACE_ATTRIBUTE void dfsan_infer_shape_in_math_op(
    dfsan_label l1, dfsan_label l2, u32 len) {
  if (l1 > 0) __angora_tag_set_infer_shape_in_math_op(l1, len);
  if (l2 > 0) __angora_tag_set_infer_shape_in_math_op(l2, len);
}

extern "C" SANITIZER_INTERFACE_ATTRIBUTE void dfsan_combine_and_ins(
    dfsan_label lb) {
  __angora_tag_set_combine_and(lb);
}

extern "C" SANITIZER_INTERFACE_ATTRIBUTE dfsan_label
dfsan_create_label(int pos) {
  // return __dfsan_tag_set->insert(pos);
  return __angora_tag_set_insert(pos);
}
```


# Rust

## common

### Angora/common/src/cond_stmt_base.rs

## fuzzer
Angora/bin/fuzzer

### Angora/fuzzer/src/executor/executor.rs

- run_target

```rust
let mut cmd = Command::new(&target.0);
let mut child = cmd
    .args(&target.1)
    .stdin(Stdio::null())
    .env_clear()
    .envs(&self.envs)
    .stdout(Stdio::null())
    .stderr(Stdio::null())
    .mem_limit(mem_limit.clone()) // ?
    .setsid() // 创建新Session
    .pipe_stdin(self.fd.as_raw_fd(), self.cmd.is_stdin) // limit.rs
    .spawn()
    .expect("Could not run target");
```

```sh
[+] ("./exiv2.fast", ["output1/tmp/cur_input_1"])
[+] {"ANGORA_TRACK_OUTPUT": "output1/tmp/track_1", "ANGORA_BRANCHES_SHM_ID": "23822346", "ANGORA_COND_STMT_SHM_ID": "23855115", "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=0:symbolize=0:allocator_may_return_null=1", "LD_LIBRARY_PATH": "$LD_LIBRARY_PATH:/data2/zhangzheng1/tools/llvm-7.0.0/clang+llvm/lib", "MSAN_OPTIONS": "exit_code=86:symbolize=0:abort_on_error=1:allocator_may_return_null=1:msan_track_origins=0"}

[+] ("./exiv2.taint", ["output1/tmp/cur_input_1"])
[+] {"ANGORA_TRACK_OUTPUT": "output1/tmp/track_1", "ANGORA_BRANCHES_SHM_ID": "23822346", "ANGORA_COND_STMT_SHM_ID": "23855115", "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=0:symbolize=0:allocator_may_return_null=1", "LD_LIBRARY_PATH": "$LD_LIBRARY_PATH:/data2/zhangzheng1/tools/llvm-7.0.0/clang+llvm/lib", "MSAN_OPTIONS": "exit_code=86:symbolize=0:abort_on_error=1:allocator_may_return_null=1:msan_track_origins=0"}

ANGORA_TRACK_OUTPUT=track.log ASAN_OPTIONS=abort_on_error=1:detect_leaks=0:symbolize=0:allocator_may_return_null=1 MSAN_OPTIONS=exit_code=86:symbolize=0:abort_on_error=1:allocator_may_return_null=1:msan_track_origins=0 ANGORA_BRANCHES_SHM_ID=23822346, ANGORA_COND_STMT_SHM_ID=23855115 ./bin/exiv2
```

```rust
// Angora/runtime_fast/src/shm_conds.rs SHM_CONDS
// __angora_cond_cmpid
// AngoraMapPtr
pub static COND_STMT_ENV_VAR: &str = "ANGORA_COND_STMT_SHM_ID";

// Angora/runtime_fast/src/shm_branches.rs
// AngoraCondId
pub static BRANCHES_SHM_ENV_VAR: &str = "ANGORA_BRANCHES_SHM_ID"; // __angora_area_ptr
```


### Angora/fuzzer/src/track/fparser.rs

- load_track_data
- read_and_parse
- get_offsets_and_variables

```rust
pub struct CondStmt {
    pub base: CondStmtBase,
    pub offsets: Vec<TagSeg>,
    pub offsets_opt: Vec<TagSeg>,
    pub variables: Vec<u8>,

    pub speed: u32, // 对应输入的执行时长
    pub is_desirable: bool, // non-convex
    pub is_consistent: bool,
    pub fuzz_times: usize,
    pub state: CondState,
    pub num_minimal_optima: usize,
    pub linear: bool,
}

pub struct CondStmtBase {
    pub cmpid: u32,
    pub context: u32,
    pub order: u32,
    pub belong: u32, // 对应输入的Id

    pub condition: u32,
    pub level: u32,
    pub op: u32, // arg1和arg2的比较关系
    pub size: u32,

    pub lb1: u32, // clang label
    pub lb2: u32,

    pub arg1: u64,
    pub arg2: u64,
}

pub struct TagSeg {
    pub sign: bool,
    pub begin: u32,
    pub end: u32,
} 

// LogData仅通过tag_set_wrap::tag_set_find对TagSet做查询，得到label对应的bit vector
pub struct LogData {
    pub cond_list: Vec<CondStmtBase>, // 条件语句列表
    pub tags: HashMap<u32, Vec<TagSeg>>, // clang label -> offsets (label -> bit vector)
    pub magic_bytes: HashMap<usize, (Vec<u8>, Vec<u8>)>, // variables
}
```

```rust
cond.variables = if let Some(args) = magic_bytes {
    [&args.1[..], &args.0[..]].concat()
} else {
    // if it is integer comparison, we use the bytes of constant as magic bytes.
    mut_input::write_as_ule(cond.base.arg2, cond.base.size as usize)
};
```

## runtime_fast [staticlib]
Angora/bin/lib/libruntime_fast.a

### Angora/runtime_fast/src/fast.rs

- __angora_trace_cmp
- __angora_trace_switch


## runtime
Angora/bin/lib/libruntime.a

### Angora/runtime/src/tag_set.rs
树形结构`TagSet`管理标签（bit vector），300+代码，500+测试，核心操作逻辑

`1`节点的parent指向`ROOT`或其它`1`节点，`0`节点的parent只指向`ROOT`

- find 根据label获取bit vector

### Angora/runtime/src/logger.rs
将track信息写入环境变量ANGORA_TRACK_OUTPUT=track.log指定的日志文件

- save_tag
- save

### Angora/runtime/src/tag_set_wrap.rs
封装对`TagSet`的操作

- pub extern "C" fn __angora_tag_set_insert(offset: u32) -> u32
  - `offset`指当前bit vector前置0的个数
  - 在`Tagset`中新增记录
- __angora_tag_set_mark_sign
- __angora_tag_set_infer_shape_in_math_op
- __angora_tag_set_combine_and

### Angora/runtime/src/track.rs
导出函数均调用`Logger.save`触发保存label和其对应的操作数到`LogData`

- __dfsw___angora_trace_cmp_tt
- __dfsw___angora_trace_switch_tt
- __dfsw___angora_trace_fn_tt
- __dfsw___angora_trace_exploit_val_tt



```sh
# 使用wllvm编译
LLVM_COMPILER=clang CC=wllvm CXX=wllvm++ CFLAGS=-O0 ./configure --disable-shared
LLVM_COMPILER=clang make -j15
extract-bc exiv2
/data2/zhangzheng1/tools/Angora/bin/angora-clang exiv2.bc -lstdc++ -lz -lexpat -o exiv2.fast
USE_TRACK=1 /data2/zhangzheng1/tools/Angora/bin/angora-clang exiv2.bc -o exiv2.taint

# 正常流程编译
mkdir install
mkdir fuzz
CC=/data2/zhangzheng1/tools/Angora/bin/angora-clang CXX=/data2/zhangzheng1/tools/Angora/bin/angora-clang++ ./configure --disable-shared --prefix=`realpath ./install`
make -j15
cp bin/exiv2 fuzz/exiv2.fast
make clean

## 直接make定位不需要处理的函数 ldd exiv2.fast
cp /lib/x86_64-linux-gnu/libz.so.1.2.8 fuzz/libz.so # end with .so
cp /lib/x86_64-linux-gnu/libexpat.so.1.6.0 fuzz/libexpat.so

~/zhangzheng1/tools/Angora/tools/gen_library_abilist.sh fuzz/libz.so > fuzz/abilist.txt discard
~/zhangzheng1/tools/Angora/tools/gen_library_abilist.sh fuzz/libexpat.so >> fuzz/abilist.txt discard

ANGORA_TAINT_RULE_LIST=`realpath fuzz/abilist.txt` USE_TRACK=1 make -j15
cp bin/exiv2 fuzz/exiv2.taint

cd fuzz
mkdir input
cp ~/zhangzheng1/data/Aiptek/* ./input

/data2/zhangzheng1/tools/Angora/bin/fuzzer -i input -o output -t ./exiv2.taint -- ./exiv2.fast @@
```

完整编译exiv2-0.27.3
```sh
cmake -DCMAKE_C_COMPILER=/data2/zhangzheng1/tools/Angora/bin/angora-clang -DCMAKE_CXX_COMPILER=/data2/zhangzheng1/tools/Angora/bin/angora-clang++ -DBUILD_SHARED_LIBS=OFF ..
# 其余步骤同上
```

```rust
// track.rs
lazy_static! {
    static ref LC: Mutex<Option<Logger>> = Mutex::new(Some(Logger::new()));
}

// tag_set_wrap.rs
lazy_static! {
    static ref TS: Mutex<Option<TagSet>> = Mutex::new(Some(TagSet::new()));
}
```