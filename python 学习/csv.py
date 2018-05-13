# -*- coding: utf-8 -*-
"""
Created on Wed Aug 24 13:42:31 2016

@author: qxs
"""
import os
os.chdir("E:\\GoogleDrive\\My_Scripts\\python 学习")


import csv
with open('stocks.csv') as f:
    f_csv = csv.reader(f)  # f_tsv = csv.reader(f, delimiter='\t')
    headers = next(f_csv)
    print (headers)
    for row in f_csv:
        print (row)
        print (row[0])
        
        
import csv
with open('stocks.csv', 'r') as csvf:
    our_reader = csv.reader(csvf)
    names = [row for row in our_reader]
    print(our_reader)        