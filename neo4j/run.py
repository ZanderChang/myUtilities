from py2neo import Graph
import os
from tqdm import tqdm
PASS_LOG = r'./PASS_LOG'
RUNTIME_LOG = r'./PASS_LOG/RUNTIME_LOG'
CMP_CALLS = ["strcmp", "strncmp", "strcasecmp", "strncasecmp", "memcmp"]

PROJECT = 'exiv2'
VERSION = 0.26

graph = Graph("bolt://127.0.0.1:7687", username="neo4j", password="root")

modSet = set() # 全部模块
funcSet = set() # 全部函数
blkSet = set() # 全部基本块
mod2func = {} # 模块m: m中的全部函数
func2blk = {} # 函数f：f的全部IR基本块 1:n（f为完整名称）
blk2call = {} # 基本块b：b中调用的全部函数f 1:n（b为完整名称）
blk2succ = {} # 基本块b：b所有的后续基本块（b为完整名称）
func2call = {} # 函数f：f调用的全部函数 1:n（f为完整名称）
func2cmp = {} # 函数f：f调用的全部cmp函数 1:n（f为完整名称）
curFunc = None
curBB = None
isInHis = False # 当前函数是否已在funcSet中（防止重复处理）

for f in tqdm(os.listdir(PASS_LOG)):
    if f == 'RUNTIME_LOG':
        continue
    with open(os.path.join(PASS_LOG, f), 'r') as fp:
        m = f[:-4]
        modSet.add(m) # modSet
        assert m not in mod2func, '[!] {} {}'.format(f, m)
        mod2func[m] = []
        lines = fp.readlines()
        for line in lines:
            line = line[:-1] # 去掉末尾的\n
            if '[F] ' in line:
                curFunc = m + '|' + line[4:] # moduleName|funcName
                if curFunc not in funcSet:
                    funcSet.add(curFunc) # funcSet
                    mod2func[m].append(line[4:]) # mod2func
                else:
                    raise Exception("[!] {}".format(line)) # 同文件中函数重名？
            elif '[BB] ' in line:
                bbName = line.split(' ')[-1].split('|')[0]
                if curFunc not in func2blk:
                    func2blk[curFunc] = []
                func2blk[curFunc].append(bbName) # func2blk
                curBB = curFunc + '|' + bbName
                blkSet.add(curBB) # blkSet
                assert curBB not in blk2succ, '[!] {} {}'.format(curBB, line)
                blk2succ[curBB] = line.split(' ')[-1].split('|')[1:] # blk2succ
            elif '[BBC] ' in line:
                bbCallFuncName = line[6:]
                if curBB not in blk2call:
                    blk2call[curBB] = []
                blk2call[curBB].append(bbCallFuncName) # blk2call
                if curFunc not in func2call:
                    func2call[curFunc] = []
                func2call[curFunc].append(bbCallFuncName) # func2call
            elif any([n in line for n in CMP_CALLS]):
                if curFunc not in func2cmp:
                    func2cmp[curFunc] = []
                func2cmp[curFunc].append(line) # func2cmp
            else:
#                 raise Exception("[!] {}".format(line))
                print("[!] {} {} {} {}".format(f, curFunc, curBB, line))

visitedModules = set() # 所有被访问过的模块
visitedFunctions = set() # 所有被访问过的函数
visitedBlocks = set() # 所有被访问过的基本块
allBlocks = [] # 访问基本块历史记录（顺序保存）
blk2PC = {} # 基本块b：本次执行对应的PC（b为完整名称）
with open(RUNTIME_LOG, 'r') as fp:
    for line in tqdm(fp.readlines()):
        line = line.strip()
        if '[PC] ' in line:
            _, PC, bbGName = line.split(' ')
            mn, fn, bn = bbGName.split('|')
            assert mn in mod2func
            assert '|'.join([mn,fn]) in funcSet
            assert '|'.join([mn,fn]) in func2blk, '[!] {} {} {}'.format(line, fn, bn)
            assert bn in func2blk['|'.join([mn,fn])], '[!] {} {} {}'.format(line, fn, bn)
            visitedModules.add(mn) # visitedModules
            visitedFunctions.add('|'.join([mn,fn])) # visitedFunctions
            visitedBlocks.add(bbGName) # visitedBlocks
            allBlocks.append(bbGName)
            assert bbGName not in blk2PC or blk2PC[bbGName] == PC, '[+] {}'.format(line)
            blk2PC[bbGName] = PC
        elif '[STRCMP] ' in line:
            pass
        elif '[CMP] ' in line:
            pass
        elif '[SWITCH] ' in line:
            pass
        else:
            raise Exception('[!] {}'.format(line))
    else:
        print('[+] Pass Check, All Runtime Info Fits the Result of Static Analysis.')
        print('[+] visitedModules: {}/{}.'.format(len(visitedModules), len(modSet)))
        print('[+] visitedFunctions: {}/{}.'.format(len(visitedFunctions), len(funcSet)))
        print('[+] visitedBlocks: {}/{}/{}.'.format(len(visitedBlocks), len(blkSet), len(allBlocks)))
    
findEntry = False
for i in tqdm(range(1, len(allBlocks))):
    last_m, last_f, last_b = allBlocks[i-1].split('|')
    cur_m, cur_f, cur_b = allBlocks[i].split('|')
    if not findEntry:
        graph.run('MATCH (b:BasicBlock {{ name:"{0}", inProject:"{1}", inModule:"{2}", inFunction:"{3}" }}) SET b:RunPathRoot:RunPathNode'.format(last_b, PROJECT, last_m, last_f))
        graph.run('MATCH (b:BasicBlock {{ name:"{0}", inProject:"{1}", inModule:"{2}", inFunction:"{3}" }}) SET b:RunPathNode'.format(cur_b, PROJECT, cur_m, cur_f))
        findEntry = True
    else:
        graph.run('MATCH (b:BasicBlock {{ name:"{0}", inProject:"{1}", inModule:"{2}", inFunction:"{3}" }}) SET b:RunPathNode'.format(cur_b, PROJECT, cur_m, cur_f))
    graph.run('MATCH (b1:RunPathNode {{ name:"{0}", inProject:"{1}", inModule:"{2}", inFunction:"{3}" }}), (b2:RunPathNode {{ name:"{4}", inProject:"{1}", inModule:"{5}", inFunction:"{6}" }}) MERGE (b1)-[:runPathNext]->(b2)'.format(last_b, PROJECT, last_m, last_f, cur_b, cur_m, cur_f))