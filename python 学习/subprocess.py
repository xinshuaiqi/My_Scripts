# -*- coding: utf-8 -*-
"""
Created on Thu Jun 21 15:06:49 2018

@author: evrpa
"""


# http://python.jobbole.com/81517/
import subprocess
p = subprocess.Popen("app2.exe", stdin = subprocess.PIPE, /
    stdout = subprocess.PIPE, stderr = subprocess.PIPE, shell = False)
 
p.stdin.write('3/n')
p.stdin.write('4/n')
print p.stdout.read()
 
#---- 结果 ----
input x: 
input y: 
3 + 4 = 7