# -*- coding: utf-8 -*-
"""
Created on Thu Jun 21 14:48:13 2018

@author: evrpa
"""

'''
https://blog.csdn.net/yatere/article/details/6655445

https://blog.csdn.net/qq_26886929/article/details/54091986
https://blog.csdn.net/qq_26886929/article/details/54141802


'''
# 日志级别大小关系为：
# CRITICAL > ERROR > WARNING > INFO > DEBUG > NOTSET，
# 当然也可以自己定义日志级别。
# 默认情况下，logging将日志打印到屏幕，日志级别为WARNING；
import logging  
logging.warning('Watch out!')  # will print a message to the console  
logging.info('I told you so')  # will not print anything  


logging.basicConfig(filename='example.log',level=logging.DEBUG)  
logging.debug('This message should go to the log file')  
logging.info('So should this')  
logging.warning('And this, too') 


# os.getcwd()


import logging  

def do_something():  
    logging.info('Doing something')  
     
def main():  
    logging.basicConfig(filename='do_something.log', level=logging.INFO)  
    logging.info('Started')  
    do_something()  
    logging.info('Finished')  
  
if __name__ == '__main__':  
    main()  
    
    
    
    
    






