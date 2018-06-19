#

import multiprocessing as mp
import threading as td
import time 

def job(a,b):
    j = 0
    for i in range(1000):
        j = j+i
        print(j,end = ' ')
        time.sleep(0.3)
    # can not use return  
#job()       

  
   
if __name__ == '__main__':
    p1 = mp.Process(target = job, args =('1','2')) # 如果是一个值要写 b, 
    p1.start()
    p1.join()
    
    
    q = mp.Queue()    
    
def multiprocess():
    p1 = mp.Process(target = job, args =(a,)) # 如果是一个值要写 a, 
    p2 = mp.Process(target = job, args =(b,))
    p1.start()
    p2.start()
    p1.join()
    p2.join()

if __name__ == '__main__':
    multiprocess() 
    
    
t1 = td.Tread(target = job, args = (a))
p1 = mp.Process(target = job, args =(b))

t1.start()
p1.start()

t1.join()
p1.join()


import multiprocessing as mp

def job(q):
    res = 0
    for i in range(1000):
        res += i+i**2+i**3
    q.put(res) # queue

if __name__ == '__main__':
    q = mp.Queue()
    p1 = mp.Process(target=job, args=(q,))
    p2 = mp.Process(target=job, args=(q,))
    p1.start()
    p2.start()
    p1.join()
    p2.join()
    res1 = q.get()
    res2 = q.get()
    print(res1+res2)

















from multiprocessing import Process

def f(name):
    print('hello', name)

if __name__ == '__main__':
    p = Process(target=f, args=('bob',))
    p.start()
    p.join()
    





### multiple threads 
#!/usr/bin/python3


### use _thread 老方法 不推荐了
import _thread
import time

# 为线程定义一个函数
def print_time( threadName, delay):
   count = 0
   while count < 5:
      time.sleep(delay)
      count += 1
      print ("%s: %s" % ( threadName, time.ctime(time.time()) ))

# 创建两个线程
try:
   _thread.start_new_thread( print_time, ("Thread-1", 2, ) )
   _thread.start_new_thread( print_time, ("Thread-2", 4, ) )
except:
   print ("Error: 无法启动线程")

while 1:
   pass

### threading
#!/usr/bin/python3

import threading
import time

exitFlag = 0

class myThread (threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
    def run(self):
        print ("开始线程：" + self.name)
        print_time(self.name, self.counter, 5)
        print ("退出线程：" + self.name)

def print_time(threadName, delay, counter):
    while counter:
        if exitFlag:
            threadName.exit()
        time.sleep(delay)
        print ("%s: %s" % (threadName, time.ctime(time.time())))
        counter -= 1

# 创建新线程
thread1 = myThread(1, "Thread-1", 1)
thread2 = myThread(2, "Thread-2", 2)

# 开启新线程
thread1.start()
thread2.start()
thread1.join()
thread2.join()
print ("退出主线程")


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


##############################################################################    

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
    time.sleep(1)
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
 
    
    
    
    
    
 # liao xue feng   
# https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/001431927781401bb47ccf187b24c3b955157bb12c5882d000
    
     
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
    
    
    
    
    

 





































