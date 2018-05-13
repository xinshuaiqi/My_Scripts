#estimate gene birth death rate from Ks results
 
# this script is developed by qxs
# the method used in the script is from Lynch  Conery 2003 "The evolutionary demography of duplicate genes"

#the input file the "final Ks report" from DupPipe 


getwd()
setwd("E:/Dropbox/Xubuntu-Win7_qxs-folder/Brassica\ Project/@data.results/ks\ plot")
setwd("E:/Dropbox/Xubuntu-Win7_qxs-folder/Brassica Project/Goldilock/70_goldilock/ks plot")
a=read.csv("final_ks_values_70-127.scafSeq") 
a=read.csv("final_ks_values_no_cl.Trinity.fasta") 
a=read.csv("final_ks_values_a.chinensis_trinity.docx") 
#set S value 
S = 0.1   #here is the Ks value, I use 0.1 as suggested by Mike kiwi fruit results
number=  58398  #total number of genes in the analysis
  
  
#extract the Ks values
summary(a)
head(a)
a[2,3]
ks=a[,3]
ks=na.omit(ks)
summary(ks)

#ks plot
hist(ks,col="grey",
     xlim=range(0.00001,5),
     ylim=range(0,400),
     breaks = 10000,
     border="grey")

#extract Ks < S
ks
#S=0.1
ks01<-subset(ks, ks<S)
summary(ks01)
  #histgram of ks<0.1
hist(ks01,col="grey",
     xlim=range(0,0.1),
     ylim=range(0,400),
     breaks = 50,
     border="grey")
  #ln transfer the y axis, counts of each ks value bins
mydata_hist <- hist(ks01, breaks=50, plot=FALSE)
mydata_hist$count
ln<-log(mydata_hist$count,base=exp(1))
ln

  #modify the bin number to match with count numbers  (bin number = count number +1 )
#?plot
breaks<-mydata_hist$breaks[!mydata_hist$breaks==0]

#plot of ln Y and ks bins
plot(ln, type='h', lwd=10, lend=2)
plot(breaks,ln,type='p' )
#linear regression of the results
regmodel=lm(ln~breaks)

#confidence intervals of slope value
confint(regmodel)
#plot(regmodel)

#extract the slope value
out<-summary(regmodel)
out
class(out$coefficients)
slope<-out$coefficients[2,1]
slope<-abs(slope)

#gene death rate

##now set S = 0.01, only use these gene for estimation
S = 0.01
             
D=1-exp(-slope*S)
D
#death half life
S_half<-(-log(0.5,base=exp(1))/slope)
S_half

#gene birth rate
#ks

  #duplicated pairs with Ks < 0.1
  nb=length(ks01)
  nb
  #total number of genes
  N= number


B=(nb*slope*S)/(N*(1-exp(-slope*S)))
B


##results
slope
D
S_half
B

B/D

