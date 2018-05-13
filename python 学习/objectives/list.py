
#               list
family = ["mom", 'dad', 'dog', 'bro', 'sister']
family [2]# 调用list
family [-2] # 倒数第二个


# 生成列表
list（range(1:11))

L=[] # create a new list use loop
for x in range(1,11):
    L.append(x*x)
	
	
	

#   list 
renz = [ EcoRI, BamHI, HindIII ] 
print(renz)

#    list
L = [123, "sss", 3.14]

len(L)

##   add element to list
L2=L + [4,5,6]

L2.append("lalalal")  # add to the end

L2.extend([7,8])

L2 += [9]

#   delete

L2.pop(2)  #pop out the thrid element

L2.sort()

L2.reverse()

L2[3]='qixinshuai'  # replace an element
print(L2)


## list within list
M =[[1,2,3],
    [4,5,6],
    [7,8,9]]

print(M)
print(M[1][2]) #get the second list, then the third element in second list


## list comprehension expresion

col_2= [row[1] for row in M]  # extract  element 2 in each row in M
print (col_2)



"Xinshuaiqi"[0] # string 也可以被index
'X'


print (family [2])

example = [0,1,2,3,4,5,6,7,8,9]
example[4:8] # 提取从4开始，8以前的所有元素
example[-3:] # continue to the end of the list
example[:7]

#每5个取一个
L[::5]

# 加Sequence
[4,5,6]+[1,2,3]
=[4, 5, 6, 1, 2, 3]

["seq", "DNA"]

21*10
210
"21"*10
'21212121212121212121'
[21]*10
[21, 21, 21, 21, 21, 21, 21, 21, 21, 21]

# in 功能, 看list里面是不是有你要的element
>>> name = 'xinshuaiqi'
>>> 'x' in name
True

>>> num = [1,39,388,9,-5]
>>> len (num)
5
>>> max (num)
388
>>> min (num)
-5
>>> list ('xinshuaiqi')
['x', 'i', 'n', 's', 'h', 'u', 'a', 'i', 'q', 'i']
>>> num [3] = 5 # 将第四个元素替换成5
del num [4] # 删除元素
num.append (88) # 添加元素

one = [1,2,3,4]  #添加多个元素
>>> num.extend (one)
>>> num
['x', 'i', 'n', 5, 'u', 'a', 'i', 'q', 'i', 88, 1, 2, 3, 4   

>>> num
['x', 'i', 'n', 5, 'u', 'a', 'i', 'q', 'i', 88]

num.count('i') # 有多少“i”在list里面

num.index ('i')

>>> num.insert (2, "mama")# 插入
>>> num
['x', 'i', 'mama', 'n', 5, 'u', 'a', 'i', 'q', 'i', 88, 1, 2, 3, 4]


>>> num.pop (1) # 删除
'i'
>>> num
['x', 'mama', 'n', 5, 'u', 'a', 'i', 'q', 'i', 88, 1, 2, 3, 4]

>>> num.remove ('u') # remove element
>>> num
['x', 'mama', 'n', 5, 'a', 'i', 'q', 'i', 88, 1, 2, 3, 4]

>>> num.reverse ()# reverse
>>> num
[4, 3, 2, 1, 88, 'i', 'q', 'i', 'a', 5, 'n', 'mama', 'x']





