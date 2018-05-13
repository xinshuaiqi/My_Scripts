# -*- coding: utf-8 -*-
"""
Created on Tue May 24 15:04:55 2016

@author: qxs

to calculate MK test from snpeff output file

you need to use the output file from snpEff as input for this script, xxx.vcf
you also need to sort the individuals in the pop and individuals in the outgroup in order
for example: sample 8:150   are in group
             sample 151:152 are outgroups
you need to change these numbers accordingly

version 1.0 # May 25 2016
5 26 2016: fixed the thri-allele problem, 1/2 2/2

v1.1: set inital value of dn ds pn ps to 0.001, avoild -inf problem
      also allow heter loci, 0/1 exist, to avoid empty call of fixed dn ds between population.
      save the alfa as two dicimal by round(alfa,2)
      make sure use " 11" ___the space is the bug  
        
v1.2: add stats of alfa  Sun May 29 08:13:50 2016        

v1.3: add fisher exact test to my results. G test is also available as well

v2 for ch   snp_chin_ole.DP10.MQ30.snpEff temp2.txt



        
contact:qxs718@126.com
"""

# read the file 
import os
'''
#set up the working dir 
'''
os.chdir('C:\\Users\\qxs\\Desktop\\snpeff2MKtest')
import fileinput
import re #regex

#step 1  read the vcf file, without header line
# extract the useful information from the file
# save to temp1.txt


os.remove('temp_ch.txt')
f=open ('temp_ch.txt','a')  # open output file
#f.write("#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	individuals..."+"\n")
'''
set up the input file
'''


#for line in fileinput.input(['test.vcf']):
for line in fileinput.input(['snp_chin_ole.DP10.MQ30.snpEff.vcf']):    
    #first replace snp info of each individual to a simple way
    # "0/0:0,3,39:1:0" to 00
    #line=str(line)
    #line=re.sub('\#.*\\n','',line)
    if not line.startswith('#'):
        line=str(line)
        line=re.sub('0\/0\:\d+\,\d+\,\d+(\,\d+\,\d+\,\d+)?\:\d+\:\d+','00',line)
        line=str(line)
        line=re.sub('0\/1\:\d+\,\d+\,\d+(\,\d+\,\d+\,\d+)?\:\d+\:\d+','01',line)
        line=str(line)
        line=re.sub('1\/1\:\d+\,\d+\,\d+(\,\d+\,\d+\,\d+)?\:\d+\:\d+','11',line)
        line=str(line)
        line=re.sub('\.\/\.\:\d+\,\d+\,\d+(\,\d+\,\d+\,\d+)?\:\d+\:\d+','..',line)
        #print(line)
    
        #read each line twice, split in different ways
        line1=str(line)
        line1=line1.split("\t")
          
        line2=str(line)
        line2=line2.split("|")
    
        '''
        line1 0:8 
        0     1     2  3      4     5    6      7            8          9:
        CHROM	 POS 	ID	REF 	ALT 	QUAL FILTER	INFO(snpEff)	 FORMAT     all the individuals
    
        line2     
        0                1       2     3         4        ...
        original_info   snpeff   XX   gene_id  gene_id    ...
    
        Now check if this snp is a dn or ds, if so    
        print out what you need:    
        '''
        if ((line2[1]=="synonymous_variant") or (line2[1]=="missense_variant")):
            temp1=str([line1[0:5],line2[1],line2[3],line1[8:]])
            temp1=temp1.replace("[","")
            temp1=temp1.replace("]","")
            temp1=temp1.replace("(","")
            temp1=temp1.replace(")","")
            #here I have to remove SNPs with more than two allele, 
            #in those case, there will be 1/2. 2/2 patterns.
            temp1=str(temp1)
            temp1=re.sub(".*\/2.*","",temp1)
            temp1=re.sub("\'","",temp1)
            temp1=re.sub("\\n","",temp1)
            print(temp1)
            f.write(str(temp1)+"\n") #
   
fileinput.close()
f.close()

## now the reformated file has been saved in "temp_ch.txt"




'''
##### step 2 read temp1 into a dataframe, do stats
'''

## in notepad++ remove "\n" in the end of the line

import pandas
data = pandas.read_csv("temp_ch.txt",header = None)


'''  More functions of pandas df
data.dtypes
data.head(3)
data.tail(3)
data.index  # row name
data.columns
data.describe()

data[152][0:10]  # [column][row] 
type(data)

data[152].str.len()
data[152]
data[33:72][0]           ## 33 to 72 are 39 B. ol as outgroup
'''




'''
now step3 
'''



# Now start the actual test.
gene=(data[6].unique())  # unique gene id
len(gene)  
# 36201 for 145bra.DP10MQ30.ann.v1.0

#print(gene[2]) 

os.remove('mk_ch.out')
fout=open("mk_ch.out",'a')
# this is the header of output
print("CHR","gene_id","dn","ds","pn","ps","alfa","P\n")
fout.write("CHR gene_id dn ds pn ps alfa P\n")

for i in range(0,(len(gene))):
    #print(gene[i])
    # for each gene ...   
    genedf=data[data[6]==gene[i]]  # extract lines with same gene id
    #print(genedf)
    #print(gene[i])   # gene id
    #print(len(genedf.index))  # SNP number within each gene
    
    #genedf.to_csv(gene[i])
    
    #print(genedf[1])
    
    ## presetting for each gene     
    ds=0#.001 #fix syn
    dn=0#.001 #fix nons
    ps=0#.001 #poly syn
    pn=0#.001 #poly nons   
    
    # for each line(SNP) of this gene
    for j in range(0,len(genedf.index)):
        '''
        #  Now tell me which individuals are outgroups
        #  in this case, column 151 and 152
        '''
        #edit here each time 
        list1=genedf.iloc[j,8:32] # 8:150 (151-1)
        list2=genedf.iloc[j,33:72] #151:152 (153-1)
        list1=list1.tolist()
        list2=list2.tolist()
        #print(list1,"\n",list2)
        
        #check if list1 and list2 have less than 10% "01"
        list1_01=list1.count(" 01")/(len(list1))
        list1_test=(list1_01<=1)
        
        list2_01=list2.count(" 01")/(len(list2))
        list2_test=(list2_01<=1)
        
        if all(((list1[k] !=' 11') and list1_test== True) for k in range(0,len(list1))):
            if all(((list2[m] !=' 00')) for m in range(0,len(list2))):
                #print("fix")
                MK="fix"
            else:
                #print("poly")
                MK="poly"
        elif all(((list2[k] !=' 11')) for k in range(0,len(list2))):
            if all(((list1[m] !=' 00') and list1_test== True) for m in range(0,len(list1))):
                #print("fix")
                MK="fix"
            else:
                #print("poly")
                MK="poly"
        else:
            #print("poly")
            MK="poly"
        #print (gene[i],genedf.iloc[j,1],MK) #
        
        
        #Now MK test
        if (MK=="fix"):
            if (genedf.iloc[j,5]==" synonymous_variant"):
                ds=ds+1
            elif (genedf.iloc[j,5]==" missense_variant"):
                dn=dn+1
        elif(MK=="poly"):
            if (genedf.iloc[j,5]==" synonymous_variant"):
                ps=ps+1
            elif (genedf.iloc[j,5]==" missense_variant"):
                pn=pn+1
        
        #Now summary report for this gene
        #chi=
        #NI=
        if (dn==0 or ps==0 or pn==0):
            alfa=float("-inf")
            G=0
            P=0
        else:    
            alfa=1-((ds*pn)/(dn*ps))
            '''
            # G test
            import numpy
            G = 2*(dn*numpy.log(dn/pn)+ds*numpy.log(ds/ps))  
            from scipy.stats import chisqprob
            P = chisqprob(G,1) #freedom =1
            
            #G test P value， both works. another way to do this:
            #            from scipy import stats
            #            1-stats.chi2.cdf(13.14,3)
            '''
            # use fisher's exact test because I have small sample size
            from scipy import stats
            pvalue=stats.fisher_exact([[dn,pn],[ds,ps]])     
            
    print(genedf.iloc[j,0],gene[i],int(dn),int(ds),int(pn),int(ps),round(alfa,2),round(pvalue[1],3))
    #fout=str(genedf.iloc[j,0],gene[i],dn,ds,pn,ps,alfa)
    fout.write("%s %s %s %s %s %s %s %s\n" % ((genedf.iloc[j,0]),gene[i],int(dn),int(ds),int(pn),int(ps),round(alfa,2),round(pvalue[1],3)))            
            
fout .close()




##########  do stats

#load results from the previous step

## replace \s\s with \s
mk= pandas.read_csv("mk_tril.out.fisher.exact",header=0,sep=" ")
mk.head(5)
mk.describe()
mk
# none 0
none0=mk[(mk["dn"]>0) & (mk["ds"]>0) &(mk["pn"]>0) & (mk["ps"]>0)]
none0
# only keep those lines with alfa >=0.
mkGood=mk[(mk["alfa"]>=0)] #positive selection
mkGood
# both 
mkGood=mkGood[(mkGood["dn"]>0) & (mkGood["ds"]>0) &(mkGood["pn"]>0) & (mkGood["ps"]>0)]
mkGood

mkGood["alfa"]
mkGood["alfa"].mean()   ## 0.4002
#0.478 ch

#for each chr
mkGood[mkGood["CHR"]=="A01"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A02"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A03"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A04"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A05"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A06"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A07"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A08"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A09"]["alfa"].mean()
mkGood[mkGood["CHR"]=="A10"]["alfa"].mean()

sign=mkGood[mkGood["P"]<0.05]

final=open("final.gene.tril",'a')
print(sign)
final.close()

