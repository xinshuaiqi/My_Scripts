
# this is a script to sort structure result in a order you want

getwd()
setwd("C:/Users/qxs/Desktop")
df<-as.data.frame(read.table("input.txt",header=F,sep="\t"))
target<-(scan("order.txt",what="",sep="\n"))
target
head(df)
out<-df[match(target, df$V1),]
write.table(out, file="out.txt",sep="\t",quote=F,col.names=F)
