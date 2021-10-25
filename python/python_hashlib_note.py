#secure hash library
import hashlib

dir(hashlib)

hashlib.alogirthms.algorithms_available
hashlib.alogirthms.algorithms_guaranteed

hashlib.sha224("hash_string").hexdigest()

hashlib.pbkdf2_hmac("sha256",b"password",b"salt",100000)
