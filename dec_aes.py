from Crypto.Util.number import long_to_bytes
from Crypto.Cipher import AES
from base64 import b64encode, b64decode
import random

def getRandomBytes(seed):
	random.seed(seed)
	key = long_to_bytes(random.getrandbits(8*16))
	return key

cipher = "cNZQNTXpEOevvG28/gXPmQIREF800F2+MmM1ntiEycw="

cipher=b64decode(cipher)
# print(cipher)

for i in range(257):
	print(i
		)
	seed =i
	key = getRandomBytes(seed)
	aes = AES.new(key, AES.MODE_ECB)
	flag=aes.decrypt(cipher)
	if("ecurinets{" in flag):
		print(flag)
		exit()

# seed = random.randrange(0,256)
# key = getRandomBytes(seed)	# generate random 16 bytes
# flag = pad(flag)
# aes = AES.new(key, AES.MODE_ECB)
# cipher = aes.encrypt(flag)
# print(b64encode(cipher))

'''
cipher = "cNZQNTXpEOevvG28/gXPmQIREF800F2+MmM1ntiEycw="
'''