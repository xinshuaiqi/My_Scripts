# -*- coding: utf-8 -*-
"""
Created on Wed Aug 24 13:13:09 2016

@author: qxs

多线程

"""

# Code to execute in an independent thread
import time
def countdown(n):
    while n > 0:
        print('T-minus', n)
        n -= 1
        time.sleep(5)

# Create and launch a thread
from threading import Thread
t = Thread(target=countdown, args=(10,))
            '''在后台运行
            t = Thread(target=countdown, args=(10,), daemon=True)   
            '''
t.start() #开始运行


#程序运行的时候，检测是否alive
if t.is_alive():
    print('Still running')
else:
    print('Completed')


    