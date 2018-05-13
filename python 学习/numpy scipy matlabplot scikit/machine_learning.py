# -*- coding: utf-8 -*-
"""
Created on Sun Mar  5 21:52:52 2017

@author: qxs
"""
#machine learning
#   supervised learning, 有数据标签include 神经网络
#   un-supervised learning. 没有数据和标签
#   semi-supervised learning. 用少量有标签样本
#   reinforcement learning  从经验中总结# 自我学习。在陌生环境。 alfa go
#   genetic algorithem # 适者生存  按照进化理论，

#scikit learn

import numpy as np
from sklearn import datasets
from sklearn.cross_validation import train_test_split 
from sklearn.neighbors import KNeighborsClassifier


iris =datasets.load_iris()
iris_X = iris.data
iris_Y = iris.target

iris_X[:2,:]
iris_Y

# split training and test data
X_train, X_test, Y_train, Y_test=train_test_split(
iris_X,iris_Y,test_size = 0.3)

print(Y_test)

knn = KNeighborsClassifier() # use knn
knn.fit(X_train,Y_train) # training

print(knn.predict(X_test))
print(Y_test)


##2 
import numpy as np
from sklearn import datasets
from sklearn.linear_model import LinearRegression

loaded_data= datasets.load_boston()
data_X = loaded_data.data
data_Y = loaded_data.target

model =LinearRegression()
model.fit(data_X, data_Y)

model.predict(data_X[:4,:]) 















