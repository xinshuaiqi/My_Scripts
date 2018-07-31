# -*- coding: utf-8 -*-
"""
Created on Thu Apr 19 14:10:18 2018
==NCBI plant genome crawler==
@author: qxs
"""

from bs4 import BeautifulSoup
from urllib.request import urlopen
import re
import requests
import webbrowser

def url_generator():
    '''
    Load the saved NCBI genome file (use 'Send to: file' function after search 
    on https://www.ncbi.nlm.nih.gov/genome).
    Then generate a list of url for each interested genome
    '''
    url_list=[]
    with open ("genome_result.txt") as f:
        lines = f.readlines()
        for l in lines:
            if re.match(r'\d+\.(.*)',l):
                species = l.split('. ')[1]
                #print(species)
                species = species.replace(' ','+')
                url ="https://www.ncbi.nlm.nih.gov/genome/?term=%s" % species
                #print(url)
                url_list.append(url)
    Length = len(url_list)
    print('\n==Note==\nTotal length of this url list is: ', Length)
    return url_list

ulist = url_generator()
 
url = 'https://www.ncbi.nlm.nih.gov/genome/?term=Arabidopsis+thaliana\n'

req = requests.get(url.replace(r'\n',''))
print(req.url)
req.content.

species = 
genome_size = float(re.findall(r"median total length \(Mb\)\: (\d+.\d+)",str(req.content))[0])



 










l= "287. Arabidopsis thaliana"
l.replace(r'\d+\','')

url ="https://www.ncbi.nlm.nih.gov/genome/?term=Embryophyta"

soup = BeautifulSoup(url, features='lxml')



