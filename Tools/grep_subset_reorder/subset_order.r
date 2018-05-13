setwd("E:/Dropbox/Yuan_lab_RNASeq_Dropbox/Data_RNAseq/R_correlation/Venn_sum")

# read the gene list to a character using scan
a345<-scan("345shared_adjust.txt", character(0), sep = "\n")
head(a345)
 

X6mwdA<-read.table("../6mwd/6mwd_sign.csv",header = TRUE)
X6mwdB<-read.table("../6mwd/6mwd_signP.csv",sep=",",header=TRUE)
X6mwd<-cbind(X6mwdA,X6mwdB)
colnames(X6mwd)<-c("geneID","X6mwd_r2","X6mwd_P")
#head(X6mwd)
X6mwd<-subset(X6mwd, (X6mwd$geneID %in% a345))
# num<-which((X6mwd$geneID %in% a345) ==TRUE)
# X6mwd<-X6mwd[num,]
dim(X6mwd)
head(X6mwd)

#############################
# sort by a given order
df <- data.frame(name=letters[1:4], value=c(rep(TRUE, 2), rep(FALSE, 2)))
target <- c("b", "c", "a", "d")
df[match(target, df$name),]

#############################
# sort table A by given column in table B
A<-read.csv("severity_sort4GDE.csv",header = TRUE, fill = TRUE)
B<-read.csv("order.csv",header = TRUE,na.strings = TRUE)
target<-B$sampleName
new<-A[match(target, A$subject..ID),] # sort table A$subject, based on the order of B$samplename
write.csv(new,"severity_sorted4GDE.csv",quote=FALSE)
