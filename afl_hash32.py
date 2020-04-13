# cksum = hash32(trace_bits, MAP_SIZE, HASH_CONST);

# 将32位整数_x向左循环_r位
def ROL32(_x, _r):
    _x &= 0xffffffff
    return ((_x << _r) | (_x >> (32 - _r))) & 0xffffffff

# MurmurHash
def hash32(data, len, seed=0xa5b35705):
    h1 = (seed ^ len) & 0xffffffff

    for i in range(len):
        k1 = ord(data[i]) * 0xcc9e2d51
        k1 &= 0xffffffff
        k1 = ROL32(k1, 15) * 0x1b873593
        k1 &= 0xffffffff

        h1 ^= k1
        h1 = ROL32(h1, 13) * 5 + 0xe6546b64
        h1 &= 0xffffffff

    h1 ^= h1 >> 16
    h1 *= 0x85ebca6b
    h1 &= 0xffffffff
    h1 ^= h1 >> 13
    h1 *= 0xc2b2ae35
    h1 &= 0xffffffff
    h1 ^= h1 >> 16

    return h1

print(hex(hash32('MurmurHash', 10)))