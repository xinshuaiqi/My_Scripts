 
#           find shared element in two seqs

def share(seq1,seq2):
            list=[]
            list=(set(seq1) & set(seq2))
            return list

def union(seq1,seq2):
            all=[]
            all=(set(seq1) ^ set(seq2))
            return all


qxs=(1,2,3,4,5)
sss=(4,5,6,7,8)
out=share(qxs,sss)
all=union(qxs,sss)


print (out)  #set([4, 5])
print(all)     #set([1, 2, 3, 6, 7, 8])
