# -*- coding: utf-8 -*-
"""
Created on Sat Mar  4 22:51:12 2017

@author: qxs
https://www.youtube.com/watch?v=mf7ktBLwaJs&list=PLXO45tsB95cKKyC45gatc8wEc3Ue7BlI4&index=3


"""

import numpy as np


a = np.arange(15).reshape(3, 5)
a
np.array(a,dtype = np.float)

b = np.array([[1,2,3],[4,5,6]],dtype=np.float)  #np.int; np.float; complex
c = np.empty((3,4)) # create a empty 
c


a.ndim  #2
a.shape # x*5
a.reshape(3,2)  #改变格式
a.size  # 15
a.dtype # int32


# NumPy - 数据类型

# NumPy 支持比 Python 更多种类的数值类型。 下表显示了 NumPy 中定义的不同标量数据类型。

'''
序号	数据类型及描述
1.	bool_ 存储为一个字节的布尔值（真或假）
2.	int_ 默认整数，相当于 C 的long，通常为int32或int64
3.	intc 相当于 C 的int，通常为int32或int64
4.	intp 用于索引的整数，相当于 C 的size_t，通常为int32或int64
5.	int8 字节（-128 ~ 127）
6.	int16 16 位整数（-32768 ~ 32767）
7.	int32 32 位整数（-2147483648 ~ 2147483647）
8.	int64 64 位整数（-9223372036854775808 ~ 9223372036854775807）
9.	uint8 8 位无符号整数（0 ~ 255）
10.	uint16 16 位无符号整数（0 ~ 65535）
11.	uint32 32 位无符号整数（0 ~ 4294967295）
12.	uint64 64 位无符号整数（0 ~ 18446744073709551615）
13.	float_ float64的简写
14.	float16 半精度浮点：符号位，5 位指数，10 位尾数
15.	float32 单精度浮点：符号位，8 位指数，23 位尾数
16.	float64 双精度浮点：符号位，11 位指数，52 位尾数
17.	complex_ complex128的简写
18.	complex64 复数，由两个 32 位浮点表示（实部和虚部）
19.	complex128 复数，由两个 64 位浮点表示（实部和虚部）
'''


#change dimention
a = np.arange(10,24,1); print (a)  # 从10 到23， step = 1

a = a.reshape(2,4,3); print(a)

####运算

a = np.array([10,20,30,40])
b = np.arange(4);print(b)

a
b
c=a-b

c= b**2
b==3
print(b==3)

#randon number 0 to 1
a = np.random.random((2,4)) # o,1 2 rows, four columns
a
print(a)

np.sum(a)
np.min(a)
np.max(a)

np.min(a,axis=1)  # 1 row, 0 column

np.average(a)
np.median(a)

np.sort(a)  # sort each row
np.transpose(a) # row to column convert

np.clip(a,0.4,0.6) # if <4, then =4, if >6, then =6; if 4<x<6; keep it as it is.

### index array
a[1] #one dimention,
a[1]  #two dimention, row 2
a[0,0]
a[0][0]
a[0,:]
a[:,0:1]

for row in a:
    print(row[1])

for item in a:
    print (item[0])

# merge array

a = np.array([1,1,1,1])
b = np.array([2,2,2,2])
c = np.vstack((a,b))

a.shape
c.shape

d = np.hstack((a,b))
d.shape

e = np.concatenate((a,b,b,a),axis = 0) # multiple array add
e

#split array

a = np.arange(12).reshape((3,4))
print(a)

b = np.split(a,2,axis=1) # 从中间划竖线分割。
b

#不对等分割 
c = np.array_split(a,3,axis=1)
print(c)
d = np.vsplit(a,3)

# numpy 里面，两个矩阵是相关联的，改一个变量，也会改别的。
a
b = a
a[0,0] =100
b is a
b

b = a.copy(a) # deep copy, copy but NOT linked.


A = np.arange(2,14).reshape((3,4)) 
A
np.argmin(A) 
np.argmax(A)

A=A.flatten() # 2D to 1D, one row 
A[0]
A[11]




















