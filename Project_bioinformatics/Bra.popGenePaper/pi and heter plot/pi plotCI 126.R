#R pai 1-10 stats

setwd("C:/Users/qxs/Desktop/pai")
setwd("E:/Dropbox/Xubuntu-Win7_qxs-folder/Brassica Project/@140Brapa_biogeography/pai")

#read each file
#All<-read.table(file="nucleotide_diversity100000_145All.windowed.pi",header = TRUE)
#hy<-read.table(file="nucleotide_diversity100000_145hybrid.windowed.pi",header = TRUE)


CA<-read.table(file="nucleotide_diversity100000_22EuCAsia.windowed.pi",header = TRUE)
#rapa<-read.table(file="nucleotide_diversity100000_16turnip.windowed.pi",header = TRUE)
sylv<-read.table(file="nucleotide_diversity100000_145sylv.windowed.pi",header = TRUE)
tril<-read.table(file="nucleotide_diversity100000_145tril.windowed.pi",header = TRUE)
ch<-read.table(file="nucleotide_diversity100000_16ch.windowed.pi",header = TRUE)
pk<-read.table(file="nucleotide_diversity100000_145pk.windowed.pi",header = TRUE)



head(All)
All[,5]
##box plot of pai genetic diversity
boxplot(as.numeric(CA[,5]),as.numeric(sylv[,5]),
        as.numeric(tril[,5]),as.numeric(ch[,5]),as.numeric(pk[,5]),
        col=c("purple","orange","green","red","yellow"),
        ylab="Genetic diversity",
        main="Box plot of genetic diversity",outline=FALSE,
        xlab=c("Eu-C.Asia rapa             sylv             tril               ch             pk"))

tmp<-as.table(c(as.numeric(All[,5]),as.numeric(bol[,5]),as.numeric(rapa[,5]),as.numeric(sylv[,5]),
       as.numeric(tril[,5]),as.numeric(ch[,5]),as.numeric(pk[,5]),as.numeric(hy[,5])))
head(tmp)
summary(tmp)

##box plot of pai genetic diversity
mean<-c(mean(CA[,5],na.rm=T),
         #mean(rapa[,5],na.rm=T),
         mean(sylv[,5],na.rm=T),
        mean(tril[,5],na.rm=T),
        mean(ch[,5],na.rm=T),
        mean(pk[,5],na.rm=T))mean
2.883162e-05 1.082237e-05 9.704133e-06 2.445245e-05 2.403176e-05


lo<-c(
  as.numeric(summary(as.numeric(All[,5]))[1]),  
  as.numeric(summary(as.numeric(bol[,5]))[1]),
  as.numeric(summary(as.numeric(rapa[,5]))[1]),
  as.numeric(summary(as.numeric(sylv[,5]))[1]),
  as.numeric(summary(as.numeric(tril[,5]))[1]),
  as.numeric(summary(as.numeric(ch[,5]))[1]),        
  as.numeric(summary(as.numeric(pk[,5]))[1]),
  as.numeric(summary(as.numeric(hy[,5]))[1])         
          )
up<-c(
  as.numeric(summary(as.numeric(All[,5]))[6]),  
  as.numeric(summary(as.numeric(bol[,5]))[6]),
  as.numeric(summary(as.numeric(rapa[,5]))[6]),
  as.numeric(summary(as.numeric(sylv[,5]))[6]),
  as.numeric(summary(as.numeric(tril[,5]))[6]),
  as.numeric(summary(as.numeric(ch[,5]))[6]),        
  as.numeric(summary(as.numeric(pk[,5]))[6]),
  as.numeric(summary(as.numeric(hy[,5]))[6])         
)
mean<-c(
  as.numeric(summary(as.numeric(All[,5]))[4]),  
  as.numeric(summary(as.numeric(bol[,5]))[4]),
  as.numeric(summary(as.numeric(rapa[,5]))[4]),
  as.numeric(summary(as.numeric(sylv[,5]))[4]),
  as.numeric(summary(as.numeric(tril[,5]))[4]),
  as.numeric(summary(as.numeric(ch[,5]))[4]),        
  as.numeric(summary(as.numeric(pk[,5]))[4]),
  as.numeric(summary(as.numeric(hy[,5]))[4])         
)
df = data.frame(cbind(up,lo,mean))
plot(df$mean, ylim = c(0.0000,0.0005), xlim = c(1,8))
require(plotrix)
plotCI(df$mean,y=NULL, ui=df$up-df$mean, li=df$mean-df$lo, err="y",      
       pch=20, slty=3, scol = "black", add=TRUE)


mean(as.numeric(pk[,5]))
sd(as.numeric(pk[,5]))










?wilcox.test
wilcox.test(as.numeric(ch[,5]),as.numeric(pk[,5]))

summary(as.numeric(All[,5]))
summary(as.numeric(bol[,5]))
summary(as.numeric(rapa[,5]))
summary(as.numeric(sylv[,5]))
summary(as.numeric(tril[,5]))
summary(as.numeric(ch[,5]))
summary(as.numeric(pk[,5]))
summary(as.numeric(hy[,5]))

#=========================================