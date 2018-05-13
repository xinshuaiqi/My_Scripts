'''
The purpose of this script is find subfunctionalized B. rapa gene
idea from Mike

Mike: Any progress on running the asymmetric protein evolution analyses for the B. rapa data?
We need this and the coalescent simulations that Dan Oliver is working on to finish the Nat Gen ms and
explain the results.
We also need to estimate Pis and Pin rather than just Pi.

qxs plan:

1 for LF, MF1 and MF2 genes, check if the three pairs show subfunctionalization/GDE
'''


import os
os.chdir('C:\\Users\\qxs\\Desktop')


##          STEP1
# read GDE genes to a list
L_GDE = open("GDEch.txt").readlines() # read each line to a list
## Now extract lines with the thing you want
#when you have three gene, LF, MF1, MF2
#gene1="Bra011847"
#gene2="Bra011819"
#gene3="Bra011812"

a=""
b=""
c=""


'''
# define a function, for three given gene, LF MF1 MF2, check:
    1) if the gene is in any of the list?
            if so, print the gene, and related fpkm info (item1[6:9])
       if the gene is not in any of the list:
            set it as NA
    2) print info for all three gene
'''    
def asym (gene1, gene2, gene3):   
    for item1 in L_GDE:        
        if gene1 in item1:
            item1=item1.rstrip()   
            L_item1=item1.split("\t")
            #print (gene1,L_item1[6:9])
            global a
            a=(gene1,L_item1[6:9])
            break
        if any (gene1 in s for s in L_GDE)==False:
            a="NA"           
    for item2 in L_GDE:
        if gene2 in item2:
            item2=item2.rstrip()
            L_item2=item2.split("\t")
            #print (gene2,L_item2[6:9])
            global b
            b=(gene2,L_item2[6:9])
            break
        if any (gene2 in s for s in L_GDE)==False:
            b="NA"   
    for item3 in L_GDE:
        if gene3 in item3:
            item3=item3.rstrip()
            L_item3=item3.split("\t")
            #print (gene3,L_item3[6:9])
            global c
            c=(gene3,L_item3[6:9])
            break
        #if (gene3 not in L_GDE):
            #print ("not in:  ", item1[0])
         #   c="NA"
        if any (gene3 in s for s in L_GDE)==False:
            c="NA"            
    #print (gene1, L_item1[6:9], gene2, L_item2[6:9], gene3, L_item3[6:9])
    if ((a=='NA')+(b=='NA')+(c=='NA')<=1):  # at least two not NA
        print (a,b,c)
        
        f = open("outch.txt", "a")
        f.write("%s %s %s\n" % (a,b,c))
        f.close()
## RUN
#asym(gene1,gene2,gene3)


##          STEP2
#get the LF MF1 and MF2 genes for each paleolog group
#read each line to a list
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
    if (LF=="-"):
        LF="Bra1"
    if (MF1=="-"):
        MF1="Bra1"
    if (MF2=="-"):
        MF2="Bra1"

    #print ("Now the list_LMF is:",i, LF,MF1, MF2,"\n")
    asym(LF,MF1,MF2)






''''''''''''''''''''''''''''''
'''
gene1="Bra011847"
a=""
def asym (gene1):   
    for item1 in L_GDE:             
        if (gene1 in item1):
            L_item1=item1.split("\t")
            #print (gene1,L_item1[6:9])
            global a
            #print (a)
            a=(gene1,L_item1[6:9])
            #print (a)
            #print (gene1 in item1)
            break
        if (gene1 not in L_GDE):
            #print ("not in:  ", item1[0])
            a="NA"
    print (a)

asym(gene1)




for ITEM1 in L_GDE:
            if list_LMF[0] in ITEM:
                        L_ITEM=ITEM.split("\t")
                        print (list_LMF[0] ,L_ITEM[6:9])

gene="Bra011819"
for ITEM in L_GDE:
            if gene in ITEM:
                        L_ITEM=ITEM.split("\t")
                        print (gene ,L_ITEM[6:9])

print (gene ,L_ITEM[6:9])








#======================================useless


# for each line, split by \t, convert the txt to a list

def split2list (x):
            s2l=x.split("\t")
            return s2l
split2list(LMF[0])


# DONE!!










for i in [1,3,4]:
    if i == 1:
        print("True")
    else:
        print("NOT ture")
'''