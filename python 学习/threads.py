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


    
    
## loop multiprocessing   
#http://sebastianraschka.com/Articles/2014_multiprocessing.html
import time
from multiprocessing import Pool

def printNumber(N):
    print("I am using CPU", N,"good")
    time.sleep(2)
    out = (str(N)+' g_ooo_d')
    return out
     
#printNumber(3)


if __name__ == '__main__':
    array = [1,2,3]
    p=Pool(4)
    result= p.map(printNumber,array)
    print(result)
    #p.start()
    #p.join()

# or    
if __name__ == '__main__':
    with Pool(5) as p:
        print(p.map(printNumber, [1, 2, 3]))        

    