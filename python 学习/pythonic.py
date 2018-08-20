

# pythonic

def sort(array):
    less = []; more = []
    if len(array) <=1:
        return array
    pivot = array.pop()
    for x in array:
        if x<= pivot:
            less.append(x)
        else:
            more.append(x)
        print (sort(less) + [pivot] + sort(more))
        
sort ([1,5,3,7,9])



# 
a,b = b, a

# 
for i in list:

# 
with open file as f:
    
#
cmd= 'mv {file1} {file2}'.format(file1='Myfile',file2='Mynewfile')
print(cmd)

# learn these package
request
flask

# use PEP8
pip install -U pep8
#usage
pep8 --first XXX.py

# 函数设计要向下兼容
# 使用有默认值得function

# 一个函数只做一件事情


# assert 

a = 1
b = 2
assert a == b, 'Error: not equal'


type()
isinstance(a,int)       # a better way to check varibale type



eval("'variable' + str(a)")
'variable'+str(a)


# enumerate 这个超级有用
list=['a','b','c','d','e']
for k,v in enumerate(list):
    if v !='c':
        print(k,v)

# but not for dict
d = {'qxs:':'xinshuai qi','sss':'shanshansong','wn':'weining'}
for k,v in d():
    print(k,' and ',v)

# 判断对象是否为空
    
if c:
    print (c)
else:
    print('c is not defined')


# combined string using join, put variables in a [] taple
"".join(['a','b'])








