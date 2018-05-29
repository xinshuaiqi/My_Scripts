# -*- coding: utf-8 -*-
"""
Created on Wed Aug 24 13:13:09 2016

@author: qxs

多线程

"""
一个任务就是一个进程（Process）
进程内的这些“子任务”称为线程（Thread）
一个进程至少有一个线程,像Word这种复杂的进程可以有多个线程



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
     
printNumber(3)


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
 
    
    
    
    
    
     
from multiprocessing import Process
import os

# 子进程要执行的代码
def run_proc(name):
    print('Run child process %s (%s)...' % (name, os.getpid()))

if __name__=='__main__':
    print('Parent process %s.' % os.getpid())
    p = Process(target=run_proc, args=('test',))
    print('Child process will start.')
    p.start()
    p.join()
    print('Child process end.')
    
    





# process pool
from multiprocessing import Pool
import os, time, random

def long_time_task(name):
    print('Run task %s (%s)...' % (name, os.getpid()))
    start = time.time()
    time.sleep(random.random() * 3)
    end = time.time()
    print('Task %s runs %0.2f seconds.' % (name, (end - start)))

if __name__=='__main__':
    print('Parent process %s.' % os.getpid())
    p = Pool(4)
    for i in range(5):
        p.apply_async(long_time_task, args=(i,))
    print('Waiting for all subprocesses done...')
    p.close()
    p.join()
    print('All subprocesses done.')
    
    
    
    