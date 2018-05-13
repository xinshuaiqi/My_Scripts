### cal he and ho based on hardy output in vcftool


getwd()
setwd("C:/Users/qxs/Desktop/")
setwd("E:/Dropbox/Xubuntu-Win7_UAproject/Brassica Project/Chenlu_Rotation/Results_by_qxs##")

#  replace / with \t in the document
t<-read.table(file="hardy_5424noneWGT.hwe",header = TRUE);
t<-as.data.frame(t)
t<-t[((t$P_HET_DEFICIT<=0.05)|(t$P_HET_EXCESS<=0.05)),]
nrow(t)
hohe.no<-t[,4]/t[,7]



t<-read.table(file="hardy_27919WGT.hwe",header = TRUE);
t<-as.data.frame(t)
t<-t[((t$P_HET_DEFICIT<=0.05)|(t$P_HET_EXCESS<=0.05)),]
nrow(t)
hohe.wgt<-t[,4]/t[,7]


#head(t)
#head(t[,4])
#hohe<-t[,4]/t[,7]

hist((hohe.wgt),breaks=200,col='skyblue',border=F,ylim=c(0,60000))
mean(hohe.wgt)
summary(hohe.wgt)

hist(hohe.no,breaks=200,add=T,col='red',border=F,ylim=c(0,60000))
mean(hohe.no)
summary(hohe.no)



mean<-c(mean(hohe.no,na.rm=T),
        mean(hohe.wgt,na.rm=T))
mean
#0.3079451 0.2973541

boxplot(hohe.wgt,hohe.no,
        col=c("purple","orange"),
        ylab="Ho/He",
        main="Box plot of Ho/He",
        outline=FALSE,
        xlab=c("WGT gene                              none WGT gene"))

t.test(hohe.wgt,hohe.no)
#t = -54.687, df = 34055, p-value < 2.2e-16
#t = -2.1451, df = 5377.2, p-value = 0.03199 # only sign

set.seed(42)
hist(hohe.no,xlim=c(0,2),ylim=c(0,5000),breaks=200,col='skyblue',border=F)
hist(hohe.wgt,xlim=c(0,2),ylim=c(0,5000),breaks=200,add=T,col=scales::alpha('red',.5),border=F)





# library(ggplot2)
# df<-cbind(hohe.wgt,hohe.no)
# ggplot()+
#   geom_boxplot(data=hohe.wgt)+
#   geom_boxplot(data=hohe.no)
# 
# p <- ggplot(hohe.wgt,))
# 
# p + geom_boxplot()


##
# By the central limit theorem, means of samples from a population with finite variance 
# approach a normal distribution regardless of the distribution of the population. 
# Rules of thumb say that the sample means are basically normally distributed as long as 
# the sample size is at least 20 or 30. For a t-test to be valid on a sample of smaller size, 
# the population distribution would have to be approximately normal.
# 
# The t-test is invalid for small samples from non-normal distributions, 
# but it is valid for large samples from non-normal distributions.


