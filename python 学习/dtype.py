



#########            type and type test
>>> type(1/3)
<type 'int'>

>>> type(1.2345)
<type 'float'>

>>> type('qxs')
<type 'str'>

>>> qxs='qixinshuai'
>>> type(qxs)
<type 'str'>

>>> type(type(qxs))
<type 'type'>


#type test
if type(qxs) ==str:
            print("yes",qxs,"is the tyep you expected")


### type covert
int(x)
float(x)
str(x)


#                           python "duixiangleixing"

#########                        number

#python math module
import math
math.pi
math.sqrt(16)  #ping fang gen

import random
random.random()  # 0 to 1
random.choice([1,3,5,7,9])  # chose from given value




#######                         string
S="songshanshan"
len(S)

S[0]
S[-1] ## last iterm
S[-3:]  ##  from last 3 to the end
S[:-3] ## print, except the last three
S + '123'



###          replace and find
S.find ('an')  #out put the match position
S.replace('g','k')

S.upper()
S.isalpha()  #  test if S is word
S.isdigit() #  test if S is digit

#                        splite into a list
A="good, abc, bad"
list=A.split(',')   
list

line = 'aaa,bbb,ccc,ddd\n'
line=line.rstrip() #        remove \n
line
######  list all the attribute   !!!!!!!
dir(S)      #        list all the atrribute of S, this is very helpful.

help(S.replace)


S = 'A\oB\oC'







#               list
family = ("mom", 'dad', 'dog', 'bro', 'sister')
family [2]# 调用list
family [-2] # 倒数第二个

renz = [ "EcoRI", "BamHI", "HindIII" ] 
print(renz)

L = [123, "sss", 3.14]
len(L)


###
N=(1,2,3)
sum(N)      # 6


##          add element to list
L2=L + [4,5,6]

L2.append("lalalal")  # add to the end
L2
L2.extend([7,8])
L2
L2 += [9]

#   delete
L2.pop(2)  #pop out the third element

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








##                  tuple       元组 一个不可改变的list, use () ， not []
T=(1,2,3,4,5,4,4)
T[0]
#check how many 4 in T
print(T.count(4))

#check index of 4
print(T.index(4))

help(tuple)







#A set is an unordered collection of items that contains no duplicates. 
'''
不可变 唯一
用于过滤重复项
'''

>>> set('TCAGTTAT')
{'A', 'C', 'T', 'G'}

L = list(set('TCAGTTAT'))	## unique
L
# set
# you can compare two sets
X = set ('qixinshuai')
Y ={'s','h','a','n'}
print(X,Y)  # show X Y
print(X&Y)  # shared element  intersection 
print (X-Y) # difference 
print(X|Y)  #union, 
if Y in X:
            print (Y)


			
			
			
			
			
			
			
			
			
			
			
##                  dictionary
#like hash in perl
D = {'food': 'bread',
     'number':'4',
     'color':'red'}   #use big bracket
D['food']

# dictionary Nesting 嵌套
rec = {'name': {'first':'Xinshuai','last':'Qi'},
       'job':['dev','mgr']
                }
print(rec['name']['first'])
print(rec['job'][0])

### add         key- value to dictionary
D['name']='qixinshuai'
print(D)

###  to check if key in the dictionary
print( 'name' in D)

#    or
if not 'qxs' in D:
    print('missing!')

if 'qxs' not in D:
    print('missing!')
    
## order keys in dictionary
ks = list(D.keys()) # extract keys in dic
# or 
ks = [*D]
ks
ks.sort() # sort them 
ks
for key in ks:
    print (key,'=>', D[key])

# alternative way to sor dic
for D[key] in sorted(D):
    print (key,'=>', D[key])
    
    
##   list all key

D={'a':1,
   'b':2,
   'c':3,
   'd':4
   }
   
K = list(D.keys())
V=list(D.values())

for i in K:
    print (i.strip("'\ "), "===>>>".strip('\''),D[i])








#       logic
## is 1 is a odd number
1 % 2 ==0   #   false
3  % 2 == 1 #   True
3>2



