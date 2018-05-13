#how to make ks plot from dupPipe result

# on ratel, Output folder 
#run :
#  sed -i 's/\t/\,/g' final_ks_values_bna.fn

#download final file to local folder, ks plot

#run this r script

getwd()
#setwd("E:/Dropbox/Xubuntu-Win7_qxs-folder/Brassica\ Project/@data.results/ks\ plot")
a=read.csv("final_ks_values_Bra1.2.fna",header = TRUE)    #change the name here each time
a=read.csv("final_ks_values_107pk.fna",header = TRUE)
a=read.csv("final_ks_values_67ch.fna",header = TRUE)
a=read.csv("final_ks_values_129turnip.fna",header = TRUE)
a=read.csv("final_ks_values_134tril.fna",header = TRUE)
a=read.csv("final_ks_values_148rapa.fna",header = TRUE)
a=read.csv("final_ks_values_153sylv.fna",header = TRUE)

a=read.csv("pamloutput_107pk.fna",header = TRUE)


summary(a)
head(a)
a[2,3]
ks=a[,5]
ks=na.omit(ks)
summary(ks)

hist(ks,col="darkgrey",
     xlim=range(0.00001,2), #change Ks to 2 as Mike sugggested
     ylim=range(0,1000),
     breaks = 10000,
     border="darkgrey",
     main ="Ks plot of Bra1.2EMMIX")
abline(v=c(0.081596667,0.538446667))
