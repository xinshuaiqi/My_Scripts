# -*- coding: utf-8 -*-
"""
Created on Mon May 28 21:08:53 2018

@author: EVRPA
"""

#decorator 装饰器
# 在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）
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




