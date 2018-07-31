# -*- coding: utf-8 -*-
"""
Created on Thu Jul 12 08:19:55 2018

@author: evrpa
"""

# env 
# https://blog.csdn.net/csdn15698845876/article/details/73012581

import os

# get env names
for key in os.environ.keys():
    print(key)
    
# get value for each env key
dir=os.environ.get('path')
print(dir)

# set env 
# 注意:当前设置的环境变量只是在本程序中生效，不是永久更新
import os
dir="D:\LearnTool"
os.environ['datapath']=dir
print(os.environ.get('datapath'))



# bash: export PYTHONPATH=/home/evrpa/non-prime-git/script
# bash:  echo $PYTHONPATH
import sys
sys.path









