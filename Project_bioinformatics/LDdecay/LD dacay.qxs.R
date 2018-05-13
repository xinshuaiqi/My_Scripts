#LD decay
setwd("C:/Users/qxs/Desktop/LD")
#setwd("/home/xinshuaiqi/Dropbox/Xubuntu-Win7_qxs-folder/Brassica Project/@data.results_Pop genetics/parameters/LD decay/")
#setwd("E:/Dropbox/Xubuntu-Win7_qxs-folder/Brassica Project/@data.results_Pop genetics/parameters/LD decay")



#df<-read.table(file="plink.ld.A03H48")
#df<-read.table(file="plink.ld.10chrtest2")
pdf("LD.pdf")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~all 145
#df<-read.table(file="sylv.ld.A01") 

df<-read.table(file="145.ld.A01") 

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)

df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#############

distance<-df2$bp
LD.data<-df2[,7]
n<-145      #number of individual
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#AAA<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
#         xlab="",ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
#BBB<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="blue")
par(new=T)
MMMM<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),xlab="",xlim=c(0,100000),ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
NNNN<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,xlim=c(0,100000),col="black")

#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ol
df<-read.table(file="ol.ld.A01")

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)


df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#################################

distance<-df2$bp
LD.data<-df2[,7]
n<-13
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#par(new=T)
#EEE<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),xlab="",ylab = "") #xlim=c(0,10000),col="white" xlim=c(0,100000),
#FFF<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="gray")#,xlim=c(0,200)

par(new=T)
EEEE<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
           xlab="",ylab = "",xlim=c(0,10000)) 
FFFF<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="blue",xlim=c(0,10000))





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~rapa
df<-read.table(file="rapa.ld.A01")

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)

df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#################################

distance<-df2$bp
LD.data<-df2[,7]
n<-20
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#par(new=T)
#GGG<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
#        xlab="Distance (bp)",ylab = "r2",main ="10chr") #xlim=c(0,10000),col="white",xlim=c(0,100000)
#HHH<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="black")


par(new=T)
GGGG<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
           xlab="Distance (bp)",ylab = "r2",main ="10chr",xlim=c(0,10000)) #xlim=c(0,10000),col="white",xlim=c(0,100000)
HHHH<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="purple",xlim=c(0,10000))



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sylv
#df<-read.table(file="sylv.ld.A01") 

df<-read.table(file="sylv.ld.A01") 

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)

df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#############

distance<-df2$bp
LD.data<-df2[,7]
  n<-7      #number of individual
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#AAA<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
 #         xlab="",ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
#BBB<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="blue")
par(new=T)
AAAA<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),xlab="",xlim=c(0,100000),ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
BBBB<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,xlim=c(0,100000),col="orange")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~tril
df<-read.table(file="tril.ld.A01")

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)


df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#################################

distance<-df2$bp
LD.data<-df2[,7]
n<-20
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#par(new=T)
#CCC<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),  xlab="",ylab = "") #xlim=c(0,10000),col="white"xlim=c(0,100000),
#DDD<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="green")


par(new=T)
CCCC<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
          xlab="",ylab = "",xlim=c(0,10000))
DDDD<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="green",xlim=c(0,10000))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~pk
#df<-read.table(file="sylv.ld.A01") 

df<-read.table(file="pk.ld.A01") 

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)

df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#############

distance<-df2$bp
LD.data<-df2[,7]
n<-28      #number of individual
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#AAA<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
#         xlab="",ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
#BBB<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="blue")
par(new=T)
IIII<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),xlab="",xlim=c(0,100000),ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
JJJJ<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,xlim=c(0,100000),col="yellow")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ch
#df<-read.table(file="sylv.ld.A01") 

df<-read.table(file="ch.ld.A01") 

head(df)
summary(df)
#SNP distance , absolute value
bp <- abs(df[,2]-df[,5])
head(bp)
summary(bp)
max(bp)
length(bp)
#hist(bp,density=10,breaks=100)

df2<-data.frame(df,bp)
head(df2)
#write.table(df2, "df2.2txt", sep="\t")

#plot(df2$bp,df2[,7],pch=20,col=rgb(0,0,0,10,maxColorValue=255))
#plot(df2$bp,df2[,7],pch=20,col="red")

#############

distance<-df2$bp
LD.data<-df2[,7]
n<-25      #number of individual
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]
half.decay.distance
ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]

#AAA<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),
#         xlab="",ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
#BBB<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,col="blue")
par(new=T)
KKKK<-plot(distance,LD.data,pch=19,cex=0.9,col=rgb(0,0,0,0,maxColorValue=255),xlab="",xlim=c(0,100000),ylab = "") #col=rgb(0,0,0,0,maxColorValue=255) xlim=c(0,100000),,xlim=c(0,100000) xlim=c(0,10000000),
LLLL<-lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=3,xlim=c(0,100000),col="red")



dev.off()
#
min(ld.df$fpoints)



































































#################################################################################


#################################################

##########################################
# http://www.cyclismo.org/tutorial/R/linearLeastSquares.html
cor(df2$bp,df2[,7])
cor.test(df2$bp,df2[,7])
?cor

install.packages("nlstools")


#try
distance<-df2$bp
LD.data<-df2[,7]

n<-10
HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))

LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0


df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints)
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]

ld.df<-data.frame(distance,fpoints)
ld.df<-ld.df[order(ld.df$distance),]
plot(distance,LD.data,pch=19,cex=0.9,xlim = c(300000,400000))
lines(ld.df$distance,ld.df$fpoints,lty=3,lwd=5,col="red",xlim = c(0,100000))

#






exp <- as.formula(df2[,7]~1/(1+4(df2$bp)))
preview(exp)
nla1<-nls(exp,df2[,7]~1/(1+4(df2$bp)))


fit<-nls(df2[,7] ~ 1/(1+4(df2$bp)),start=c(0.33333300))
?nls
abline(fit)
fit
plot(fit)

confint(fit)
summary(fit)










?ggplot2
library("Rcpp")
library("ggplot2")
ggplot(df2,aes(x = df2$bp, y = df2[,7]))+ geom_point() +
  stat_smooth(method = 'lm', aes(colour = 'linear'), se = FALSE) +
  stat_smooth(method = 'lm', formula = y ~ poly(x,2), aes(colour = 'polynomial'), se= FALSE) +
  stat_smooth(method = 'nls', formula = y ~ a * log(x) +b, aes(colour = 'logarithmic'), se = FALSE, start = list(a=1,b=1)) +
  stat_smooth(method = 'nls', formula = y ~ a*exp(b *x), aes(colour = 'Exponential'), se = FALSE, start = list(a=1,b=1)) +
  theme_bw() +
  scale_colour_brewer(name = 'Trendline', palette = 'Set2')

###another way to calculate LD decay
distance<-as.numeric(df2$bp)
LD.data<-as.numeric(df2[,7])

distance<-c(19,49,1981,991,104,131,158,167,30,1000,5000,100,150,11,20,33,1100,1300,1500,100,1400,900,300,100,2000,100,1900,500,600,700,3000,2500,400,792)
LD.data<-c(0.6,0.47,0.018,0.8,0.7,0.09,0.09,0.05,0,0.001,0,0.6,0.4,0.2,0.5,0.4,0.1,0.08,0.07,0.5,0.06,0.11,0.3,0.6,0.1,0.9,0.1,0.3,0.29,0.31,0.02,0.01,0.4,0.5)


plot(distance,LD.data)

head(distance)
class(distance)
head(LD.data)
class(LD.data)



n<-52

HW.st<-c(C=0.1)
HW.nonlinear<-nls(LD.data~((10+C*distance)/((2+C*distance)*(11+C*distance)))*(1+((3+C*distance)*(12+12*C*distance+(C*distance)^2))/(n*(2+C*distance)*(11+C*distance))),start=HW.st,control=nls.control(maxiter=100))
tt<-summary(HW.nonlinear)
new.rho<-tt$parameters[1]
fpoints<-((10+new.rho*distance)/((2+new.rho*distance)*(11+new.rho*distance)))*(1+((3+new.rho*distance)*(12+12*new.rho*distance+(new.rho*distance)^2))/(n*(2+new.rho*distance)*(11+new.rho*distance)))
plot(HW.nonlinear)


LD.st<-c(b0=12.9)
distance.mb<-distance/1000000
LD.nonlinear<-nls(LD.data~(1-distance.mb)^b0,start=LD.st,control=nls.control(minFactor=1/1000000000,maxiter=100,warnOnly=T))
summ<-summary(LD.nonlinear)
param<-summ$parameters
beta0<-param["b0","Estimate"]
fpoints<-(1-distance.mb)^beta0

df<-data.frame(distance,fpoints)
maxld<-max(LD.data)
#You could eleucubrate if it's better to use the maximum ESTIMATED value of LD
#In that case you just set: maxld<-max(fpoints) 
h.decay<-maxld/2
half.decay.distance<-df$distance[which.min(abs(df$fpoints-h.decay))]



x<-c(19,49,1981,991,104,131,158,167,30,1000,5000,100,150,11,20,33,1100,1300,1500,100,1400,900,300,100,2000,100,1900,500,600,700,3000,2500,400,792)
y<-c(0.6,0.47,0.018,0.8,0.7,0.09,0.09,0.05,0,0.001,0,0.6,0.4,0.2,0.5,0.4,0.1,0.08,0.07,0.5,0.06,0.11,0.3,0.6,0.1,0.9,0.1,0.3,0.29,0.31,0.02,0.01,0.4,0.5)
class(x)
data<-data.frame(x,y)
class(data)
plot(x,y)
fit <- nls (y ~ A/(A+4*x),start=c(A=1))
summary(fit)

plot(fit)
curve(1/(1+4(x)),add=TRUE)



x <- -(1:100)/10
y <- 100 + 10 * exp(x / 2) + rnorm(x)/10
nlmod <- nls(y ~  Const + A * exp(B * x))
plot(nlmod)
plot(x,y, main = "nls(*), data, true function and fit, n=100")
curve(100 + 10 * exp(x / 2), col = 4, add = TRUE)
lines(x, predict(nlmod), col = 2)
