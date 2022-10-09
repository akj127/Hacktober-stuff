s="87 80 35 107 38 104 65 32 69 32 65 64 34 93 84 76 94 35 87 76 68 39 64 76 85 70 93 76 117 113 42 32 38 42 110"
arr=list(map(int,s.split()))
print(arr)
a = 0x13
b = 0x1337
# dec = []
# for char in msg:
#     dec.append((ord(char) ^ a) % b)
# return dec
flag=""
for v in arr:
    for i in range(10,128):
        if(((i ^ a) % b)==v):
            flag+=chr(i)
            break
print(flag)
# flag="DC0x5{R3V3RS1NG_M0D_W4S_FUN_fb9359}"