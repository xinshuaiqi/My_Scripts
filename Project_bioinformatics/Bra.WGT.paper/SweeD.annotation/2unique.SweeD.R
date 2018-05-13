getwd()
setwd("C:/Users/qxs/Desktop")

ch<-read.table("145ch.chr1-10.outlier_genes.anno",sep="_")
ch
nrow(ch)
ch[,2]
length(ch[,2])
Uch=unique(ch[,2])
length(unique(ch[,2]))
write.table(unique(ch[,2]),
            "145ch.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)

pk<-read.table("145pk.chr1-10.outlier_genes.anno",sep="_")
pk
nrow(pk)
pk[,2]
length(pk[,2])
Upk=unique(pk[,2])
length(unique(pk[,2]))
write.table(unique(pk[,2]),
            "145pk.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)

tril<-read.table("145tril.chr1-10.outlier_genes.anno",sep="_")
tril
nrow(tril)
tril[,2]
length(tril[,2])
Utril=unique(tril[,2])
length(unique(tril[,2]))
write.table(unique(tril[,2]),
            "145tril.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)

sylv<-read.table("145sylv.chr1-10.outlier_genes.anno",sep="_")
sylv
nrow(sylv)
sylv[,2]
length(sylv[,2])
Usylv=unique(sylv[,2])
length(unique(sylv[,2]))
write.table(unique(sylv[,2]),
            "145sylv.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)

EUCA<-read.table("EUCA.chr1-10.outlier_genes.anno",sep="_")
EUCA
nrow(EUCA)
EUCA[,2]
length(EUCA[,2])
UEUCA=unique(EUCA[,2])
length(unique(EUCA[,2]))
write.table(unique(EUCA[,2]),
            "EUCA.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)

#Venn
library(gplots)
venn(list(Upk,Uch,Utril,Usylv,UEUCA))
venn(list(Upk,Uch,Utril,Usylv,UEUCA))
# REF: https://cran.r-project.org/web/packages/gplots/vignettes/venn.pdf



U4=c(as.character(Uch),as.character(Upk),as.character(Utril),as.character(Usylv))
# 5669
U4=unique(U4) # 4674
write.table(unique(U4),
            "U4.chr1-10.outlier_genes.anno.unique",
            quote=F,row.names=F,col.names=F)


UEUCA=as.character(UEUCA)
#2058
venn(list(Upk,Uch,Utril,Usylv))

