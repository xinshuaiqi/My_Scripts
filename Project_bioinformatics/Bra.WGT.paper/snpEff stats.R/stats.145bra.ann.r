getwd()

t<-read.table("unique.ann",sep="\t",header=F)
head(t)
##number of unique element
u<-unique(t)
u

# summary count number of each unique element
table(t)



####for the WGT SNP
t<-read.table("unique.ann.WGT",sep="\t",header=F)
head(t)
##number of unique element
u<-unique(t)
u

# summary count number of each unique element
table(t)









t<-read.table("3387SweeD.outlier.gene.list.snpEff.sort",sep="\t",header=F)
head(t)







