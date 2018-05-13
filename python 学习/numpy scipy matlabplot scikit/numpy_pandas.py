# -*- coding: utf-8 -*-
"""
Created on Fri Dec 29 21:26:18 2017

@author: qxs
"""


import numpy as np
array = np.array([[1,2,3],[2,3,4]])  #列表转化为矩阵
print(array)


array.ndim # row number
array.shape # dim()
array.size # total elements

# dtype 
a = np.array([2,23,4],dtype=np.int)
a = np.array([2,23,4],dtype=np.int32)
a = np.array([2,23,4],dtype=np.float)
a = np.array([2,23,4],dtype=np.float32)
a.dtype

a = np.empty((3,4)) # 数据为empty，3行4列

a = np.arange(12)
a
a = a.reshape((3,4))

# 计算
a.mean()
a.median()
a.sum()
a.sort()
a.transpose()

# index
a
a[2,2]
a[2] # row 3
a[2][2] # col 3









# pandas

import pandas as pd
import numpy as np

# read data
data = pd.read_csv('students.csv')



# Series 
s = pd.Series([1,3,6,np.nan,44,1])
print(s)   # index :  value


# dataframe
dates = pd.date_range('20160101',periods=6)
df = pd.DataFrame(np.random.randn(6,4),index=dates,columns=['a','b','c','d'])
print(df)

df1 = pd.DataFrame(np.arange(12).reshape((3,4)))
df1

# df index
df
df['b']
df.b
df[0:3]
df.index  # row names 
df.columns  # col names
df.values
df.describe() # summary 
df.T   # table transpose

# according to label
df.loc[:,'b']
df.loc['20160101':['a','b']]

# according to position
df.iloc[1][1]




# sort
df.sort_index(axis=1,ascending =False)
df.sort_values(by='b')
df






























