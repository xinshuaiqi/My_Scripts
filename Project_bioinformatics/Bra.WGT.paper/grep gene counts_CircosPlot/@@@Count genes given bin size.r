## this script will count gene number within a bin size 

getwd()


#edit this two lines as you need
               ##
# filename="Bra1.5.gene.list"
# filename="27919.WGT.gene.list.out"
# filename="5424None.WGT.gene.list.out"
# filename="996Pi_Fst_outlier.gene.list.out"
# filename="3387SweeD.outlier.gene.list.out"
# filename="92MK.gene.list.out"
# filename="6801.GDE.gene.list.out"
# filename="7813GDEunique.gene.list.out"

# filename="GDE.ch.unique.txt.out"
# filename="GDE.pk.unique.txt.out"
# filename="GDE.tril.unique.txt.out"
# filename="GDE.sylv.unique.txt.out"
# 
# filename="SweeD3387_EUCA.txt.out"
# filename="SweeD3387_ch.txt.out"
# filename="SweeD3387_pk.txt.out"
# filename="SweeD3387_tril.txt.out"
 filename="SweeD3387_sylv.txt.out"


bin= 100000 #100kbp  
chr=c("A01","A02","A03","A04","A05","A06","A07","A08","A09","A10")
#chr=c("A01")
class(chr)


#setup input and output files
input=read.table(filename)
#input=read.table("test.list")
#output=cat(filename,"out",sep=".")

#head(input)
start=1
end =start+bin

for (i in chr) {
  #print(i)  #go through eaach chr at a time.
  line=input[(which(input[,1]==i)),]  #extract each chr from the input file.
      #line=input[(which(input[,1]=='A02')),]  #extract each chr from the input file.
  line=line[order(line[,3]),]
  #print(line)
  start=1
  end =start+bin
  # chr length
  chrLength=line[nrow(line),3]
  binN=as.integer(chrLength/bin)+1
  binN  # total bin number for this chromosome
  
  for (j in 0:(binN-1)){
    #print (j) 
    #cat(((j*bin)+1),((j*bin)+1+bin),"\n")  # this is the bin range 
    
    # count genes within this range
    n=0 #initial  count
    for (k in 1:nrow(line)) {
      if (line[k,2]>=((j*bin)+1) & line[k,3]<=((j*bin)+bin)) #check if this gene within this range
        {n=n+1}
      else if (line[k,3]>=((j*bin)+bin) & line[k,2]<=((j*bin)+bin)) #check if this gene over the upper bound
        {n=n+1}
    }
    cat(i,as.integer((j*bin)+1),as.integer((j*bin)+bin),n,"\n")
    total=capture.output(
      cat(i,((j*bin)+1),((j*bin)+bin),n,"\n")
      )# this is the bin range  
    total
    write.table(total,file=paste(filename,"counts",sep="."),quote=F,append=T,row.names=F,col.names=F)
    options(scipen=0) 
  }
}

print("Job finished!")



#qxs