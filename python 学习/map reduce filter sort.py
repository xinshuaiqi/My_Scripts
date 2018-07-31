
#http://blog.sina.com.cn/s/blog_6dbaeb9b0101dzle.html

# map 接受一个函数 和一个序列
#map(function_to_apply, list_of_inputs)
# use map in this format
# map(aFunction, aSequence)
# using map is equivalent to for loops


def f(x):
    return x*x
# apply a function to a list of things.
r = map(f,[1,2,3])
list(r)


l = [1,2,3,4,5]
sum(l)

## map 
#update all the items in a list
items = [1,2,3,4,5]
square = []
for i in items:
    square.append(i*i)
    
square


def sq(x): return x*x
a=map(sq, items)
a
list(a) # apply function sq to each element in items

# another map example
>>> pow(3,5)
243
>>> pow(2,10)
1024
>>> pow(3,11)
177147
>>> pow(4,12)
16777216
 
list(map(pow, [2, 3, 4], [10, 11, 12]))
[1024, 177147, 16777216]
>>> 




#reduce 的def必须有两个参数
from functools import reduce

def add(x,y):
    return x+y

qxs = reduce (add,[1,2,3,4,5])
'''
1+2, +3, +4, +5
'''
reduce(add, range(1, 11), 20) 

## reduce example

def mult (x,y):
    return x*y

def prod(List):
    return reduce(mult, List) 

print(prod([3,4,5]))


## filter 也是接受一个函数 和一个序列

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def is_odd(n):
    return n % 2 == 1
def lessthan10 (x):
    if (x <=10):
        return x 
L = range(100)
 
print(list(filter(is_odd, L)))
print(list(filter(lessthan10, L))) 

def not_empty(s):
    return s and s.strip()
print(list(filter(not_empty, ['A', '', 'B', None, 'C', '  '])))

##          filter function, which is equal to grep function

## now grep elements in an list

names = ['aet2000','ppt2000', 'aet2001', 'ppt2001']
qxs = filter(lambda x:'aet' in x, names)
print(qxs)


## with regex

import re
qxs = filter (lambda x: re.search(r'\d+',x),names)    ##not sure what 'lambda' mean here.
print (qxs)



import glob
glob.glob("*.txt")
# ['data.txt', 'list.txt', 'out.txt']





#sorted
sorted([36, 5, -12, 9, -21])
[-21, -12, 5, 9, 36]

#按照key 排序
sorted([36, 5, -12, 9, -21], key=abs)

#sort strings, irgnore biger and lower cases
sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower)





  
  
  
  
  
  
  