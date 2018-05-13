# -*- coding: utf-8 -*-
"""
Created on Wed Mar  1 16:10:27 2017

@author: qxs
The purpose of this script is find subfunctionalized B. rapa gene
idea from Mike

Mike: Any progress on running the asymmetric protein evolution analyses for the B. rapa data?
We need this and the coalescent simulations that Dan Oliver is working on to finish the Nat Gen ms and
explain the results.
We also need to estimate Pis and Pin rather than just Pi.


"""

import os
os.chdir('C:\\Users\\qxs\\Desktop')

'''
d = {}
with open("GDEtest.txt") as f:
    for line in f:
       (key, val) = line.split('\t',1) # read each line, use the 1st , as split
       val=val.split('\t')  # for the value part, convert to a list
       if ',' in val[1]:    # for the Bra gene name, if it has multiple gene,
                            # = at least one , then convert it into a list
           val[1]=val[1].split(',')
       d[key] = val
'''    

 
#v2 read GDE file to a dict, use Bra gene name as keys
d = {}
with open("GDEtril.txt") as f:
    for line in f:
       (lnum, x, key, val) = line.split('\t',3) # read each line, use the 1st , as split
       val=val.split('\t')  # for the value part, convert to a list
       d[key] = val
       #print(key,val)
       # for the Bra gene name, if it has multiple gene,
       # = at least one , then convert it into a list
       if ',' in key:                                
           key=key.split(',')
           for i in range(len(key)):
               d[key[i]]=val
''''
#print the dict
from pprint import pprint
pprint(d)

for keys, values in d():
    print(keys,values)
'''

LMF=open("LMF.txt").readlines()
##
len(LMF)
for i in range(0,len(LMF)):
    #print (LMF[i])
    list_LMF=LMF[i].split("\t")
    LF=list_LMF[0]
    MF1=list_LMF[1]
    MF2=list_LMF[2]
    MF2=MF2.rstrip()  # remove the \n in the end of the line.
    #for empty genes, mark it as NA
    if LF in d: 
        dLF=d[LF][5]
    else: 
        LF="NA"
        dLF="NA"
    if MF1 in d: dMF1=d[MF1][5]
    else: 
        MF1='NA'
        dMF1="NA"
    if MF2 in d: dMF2=d[MF2][5]
    else: 
        MF2='NA'
        dMF2="NA"
    #only when you have at least two genes for each paleolog group. keep it.
    if ((LF=='NA')+(MF1=='NA')+(MF2=='NA')<=1):
        out=("{}\t{}\t{}\t{}\t{}\t{}\n".format(LF,dLF,MF1,dMF1,MF2,dMF2))
        print(out)
        f = open("outtril.txt", "a")
        f.write(out)
        f.close()

#Finished.


       