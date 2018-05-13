import os
os.system("ls")
os.getcwd()
os.chdir("E:\\GoogleDrive\\My_Scripts\\python 学习")

os.listdir()
os.remove
os.mkdir('NewFolder')
os.system("data")
os.system("ls")
os.getcwd()
os.listdir() # ls
os.remove() #rm


import subprocess
subprocess.call("ls")

os.name
'''
posix: linux unix Mac
nt: windows
'''

#查看环境变量
os.environ

os.environ.get("PATH")

os.path()

# Run linux commandline
#cmd=("mv genePi.out {0}").format(newname)
cmd=("mv genePi.out {0}").format(outputfile)
os.system(cmd)
import os






# create folder
os.mkdir('/Users/michael/testdir')  #creat folder
os.rmdir('/Users/michael/testdir')  #remove folder

# 对文件重命名:
>>> os.rename('test.txt', 'test.py')
# 删掉文件:
>>> os.remove('test.py')


os.path.split('/Users/michael/testdir/file.txt')
#('/Users/michael/testdir', 'file.txt')
os.path.join('/Users/michael', 'testdir')
#'/Users/michael/testdir'
os.path.splitext('/path/to/file.txt')  # splite 扩展名
# ('/path/to/file', '.txt')

#要列出当前目录下的所有目录，只需要一行代码：
>>> [x for x in os.listdir('.') if os.path.isdir(x)]
['.lein', '.local', '.m2', '.npm', '.ssh', '.Trash', '.vim', 'Applications', 'Desktop', ...]

#要列出所有的.py文件，也只需一行代码：
>>> [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
['apis.py', 'config.py', 'models.py', 'pymonitor.py', 'test_db.py', 'urls.py', 'wsgiapp.py']

# run linux commandline



#######                 system 
import os
os.system("ls")
 
import subprocess  # os has many problem, subprocess is a much better way 
subprocess.call("ls")



### current dir 
import os 
os.path.dirname(os.path.realpath(__file__))
os.getcwd()

print("Path at terminal when executing this file")
print(os.getcwd() + "\n")

print("This file path, relative to os.getcwd()")
print(__file__ + "\n")

print("This file full path (following symlinks)")
full_path = os.path.realpath(__file__)
print(full_path + "\n")

print("This file directory and name")
path, filename = os.path.split(full_path)
print(path + ' --> ' + filename + "\n")

print("This file directory only")
print(os.path.dirname(full_path))

##set dir 
os.chdir('C:\\Users\\qxs\\Documents\\Python Scripts')
# 注意， python 字符串里，\要用两个\\表示

path='c:\new\test.dat'
path
print(path)

