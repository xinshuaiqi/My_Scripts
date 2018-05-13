# -*- coding: utf-8 -*-
"""
Created on Wed Dec  6 14:31:31 2017
# grep specific rows from a doc 

@author: qxs
"""



#read the table
import os 
import pandas as pd


# os.getcwd()
# change the following settings
os.chdir("/home/qxs/data/From Ken Batai") 
input = "170Pheno_qxs.csv"  # original full dataset
list = "PAHUCSD.fam"    # one colunm in this file should be used as selection index

# change the header setting to 0 or None as needed
inputset = pd.read_csv(input,sep=',',header=(0))
inputset.head()

listset = pd.read_csv(list,sep=' ',header=None)
listname = listset.iloc[:,0]
#print(listname)

# here I used the grep function, so make sure you run this script under linux env
for i in range(0,len(listname)):
    #print(inputset.loc[inputset[['Client Sample ID']] == listname[i]])
    
    # replace out as your output file name
    cmd =("grep ',{0},' {1} >> out").format(listname[i],input)    
    os.system(cmd)    

print ("Finished!!!")    
