import os
import random
from tqdm import tqdm
import subprocess

TNNPROTO_BAK_PATH = r'/home/zhang/data/TNN/model/SqueezeNet/squeezenet_v1.1.tnnproto.bak'
TNNPROTO_PATH = r'/home/zhang/data/TNN/model/SqueezeNet/squeezenet_v1.1.tnnproto'

def mutate():
    if os.path.exists(TNNPROTO_BAK_PATH):

        with open(TNNPROTO_BAK_PATH, 'r') as fp:
            data = fp.read()

        lines = data.split('\n')
        # print('[+] lines: {}'.format(len(lines)))

        layerNames = lines[2].split(' ')[1:-1]
        # print('[+] layers: {}'.format(len(layerNames)))

        layerA = layerNames[random.randint(0, len(layerNames)-1)]
        layerB = layerNames[random.randint(0, len(layerNames)-1)]

        while layerB == layerA:
            layerB = layerNames[random.randint(0, len(layerNames)-1)]

        # print("[+] {} -> {}".format(layerA, layerB))

        for idx, line in enumerate(lines):
            if idx == 2: continue
            tmpline = line.split(' ')
            alocs, blocs = [], []
            for tlidx, tl in enumerate(tmpline):
                if tl == layerA: alocs.append(tlidx)
                elif tl == layerB: blocs.append(tlidx)
            if alocs or blocs:
                for i in alocs: tmpline[i] = layerB
                for i in blocs: tmpline[i] = layerA
                lines[idx] = ' '.join(tmpline)
                # print("[-] {}".format(line))
                # print("[+] {}".format(lines[idx]))
                break
        
        with open(TNNPROTO_PATH, 'w') as fp:
            fp.write('\n'.join(lines))

for i in tqdm(range(1000)):
    mutate()
    cmd = 'cd /home/zhang/data/TNN/examples/linux && ./build/demo_linux ../../model/SqueezeNet/squeezenet_v1.1.tnnproto ../../model/SqueezeNet/squeezenet_v1.1.tnnmodel 224 224 ~/data/dog.jpg'
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) # 重定向输出
    retCode = p.wait()

    if retCode != 0:
        print('!!!')
        break