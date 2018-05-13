# -*- coding: utf-8 -*-
"""
Created on Thu Aug 25 12:55:27 2016

@author: qxs
"""

#使用NumPy来载入csv文件

import numpy as np
import urllib
# url with dataset
url = "http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data"
# download the file
raw_data = urllib.urlopen(url)
# load the CSV file as a numpy matrix
dataset = np.loadtxt(raw_data, delimiter=",")
# separate the data from the target attributes
X = dataset[:,0:7]
y = dataset[:,8]

#
from sklearn import datasets
iris = datasets.load_iris()
digits = datasets.load_digits()
iris
iris.data
iris.feature_names
iris.target

#SVM 把这个拟合（评估）函数作为一个黑箱
from sklearn import svm
clf=svm.SVC(gamma=0.001,C=100.)

clf.fit(iris.data[:-1], iris.target[:-1])  
'''
Out[113]: 
SVC(C=100.0, cache_size=200, class_weight=None, coef0=0.0,
  decision_function_shape=None, degree=3, gamma=0.001, kernel='rbf',
  max_iter=-1, probability=False, random_state=None, shrinking=True,
  tol=0.001, verbose=False)
  '''
clf.predict(iris.data[-1])


#plot
import matplotlib.pyplot as plt

iris = datasets.load_iris()


plt.figure(1, figsize=(3, 3))
plt.imshow(iris.images[-1], cmap=plt.cm.gray_r, interpolation='nearest')
plt.show()



## general linear model
from sklearn import linear_model
qxs = linear_model.LinearRegression()
x = [[0, 0], [1, 1], [2, 2]]
y =[0, 1, 2]
qxs.fit(x,y)
qxs.coef_
##array([ 0.5, 0.5])


# 最小二乘法
from sklearn import linear_model
qxs = linear_model.Ridge(alpha = .05)
qxs.fit(x,y)
qxs.coef_
qxs.intercept_


##Linear Regression Example
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets, linear_model

# Load the diabetes dataset
diabetes = datasets.load_diabetes()

# Use only one feature
diabetes_X = diabetes.data[:, np.newaxis, 2]

# Split the data into training/testing sets
diabetes_X_train = diabetes_X[:-20]
diabetes_X_test = diabetes_X[-20:]

# Split the targets into training/testing sets
diabetes_y_train = diabetes.target[:-20]
diabetes_y_test = diabetes.target[-20:]

# Create linear regression object
regr = linear_model.LinearRegression()

# Train the model using the training sets
regr.fit(diabetes_X_train, diabetes_y_train)

# The coefficients
print('Coefficients: \n', regr.coef_)
# The mean square error
print("Residual sum of squares: %.2f"
      % np.mean((regr.predict(diabetes_X_test) - diabetes_y_test) ** 2))
# Explained variance score: 1 is perfect prediction
print('Variance score: %.2f' % regr.score(diabetes_X_test, diabetes_y_test))

# Plot outputs
plt.scatter(diabetes_X_test, diabetes_y_test,  color='black')
plt.plot(diabetes_X_test, regr.predict(diabetes_X_test), color='blue',
         linewidth=3)

plt.xticks(())
plt.yticks(())

plt.show()












