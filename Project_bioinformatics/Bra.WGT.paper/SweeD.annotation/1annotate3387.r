getwd()

t<-read.table("Brapa_gene_v1.5.gff")
head(t)
table(t[,1])
#gene<-read.table("SweeD outlier gene list4674.txt")

# change the file name accordingly
gene<-read.table("SweeD3387_EUCA.txt")
gene<-as.vector(gene[,1])
class(gene)
for (i in 1: length(gene)){
  # print (gene[i])
  n =which ( t[,9]%in%gene[i] ) # which line has this gene
  #out=paste0(as.character(t[n,1]),"_",gene[i])
  out=paste0(as.character(t[n,1]),"\t",t[n,9])
  write.table(out,"SweeD3387_EUCA.anno",quote=F,append=T,row.names=F,col.names=F)
}



