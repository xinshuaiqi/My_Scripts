getwd()
setwd("C:/Users/qxs/Desktop/snpeff2MKtest")

#first edit your vcf file, keep the title line and snp lines, remove the rest lines.

t<-read.table("temp1.txt",sep=",",header=F)
summary(t)

t[1,8]
#the 8th col is the info, with snpeff annotation

#extract the info column
t2<-t[,8]
t2

#make a new table, sep ="|"
t.b <-read.table(t2,sep="|",header=T)

head(t2)
separate(t2, sep = "\\|")

t3<-cbind(as.data.frame(t2),sep="|")
t3

head(as.data.frame(t2))
ncol(as.data.frame(t2))
ncol(t3)

t1<-scan("test.vcf",sep="|")
t1




