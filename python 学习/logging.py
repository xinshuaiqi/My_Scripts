# -*- coding: utf-8 -*-
"""
Created on Thu Jun 21 14:48:13 2018

@author: evrpa
"""

'''
https://blog.csdn.net/yatere/article/details/6655445

https://blog.csdn.net/qq_26886929/article/details/54091986
https://blog.csdn.net/qq_26886929/article/details/54141802

python logging 替代print 输出内容到控制台和重定向到文件
https://blog.csdn.net/z_johnny/article/details/50740528
'''
# 日志级别大小关系为：
# CRITICAL > ERROR > WARNING > INFO > DEBUG > NOTSET，
# 当然也可以自己定义日志级别。
# 默认情况下，logging将日志打印到屏幕，日志级别为WARNING；

import logging  
logging.basicConfig(level=logging.DEBUG,  
                    format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',  
                    datefmt='%a, %d %B %Y %H:%M:%S',  
                    filename='C:\\Users\\evrpa\\Downloads\\test.log',  
                    filemode='w')  

cmd="'ls all my files'"
logging.info(cmd)

logging.debug('debug message')  
logging.info('info message')  
logging.warning('warning message')  
logging.error('error message')  
logging.critical('critical message')  
 
# os.getcwd()

"""
可见在logging.basicConfig()函数中可通过具体参数来更改logging模块默认行为，可用参数有
filename：   用指定的文件名创建FiledHandler（后边会具体讲解handler的概念），这样日志会被存储在指定的文件中。
filemode：   文件打开方式，在指定了filename时使用这个参数，默认值为“a”还可指定为“w”。
format：      指定handler使用的日志显示格式。
datefmt：    指定日期时间格式。
level：        设置rootlogger（后边会讲解具体概念）的日志级别
stream：     用指定的stream创建StreamHandler。可以指定输出到sys.stderr,sys.stdout或者文件，默认为sys.stderr。
                  若同时列出了filename和stream两个参数，则stream参数会被忽略。

format参数中可能用到的格式化串：
%(name)s             Logger的名字
%(levelno)s          数字形式的日志级别
%(levelname)s     文本形式的日志级别
%(pathname)s     调用日志输出函数的模块的完整路径名，可能没有
%(filename)s        调用日志输出函数的模块的文件名
%(module)s          调用日志输出函数的模块名
%(funcName)s     调用日志输出函数的函数名
%(lineno)d           调用日志输出函数的语句所在的代码行
%(created)f          当前时间，用UNIX标准的表示时间的浮 点数表示
%(relativeCreated)d    输出日志信息时的，自Logger创建以 来的毫秒数
%(asctime)s                字符串形式的当前时间。默认格式是 “2003-07-08 16:49:45,896”。逗号后面的是毫秒
%(thread)d                 线程ID。可能没有
%(threadName)s        线程名。可能没有
%(process)d              进程ID。可能没有
%(message)s            用户输出的消息
"""


 

# 两个logger files
def setup_logger(logger_name, log_file, level=logging.INFO):
    l = logging.getLogger(logger_name)
    formatter = logging.Formatter('%(message)s')
    fileHandler = logging.FileHandler(log_file, mode='w')
    fileHandler.setFormatter(formatter)
    streamHandler = logging.StreamHandler()
    streamHandler.setFormatter(formatter)

    l.setLevel(level)
    l.addHandler(fileHandler)
    l.addHandler(streamHandler)    


txtName="preprocessing"

setup_logger('log1', txtName+"txt")
setup_logger('log2', txtName+"small.txt")
logger_1 = logging.getLogger('log1')
logger_2 = logging.getLogger('log2')



logger_1.info('111messasage 1')
logger_2.info('222ersaror foo')




    
    
    






