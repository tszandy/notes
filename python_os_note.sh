import os

# walk current folder and folder under
for root, dirs, files in os.walk("."):
   for name in files:
      print(os.path.join(root, name))
   for name in dirs:
      print(os.path.join(root, name))

# change current directory(dir) to path
os.chdir(path)

# list file and dir under current dir
os.listdir()

# output path of current dir
os.getcwd()

# get val of environment variable key if it exists otherwise return None 
os.getenv(key)

