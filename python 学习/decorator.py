# -*- coding: utf-8 -*-
"""
Created on Mon May 28 21:08:53 2018

@author: EVRPA
"""

#decorator 装饰器
# 在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）


# https://www.zhihu.com/question/26930016
# normal function
def cal(x, y):
    result = x + y
    return result
cal(1,2)

# 装饰器
def report(func):
    print ("Finished")

def log(func):
    def wrapper(*arg, **kw):
        print ('Start %s' % func)
        return func(*arg, **kw)
    return wrapper

def log(func):
    print ('start'+ func)


# 带装饰器的function
@log
def cal(x, y):
    result = x + y
    return result

cal(1,2)

@log
def func_b(arg):
    print("lala")

func_b("a")

cal.__name__


########################
# @ 的作用是将被包裹的函数作为一个变量传递给装饰函数/类，
# 将装饰函数/类返回的值替换原本的函数

import time
def time_count(func):
  def wrap(*args,**kwargs):
      time_flag=time.time()
      temp_result=func(*args,**kwargs)
      print("Total time: " + str(time.time()-time_flag))
      return temp_result
  return wrap

@time_count    
def range_loop(a,b):
  for i in range(a,b):
      temp_result=a+b
  return temp_result

range_loop(1,4)


############## another example
m=3
n=2
func_dict={}
def register(operator):
  def wrap(func):
      func_dict[operator]=func
      return func
  return wrap

@register(operator="+")
def add(a,b):
  return a+b

@register(operator="-")
def sub(a,b):
  return a-b

@register(operator="*")
def mul(a,b):
  return a*b

@register(operator="/")
def div(a,b):
  return a/b

a=input('请输入 + - * / 中的任意一个\n')
func_dict[a](m,n)


# 常用装饰器
#https://github.com/orangle/blog/issues/10
def timefn(fn):
    def count_time(*args, **kwargs):
        st = time.time()
        res = fn(*args, **kwargs)
        ed = time.time()
        print ("@time: {0} tasks {1} secs".format(fn.func_name, str(ed-st)))
        return res
    return count_time

@timefn
def cal(x, y):
    result = x + y
    return result

# python 常用装饰器
# https://blog.csdn.net/flyDeDog/article/details/68925795
class Student(object):

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value

qxs=Student()
qxs.score=60
qxs.score


















########## liao xuefeng
# https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014318435599930270c0381a3b44db991cd6d858064ac0000
def now():
    print('2018-5-28')
    
f=now
f()

now.__name__


# add a decorator to this function 
def log(func):
    def wrapper(*args, **kw):
        print('now start function: %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper

@log
def now():
    print('2015-3-25')


now()
now2=log(now)
now2


# timer decorator

import time, functools
def timer(fn):
    print ('%s function executed in %s ms' % (fn.__name__, 10.24))
    return fn

@timer
def fast(x, y):
    t1=time.time()
    time.sleep(0.0012)
    t2=time.time()
    return x + y, 'the time cost is:',(t2-t1)
fast(3,3)    
    
@timer
def slow(x, y, z):
    time.sleep(0.1234)
    return x * y * z;




