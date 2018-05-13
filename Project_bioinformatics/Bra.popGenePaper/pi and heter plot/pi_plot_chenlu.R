#R pai 1-10 stats

setwd("D:/dropbox/Dropbox/Chenlu_Rotation/data")
#read each file
wgt<-read.table(file="pi100000_27919WGT.windowed.pi",header = TRUE)
no<-read.table(file="pi100000_5424noneWGT.windowed.pi",header = TRUE)

head(wgt)
#mean SNP number per window
mean(wgt$N_VARIANTS)
mean(no$N_VARIANTS)

head(wgt)
mean(wgt$PI/wgt$N_VARIANTS)
mean(no$PI/no$N_VARIANTS)



#gene ratio
ratio=27919/5424 #=5.15

##box plot of pai genetic diversity
#consider SNP density
boxplot(as.numeric((wgt$PI/wgt$N_VARIANTS)),as.numeric(no$PI/no$N_VARIANTS),
        col=c("purple","orange"),
        ylab="Genetic diversity",
        main="Box plot of weighted genetic diversity PI/N",outline=FALSE,
        xlab=c("WGT gene                                   None WGT gene"))

#consider gene ratio
boxplot(as.numeric((wgt$PI)/ratio),as.numeric(no$PI),
        col=c("purple","orange"),
        ylab="Genetic diversity",
        main="Box plot of weighted genetic diversity PI/N/(wgt/nwgt)",outline=FALSE,
        xlab=c("WGT gene                                   None WGT gene"))

t.test(wgt$PI/wgt$N_VARIANTS,no$PI/no$N_VARIANTS)
#: t = 102.31, df = 14360, p-value < 2.2e-16

t.test(wgt$PI,no$PI)


#=========================================below useless


#per site


#remove 0 diversity loci
# 7243 in WGT
# 1260 in none -WGT
wgt<-read.table(file="site_pi_27919WGT.sites.pi",header = TRUE)
no<-read.table(file="site_pi_5424noneWGT.sites.pi",header = TRUE)

head(wgt)
#mean SNP number per window
mean(wgt$N_VARIANTS)
mean(no$N_VARIANTS)

head(wgt)
mean(wgt$PI)
mean(no$PI)


##box plot of pai genetic diversity
boxplot(as.numeric(wgt$PI),as.numeric(no$PI),
        col=c("purple","orange"),
        ylab="Genetic diversity",
        main="Box plot of genetic diversity",outline=FALSE,
        xlab=c("WGT gene       None WGT gene"))

t.test(wgt$N_VARIANTS,no$N_VARIANTS)
#: t = 163.63, df = 10871, p-value < 2.2e-16

t.test(wgt$PI,no$PI)


