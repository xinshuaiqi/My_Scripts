# This script is associated with the manuscript *Increased genetic variation from ancient polyploidy was preferentially selected during the domestication of Brassica rapa crops*
# It will generate a two-dimension plot for Fst and Pi for each population.
# The input file is generated from VCFTools

getwd()
setwd("C:/Users/qxs/Desktop/pai")

t<-read.csv("pai-ratio.csv")
head(t)

EU<-read.csv("EU.csv",header=TRUE)
EA<-read.csv("EA.csv",header=TRUE)
ch<-read.csv("ch.csv",header=TRUE)
pk<-read.csv("pk.csv",header=TRUE)
tril<-read.csv("tril.csv",header=TRUE)
sylv<-read.csv("sylv.csv",header=TRUE)

head(ch)
new<- merge(EU,EA,by="CHROM.BIN_START.BIN_END")
new<- merge(new,ch,by="CHROM.BIN_START.BIN_END")
new<- merge(new,pk,by="CHROM.BIN_START.BIN_END")
new<- merge(new,sylv,by="CHROM.BIN_START.BIN_END")
new<- merge(new,tril,by="CHROM.BIN_START.BIN_END")
tail(new)
write.table(new,"new.txt",sep="\t")

summary(new)

#calculate pai, use EU/ xxx
hist(new[,2]/new[,3],breaks=1000, main="??EU/??EA") #EA
hist(new[,2]/new[,4],breaks=1000, main="??EU/??ch") #ch
hist(new[,2]/new[,5],breaks=1000, main="??EU/??pk") #pk
hist(new[,2]/new[,6],breaks=1000, main="??EU/??sylv") #sylv
hist(new[,2]/new[,7],breaks=1000, main="??EU/??tril") #tril

#============================
##Now fst
setwd("C:/Users/qxs/Desktop/Fst")

Fst.EA<-read.csv("EA-EU.csv",header=TRUE)
Fst.ch<-read.csv("ch-EU.csv",header=TRUE)
Fst.pk<-read.csv("pk-EU.csv",header=TRUE)
Fst.tril<-read.csv("tril-EU.csv",header=TRUE)
Fst.sylv<-read.csv("sylv-EU.csv",header=TRUE)

head(Fst.ch)
fst=Fst.EA
fst<- merge(fst,Fst.ch,by="CHROM.BIN_START.BIN_END")
fst<- merge(fst,Fst.pk,by="CHROM.BIN_START.BIN_END")
fst<- merge(fst,Fst.sylv,by="CHROM.BIN_START.BIN_END")
fst<- merge(fst,Fst.tril,by="CHROM.BIN_START.BIN_END")
tail(fst)

write.table(fst,"fst.txt",sep="\t")

paiFst<- merge(new,fst,by="CHROM.BIN_START.BIN_END")
tail(paiFst)

#column order
# Pai: EU EA ch pk sylv tril
# Fst:    EA ch pk sylv tril

# Fst hist plot
# 9 weighted Fst, 10 mean Fst
hist(paiFst[,9],breaks=1000, main="Fst EA vs EU") #EA
hist(paiFst[,12],breaks=1000, main="Fst ch vs EU")#ch
hist(paiFst[,15],breaks=1000, main="Fst pk vs EU")#pk
hist(paiFst[,18],breaks=1000, main="Fst sylv vs EU") #sylv
hist(paiFst[,21],breaks=1000, main="Fst tril vs EU") #tril

ncol(paiFst)

#plot pai ratio vs Fst
plot(new[,2]/new[,3],paiFst[,9],main="EA vs EU",xlab="??EU/??EA", ylab="Fst",xlim=c(0,300),ylim=c(0,1),pch=20)
abline(v=20,lty=2,col="red")
abline(h=0.2,lty=2,col="red")

c=cbind(new[,2]/new[,3],paiFst[,9])
tail(c)
cc=c[which(c[,1]>20 & c[,2]>0.2)]
length(cc)
#4

par(mfrow=c(2,2))
plot(new[,2]/new[,4],paiFst[,12],main="ch vs EU",xlab="??EU/??ch", ylab="Fst",xlim=c(0,300),ylim=c(0,1),pch=20)
abline(v=20,lty=2,col="red")
abline(h=0.2,lty=2,col="red")

c=cbind(new[,2]/new[,4],paiFst[,12])
tail(c)
cc=c[which(c[,1]>20 & c[,2]>0.2)]
length(cc)
#3

plot(new[,2]/new[,5],paiFst[,15],main="pk vs EU",xlab="??EU/??pk", ylab="Fst",xlim=c(0,300),ylim=c(0,1),pch=20)
abline(v=20,lty=2,col="red")
abline(h=0.2,lty=2,col="red")

c=cbind(new[,2]/new[,5],paiFst[,15])
tail(c)
cc=c[which(c[,1]>20 & c[,2]>0.2)]
length(cc)
#19


plot(new[,2]/new[,6],paiFst[,18],main="sylv vs EU",xlab="??EU/??sylv", ylab="Fst",xlim=c(0,300),ylim=c(0,1),pch=20)
abline(v=20,lty=2,col="red")
abline(h=0.2,lty=2,col="red")

c=cbind(new[,2]/new[,6],paiFst[,18])
tail(c)
cc=c[which(c[,1]>20 & c[,2]>0.2)]
length(cc)
#175


plot(new[,2]/new[,7],paiFst[,21],main="tril vs EU",xlab="??EU/??tril", ylab="Fst",xlim=c(0,300),ylim=c(0,1),pch=20)
abline(v=20,lty=2,col="red")
abline(h=0.2,lty=2,col="red")

c=cbind(new[,2]/new[,7],paiFst[,21])
tail(c)
cc=c[which(c[,1]>20 & c[,2]>0.2)]
length(cc)
#484


plot(((new[,2]-new[,3])/new[,2]),paiFst[,9],main="EA vs EU")

#================================================================
# hebing Chr, bin start, bin end
ncol(t)
hb_EU<-paste(t[,1],t[,2],t[,3],sep="_")
hb_EA<-paste(t[,5],t[,6],t[,7],sep="_")
hb_ch<-paste(t[,9],t[,10],t[,11],sep="_")
hb_pk<-paste(t[,13],t[,14],t[,15],sep="_")
hb_sylv<-paste(t[,17],t[,18],t[,19],sep="_")
hb_tril<-paste(t[,21],t[,22],t[,23],sep="_")

#create n table
ntEU<-cbind(hb_EU,t[,4])
ntEA<-cbind(hb_EA,t[,8])
ntch<-cbind(hb_ch,t[,12])
ntpk<-cbind(hb_pk,t[,16])
ntsylv<-cbind(hb_sylv,t[,20])
nttril<-cbind(hb_tril,t[,24])

colnames(ntEU)[1:2]<-c("BIN_START","EU")
colnames(ntEA)[1:2]<-c("BIN_START","EA")
colnames(ntch)[1]<-c("BIN_START")
colnames(ntpk)[1]<-c("BIN_START")
colnames(ntsylv)[1]<-c("BIN_START")
colnames(nttril)[1]<-c("BIN_START")

head(as.factor(ntEU))

nnt <- merge(ntEU,ntEA, by="BIN_START")
head(nnt)

,ntch,ntpk,ntsylv,nttril,

head(nttril)
head(ntEU)
head(ntEA)
head(ntch)
head(ntpk)
head(ntsylv)

head(hb_EU)

posEU<-cbind(t[,1],t[,2],t[,3])
head(posEU)

EU<-t[,1:4]
EA<-t[,5:8]
ch<-t[,9:12]

colnames(EA)[2]<-c("BIN_START")

head(EU)
head(EA)

hebing<-paste(EU[,1],EU[,2],EU[,3],sep="_")
head(hebing)
EU<-cbind(EU,hebing)
head(EU)

new <- merge(EU,EA, by="BIN_START")
tail(new)
new

