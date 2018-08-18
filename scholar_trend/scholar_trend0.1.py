# -*- coding: utf-8 -*-
"""
Google Scholar Trend

By Xinshuai Qi

Version: 0
"""

#
# Reference: https://docs.python.org/3.3/library/argparse.html
import argparse

parser = argparse.ArgumentParser(description='Google Scholar Trend.\n Example: XXXX')
parser.add_argument('-a',help='Find articles with All of the words')
parser.add_argument('-e',help='Find articles with Exact phrase of the words')
parser.add_argument('-l',help='Find articles with at Least one of the words')
parser.add_argument('-wo',help='Find articles WithOut the words')
parser.add_argument('-au',help='Find articles AUthored by')
parser.add_argument('-pu',help='Find articles PUblished by')
parser.add_argument('-fy',help='Find articles from year',type=int,required=True)
parser.add_argument('-ty',help='Find articles to(until) year',type=int,required=True)


args = parser.parse_args()

print(args.a)
print(args.fy)
print(args.ty)
#print(args.accumulate(args.integers))




# Now generate the google scholar search url 
args_a = args.a
args_fy = args.fy
args_ty = args.ty
'''
args_a = 'plant genome'
args_fy = 2008
args_ty = 2018
'''

import matplotlib.pyplot as plt

# generate results for the year range
def paper_all_years(args_a,args_fy,args_ty):
    l=[]
    y=[]
    for i in range (0,args_ty-args_fy):
        #print(args_fy+i,args_fy+1+i)
        
        y1 = args_fy+i
        y2 = args_fy+1+i
        #print(y1,y2)
        
        #print(url)
        out = paper_a_year(args_a,y1,y2)
        l.append(int(out))
        y.append(y1)
    print(l)
    plt.plot(y,l)
    
    
#phrase the url
# ref https://blog.csdn.net/c406495762/article/details/58716886
from urllib import request
import re

def paper_a_year(args_a, y1,y2):   
    #y1=2017
    #y2=2018
    #print('The total publications in the field of \"%s\" in %d is: ' % (args_a,y1))
    #generate the url 
    args_a = args_a.replace(' ','+')
    url = "https://scholar.google.com/scholar?as_q={0}&as_epq=&as_oq=&as_eq=&as_occt=any&as_sauthors=&as_publication=&as_ylo={1}&as_yhi={2}&hl=en&as_sdt=0%2C26" \
    .format(args_a,y1,y2) 
    
    # phrase the url
    req = request.Request(url)
    # pretend to access the website from iphone [google does not allow you to access directly through url]
    req.add_header('User-Agent', 'Mozilla/6.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/8.0 Mobile/10A5376e Safari/8536.25')
    with request.urlopen(req) as f:
        #print(f.read().decode('utf-8'))
        html=f.read().decode('utf-8')
        #print(html) 
        out = re.findall(r'About (\d+\,\d+) results',html) 
        out = out[0].replace(",",'').replace("'",'')
        print('{} - {} {}'.format(y1,y2,out))
        #print(out)
    return out

paper_all_years(args_a,args_fy,args_ty)

# test
'''
paper_a_year(args_a,2016,2017)
paper_a_year(args_a,2017,2018)
paper_a_year('pulmonary hypertension',2010,2018)

paper_all_years('crop domestication',2000,2015)
paper_all_years('maize genome',2000,2018)
paper_all_years('rice genome',2000,2018)
paper_all_years('polyploid',2000,2018)
paper_all_years('CRISPR/Cas9',2000,2018)
paper_all_years('pulmonary hypertension',2010,2018)
'''
