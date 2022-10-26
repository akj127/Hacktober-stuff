import argparse

from fractions import gcd

parser = argparse.ArgumentParser(description='RSA Common modulus attack')
required_named = parser.add_argument_group('required named arguments')
required_named.add_argument('-n', '--modulus', help='Common modulus', type=long, required=True)
required_named.add_argument('-e1', '--e1', help='First exponent', type=long, required=True)
required_named.add_argument('-e2', '--e2', help='Second exponent', type=long, required=True)
required_named.add_argument('-ct1', '--ct1', help='First ciphertext', type=long, required=True)
required_named.add_argument('-ct2', '--ct2', help='Second ciphertext', type=long, required=True)

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise ValueError('Modular inverse does not exist.')
    else:
        return x % m

def attack(c1, c2, e1, e2, N):
    if gcd(e1, e2) != 1:
        raise ValueError("Exponents e1 and e2 must be coprime")
    s1 = modinv(e1,e2)
    s2 = (gcd(e1,e2) - e1 * s1) / e2
    temp = modinv(c2, N)
    m1 = pow(c1,s1,N)
    m2 = pow(temp,-s2,N)
    return (m1 * m2) % N

def main():
	n = 56891607317613445737750783421867972775249572399868790441120633009929442237956426430872259524747190957003843589191818005172449569095010326902570697779311445080658255239480648637639774011002922525938326812054289272761548189515649720401657615661945821118048442804640057370308200873641231270154569615397630035523
	e1 = 15
	c1 = 56469309419621722745072264207838652962328435946767997622044814783708364014641727623574445134141501637979157915357991990349560025038641029733835390776874211827838349081746055988558104358822972488360758486671776227087938906728676579783033437913622465886682124098078049146249446462955542454130870990925587760172


	n = 56891607317613445737750783421867972775249572399868790441120633009929442237956426430872259524747190957003843589191818005172449569095010326902570697779311445080658255239480648637639774011002922525938326812054289272761548189515649720401657615661945821118048442804640057370308200873641231270154569615397630035523
	e2 = 13
	c2 = 32329112615946008400629911894435459433005895247408214608443373037890224605212549196731172020927876324933946521979508705874232456594545880155126627698928055303619040189497194414548410456513691315796957680520443150673697523600966755935741384614826849213578224143275544065415119993769274896134376873260076292691
	print(hex(attack(c1,c2,e1,e2,n)))
    # args = parser.parse_args()
    # print '[+] Started attack...'
    # try:
    #     message = attack(args.ct1, args.ct2, args.e1, args.e2, args.modulus)
    #     print '[+] Attack finished!'
    #     print '\nPlaintext message:\n%s' % format(message, 'x').decode('hex')
    # except Exception as e:
    #     print '[+] Attack failed!'
    #     print e.message

main()