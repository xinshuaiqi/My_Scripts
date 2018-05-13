# -*- coding: utf-8 -*-
"""
Created on Wed May 18 22:06:28 2016

@author: qxs

learn biopython

"""

from pylab import *

X = np.linspace(-np.pi, np.pi, 256,endpoint=True)
C,S = np.cos(X), np.sin(X)


plot(X,C)
plot(X,S)

show()



'''
三重引号表示一个多行的字符串。
'''
 



#
square=[] # add a empty list
for i in [1,2,3,4,5]:
    square.append(i+10)
print  ("\n", square)

for x in 'spam':  #
    print(x)

for x in range(1,10):
    print(x)

dna='atatatatatcggggcgcgcggc'
print (dna)
print( len(dna))

print( 'a' in dna)

#count(dna,'a')

#replace(dna, 'a', 'A')
print (dna[:-3]) #eecept the last three letters

EcoRI = 'gaattc'
BamHI = 'ggatcc'
HindIII = 'aagctt'




#                   collections  set
	sets
	sequences
	mapping
	steams
	



#           function
###
N=(1,2,3)
sum(N)      # 6


dna='atatatatatcggggcgcgcggc'
print (dna)
print( len(dna))

print( 'a' in dna)

#count(dna,'a')

#replace(dna, 'a', 'A')
print (dna[:-3]) #eecept the last three letters

EcoRI = 'gaattc'
BamHI = 'ggatcc'
HindIII = 'aagctt'


dna='atatatatatcggggcgcgcggc'
print (dna)
print( len(dna))

print( 'a' in dna)
