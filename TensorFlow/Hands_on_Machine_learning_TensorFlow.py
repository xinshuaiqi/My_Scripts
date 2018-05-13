# -*- coding: utf-8 -*-
"""
Created on Mon Apr 30 11:54:02 2018

@author: qxs
"""

'''
Hands on machine learning notes qxs
+ 
https://github.com/MorvanZhou/Tensorflow-Tutorial/tree/master/tutorial-contents
+ tensor中文社区
http://www.tensorfly.cn/tfdoc/get_started/basic_usage.html
+ Hvass 教程
https://wizardforcel.gitbooks.io/tf-tut-hvass/content/01_Simple_Linear_Model_zh_CN/01_Simple_Linear_Model_zh_CN.html

'''

import tensorflow as tf




# create a Variable 
m1 = tf.constant([[2, 2]])
m2 = tf.constant([[3],[3]])



# place holder 
x1 = tf.placeholder(dtype=tf.float32, shape=None)
y1 = tf.placeholder(dtype=tf.float32, shape=None)
z1 = x1 + y1

x2 = tf.placeholder(dtype=tf.float32, shape=[2, 1])
y2 = tf.placeholder(dtype=tf.float32, shape=[1, 2])
z2 = tf.matmul(x2, y2)

xs = tf.placeholder(tf.float32, [None, 1])
ys = tf.placeholder(tf.float32, [None, 1])


with tf.Session() as sess:
    # when only one operation to run
    z1_value = sess.run(z1, feed_dict={x1: 1, y1: 2})

    # when run multiple operations
    z1_value, z2_value = sess.run(
        [z1, z2],       # run them together
        feed_dict={
            x1: 1, y1: 2,
            x2: [[2], [2]], y2: [[3, 3]]
        })
    print(z1_value)
    print(z2_value)



# Operation 
dot_operation = tf.matmul(m1, m2)



# Activation function in tf  
# https://github.com/MorvanZhou/Tensorflow-Tutorial/blob/master/tutorial-contents/204_activation.py
x = np.linspace(-5, 5, 200)

y_relu = tf.nn.relu(x)
y_sigmoid = tf.nn.sigmoid(x)
y_tanh = tf.nn.tanh(x)
y_softplus = tf.nn.softplus(x)

sess = tf.Session()
y_relu, y_sigmoid, y_tanh, y_softplus = sess.run([y_relu, y_sigmoid, y_tanh, y_softplus])

plt.plot(x, y_relu, c='red', label='relu')
plt.plot(x, y_sigmoid, c='red', label='sigmoid')
plt.plot(x, y_tanh, c='red', label='tanh')
plt.plot(x, y_softplus, c='red', label='softplus')



# / build a graph 
x = tf.Variable(3, name="x")
y = tf.Variable(4, name="y")
f = x*x*y + y + 2


# add layer 
''' or '''
def add_layer(inputs, in_size, out_size, activation_function=None):
    Weights = tf.Variable(tf.random_normal([in_size, out_size]))
    biases = tf.Variable(tf.zeros([1, out_size]) + 0.1)
    Wx_plus_b = tf.matmul(inputs, Weights) + biases
    if activation_function is None:
        outputs = Wx_plus_b
    else:
        outputs = activation_function(Wx_plus_b)
    return outputs

# add hidden layer 
# arguments: 'inputs', 'in_size', and 'out_size'
l1 = add_layer(xs, 1, 10, activation_function=tf.nn.relu)
# add output layer
prediction = add_layer(l1, 10, 1, activation_function=None)


# loss function, error between exp and obs
loss = tf.reduce_mean(tf.reduce_sum(tf.square(ys - prediction),
                     reduction_indices=[1]))
train_step = tf.train.GradientDescentOptimizer(0.1).minimize(loss)




# Innit all variables together 
init = tf.global_variables_initializer()
with tf.Session() as sess:
    init.run()
    result=f.eval()
print(result)


# interactive version
sess = tf.InteractiveSession()
init.run()
result=f.eval()
print(result)
sess.close()


init = tf.global_variables_initializer()
sess = tf.Session()
sess.run(init)



# run it 
# method 1
sess = tf.Session()
sess.run(x.initializer)
sess.run(y.initializer)
result = sess.run(f)
print(result)
sess.close()

sess = tf.Session()
result = sess.run(dot_operation)
print(result)
sess.close()


# A better approach
with tf.Session() as sess:
    x.initializer.run()
    y.initializer.run()
    result = f.eval()
    print(result)
    
for i in range(1000):     # repeat 1000 times
    # training
    sess.run(train_step, feed_dict={xs: x_data, ys: y_data})
    if i % 50 == 0:  # print every 50 steps
        print(sess.run(loss, feed_dict={xs: x_data, ys: y_data}))    



# graph============================

# defalut graph 
x1 = tf.Variable(1)
x1.graph is tf.get_default_graph()

# create a customized graph
graph = tf.Graph()
with graph.as_default():
    x2 = tf.Variable(2)
    
x2.graph is graph     # TRUE
x2.graph is tf.get_default_graph()      # FALSE


w = tf.constant(3)
x = w + 2
y = x + 5
z = x * 3
with tf.Session() as sess:
    print(y.eval()) # 10
    print(z.eval()) # 15



# linear regression  
# this code will run using GPU
import numpy as np
from sklearn.datasets import fetch_california_housing
housing = fetch_california_housing()

'''
housing.feature_names
housing.keys()
housing.data
housing.data.shape
'''

m, n = housing.data.shape
housing_data_plus_bias = np.c_[np.ones((m, 1)), housing.data]
X = tf.constant(housing_data_plus_bias, dtype=tf.float32, name="X")
y = tf.constant(housing.target.reshape(-1, 1), dtype=tf.float32, name="y")
XT = tf.transpose(X)
theta = tf.matmul(tf.matmul(tf.matrix_inverse(tf.matmul(XT, X)), XT), y)
with tf.Session() as sess:
    theta_value = theta.eval()    
    print(theta_value)















