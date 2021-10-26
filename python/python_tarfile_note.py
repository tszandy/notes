# Read and write tar archive files
import tarfile

tarfile.open(name=None, mode='r', fileobj=None, bufsize=10240)

tarfile.is_tarfile(name)

tarfile.getmembers()

tarfile.getmember(name)

tarfile.getnames()

tarfile.list()

tarfile.next()

tarfile.extractall(path = '.',members = None)

tarfile.extract(member,path='')

tarfile.extractfile(member)

tar = tarfile.open("sample.tar.gz")
tar.extractall()
tar.close()
