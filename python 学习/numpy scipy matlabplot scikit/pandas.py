# -*- coding: utf-8 -*-
"""
Created on Sun Mar  5 16:35:52 2017

@author: qxs
"""

#pandas
# 更像字典，有编号
import pandas as pd
import numpy as np

# input and output
read_csv
read_excel
read_html
read_pickle 
data = pd.ExcelFile(file)


to_csv
to_excel

import os
os.chdir('E:\\GoogleDrive\\My_Scripts\\python 学习\\numpy scipy matlabplot scikit')

#input
data = pd.read_csv("..\\student.csv",sep=",",header=None, comment="#",na_values=[''])
data
data.ID
data.iloc[:,2]
#output
data.to_pickle('student2.pickle')
data.to_csv('student2.csv')





				############## Series 

				s =pd.Series([1,3,6,np.nan, 44,1]) # list
				print(s)

				dates = pd.date_range('20160101',periods = 6)
				print (dates)

				# index = row name, columns names
				df = pd.DataFrame(np.random.randn(6,4),index=dates, columns = ['A','B','C','D'])
				print(df)
				df

				df = pd.DataFrame(np.random.randn(6,4))
				print(df)

# 一次定义一列
df2 =pd.DataFrame({'A': 1.0,
                  'B':pd.Timestamp("20170101"),
                  'C':pd.Categorical(["test"])})
print(df2)                 



df.head()
df.tail()

                  
df2.dtypes    

df2=pd.DataFrame(np.arange(24).reshape(4,6))
df2.index # row number
df.index=['AA','BB',"CC",'DD','EE','FF']

df2.columns    # column
df.columns =['A','B',"C",'D']

df2.values

df2.describe() # summary 

df2[:][0].value_counts()
    
df2.T # row and column convert
df2.sort_index(axis=1,ascending = False)  # sort by column; revise order

df2.sort_values(by='E') # sort by specific column

# pandas index.

dates=pd.date_range('20170301',periods=6)
df = pd.DataFrame(np.arange(24).reshape((6,4)),index=dates,columns=['A','B','C','D'])
df
print(df)






###########  Index table
df['A']
df.A

df[0:3]
df.iloc[0:3,[1]]

# selected by label: loc
df.loc['20170301']

# select by position: iloc  index loc

df.iloc[0,1]  # o row, column 1

# select by label and position, mixed selection, ix
df.ix[:3,['A','C']]


# select by boolean indexing 
df[df.A>8]
    
    
    
    
#### 赋值
df.iloc[2,2]=1111
df
df.B[df.A>4]=0

# add a new column
df['F']=np.nan  
df['E']=pd.Series([1,2,3,4,5,6],index=dates) # make sure you use the same index/row name






# NaN
dates = pd.date_range('20130101', periods=6)
df = pd.DataFrame(np.arange(24).reshape((6,4)),index=dates, columns=['A','B','C','D'])
df.iloc[0,1] = np.nan
df.iloc[1,2] = np.nan

# df.dropna  # remove lines with NaN
df.dropna(axis=0,how='any') # how ={'any','all'} 
  # 0: 对行进行操作; 1: 对列进行操作

 # remove row, when any NaN, or all NaN. 
df.fillna(value=0) # replace Nan with 0

df.isnull() # whether has NaN 
np.any(df.isnull()) == True # at least one NaN?




# pandas plot 
import matplotlib.pyplot as plt

# plot 1 dimention
data =pd.Series(np.random.randn(1000))
data = data.cumsum() # accumulate sum
data.plot()
data.plot.bar()
plt.show()

# plot x,y

data2 = pd.DataFrame(np.random.randn(100,4)  )
data2.plot()


data2.plot.scatter(x='A',y='B',color='Red',label='Class')
data2.plot.hist()
data2.plot.box()
data2.plot.kde
data2.plot.area
data2.plot.hexbin
data2.plot.pie
data2.plot.bar    

















    
    
    
    
    