# from pwn import *
# req1="\033ub\032z\031u\033un\033nD^ul\032efus\032_"

# req=[]

# for i in req1:
# 	req.append(ord(i))
# print(req)
# # exit()
# alpha='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
# password=""
# i=0
# # while(i<len(req)):
# # 	# for j in alpha:
# # 	for j in range(128):	
# # 		p=process("ltrace ./fake",shell=True)
# # 		p.recv()
# # 		p.sendline(password+chr(j))
# # 		q=(p.recvuntil("printf"))
# # 		q=q.split("\n")[5]
# # 		q=q.split(",")[0][8:-1]
# # 		print(q)
# # 		print(ord(q[i]),(req[i]))
# # 		if(ord(q[i])==(req[i])):
# # 			password=password+j
# # 			print(password)
# # 			exit()
# # 			break
# # 		p.close()
# # 		# exit()
# # 	i+=1
# d={}
# for j in alpha:
# 	try:	
# 		p=process("ltrace ./fake",shell=True)
# 		p.recv()
# 		p.sendline((j))
# 		q=(p.recvuntil("printf"))
# 		q=q.split("\n")[5]
# 		q=q.split(",")[0][8:-1]
# 		d[q[0]]=j
# 		p.close()
# 	except:
# 		continue
# print(d)
req1="\033ub\032z\031u\033un\033nD^ul\032efus\032_"

d={'A': 'k', '@': 'j', 'C': 'i', 'B': 'h', 'E': 'o', 'D': 'n', 'G': 'm', 'F': 'l', 'I': 'c', 'H': 'b', 'K': 'a', 'J': '`', 'M': 'g', 'L': 'f', 'O': 'e', 'N': 'd', 'Q': '{', 'P': 'z', 'S': 'y', 'R': 'x', 'T': '~', 'W': '}', 'V': '|', 'Y': 's', 'X': 'r', '[': 'q', 'Z': 'p', ']': 'w', '\\': '?', '_': 'u', '^': 't', 'a': 'K', '`': 'J', 'c': 'I', 'b': 'H', 'e': 'O', 'd': 'N', 'g': 'M', 'f': 'L', 'i': 'C', 'h': 'B', 'k': 'A', 'j': '@', 'm': 'G', 'l': 'F', 'o': 'E', 'n': 'D', 'q': '[', 'p': 'Z', 's': 'Y', 'r': 'X', 'u': '_', 't': '^', 'w': ']', 'v': '\\', 'y': 'S', 'x': 'R', '{': 'Q', 'z': 'P', '}': 'W', '|': 'V', '~': 'T'}
ans=""
for i in req1:
	if(i in d):
		ans+=d[i]
	else:
		ans+="?"
print(ans)

# 1_H0P3_1_D1Dnt_F0OL_Y0u
# Securinets{1_H0P3_1_D1Dnt_F0OL_Y0u}