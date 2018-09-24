# -*- coding: utf-8 -*-
"""
Created on Sun Sep  2 07:55:03 2018

@author: qxs
"""

 # recursion

def mysum(L):
    #print(L)
    if not L:
        return 0
    else:
        return (L[0] + mysum(L[1:]))
        print(L[0])
        
mysum([1,2,3,4,5])


# for loop 
L=[1,2,3,4,5]

def SS(L):
    s = 0
    for x in L:
        s = s + x
    return s
SS(L)
