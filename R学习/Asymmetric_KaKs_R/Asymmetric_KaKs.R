# This script is used to analysis substitution rate difference between paleolog and non-paleolog in Brassica rap
# This script is a summary of all information
# intergrate all the information into one table 
# Aug 2017 by Xinshuai Qi


getwd()
setwd("C:/Users/qxs/Desktop")

# #TN
# mikeKaKs="brassica_codemloutput/codeml_outputtrn_ath.txt"
# hit="trn" # mike's term, need to be replaced
# mikeindex="index/indices.TN28-127.scafSeq"
# blast="blast_Brapa/TN28-127.blast.out"
# 
# #PC
# mikeKaKs="brassica_codemloutput/codeml_outputchc_ath.txt"
# hit="chc" # mike's term, need to be replaced
# mikeindex="index/indices.PC106-127.scafSeq"
# blast="blast_Brapa/PC106-127.blast.out"



###############################################
# define the function
# this function will load all the input files, including files such as:
# mikeKaKs="brassica_codemloutput/codeml_outputchc_ath.txt"
# hit="chc" # mike's term, need to be replaced
# mikeindex="index/indices.PC106-127.scafSeq"
# blast="blast_Brapa/PC106-127.blast.out"

eachgroup<-function(mikeKaKs,hit,mikeindex,blast){
  
# read Mike's data
TN.Ath<-read.table(mikeKaKs,sep="\t",header=T) 
colnames(TN.Ath)<-c("Queryath","Hit","Kaathvshit","Ksathvs","Ka.Ksathvshit")
# replace
TN.Ath$Hit<-gsub(hit,'',TN.Ath$Hit)   #you may need to replace this line
# only keep useful info
TN.Ath<-TN.Ath[,1:5]
head(TN.Ath)



#read Mike's gene code
TN.code<-read.table(mikeindex,sep="\t",header=F) 
colnames(TN.code)<-c("code","scaf")
head(TN.code)
# TN.code$V2<-gsub('>','',TN.code$V2) 
# TN.code$V2<-gsub(' ','  ',TN.code$V2) 
# #split V2
# library(stringr)
# TN.code$V2<-str_split_fixed(TN.code$V2, "  ", 4)
# ncol(TN.code)
# TN.code<-subset(TN.code, select=c("V1","V2.1"))



# read blast out
TN.blast<-read.table(blast,sep="\t",header=F) 
TN.blast$V2<-gsub('.*(Bra\\d*)\\|.*', '\\1',TN.blast$V2) 
TN.blast<-TN.blast[,c(1:2)]
colnames(TN.blast)<-c('scaf','Bra')
#each scaffold seq may has multiple match in the B. rapa genome.
# so I will only keep the first matches.
TN.blast<-TN.blast[!duplicated(TN.blast$scaf),]
head(TN.blast)


#paleolog annotation
paleolog<-read.table("paleolog.txt")
colnames(paleolog)<-c("Bra","paleolog")
head(paleolog)



#merge all data into one
All<-merge(TN.code,TN.Ath,by.x="code",by.y = "Hit",all.y=F)
All<-merge(All,TN.blast,by.x="scaf",by.y = "scaf",all.y=FALSE,all.x=FALSE)
All<-merge(All,paleolog,by.x="Bra",by.y = "Bra",all.y=FALSE,all.x=FALSE)
head(All)

All<-unique(All)
return(All)
}
###############################################



##### vs Ath
#TN
Ath_TN<-eachgroup( "brassica_codemloutput/codeml_outputtrn_ath.txt","trn",
                  "index/indices.TN28-127.scafSeq","blast_Brapa/TN28-127.blast.out");head(Ath_TN)
#PC pak choi
Ath_PC<-eachgroup( "brassica_codemloutput/codeml_outputpak_ath.txt","pak",    
                   "index/indices.PC106-127.scafSeq","blast_Brapa/PC106-127.blast.out");head(Ath_PC)

#CC
Ath_CC<-eachgroup( "brassica_codemloutput/codeml_outputchc_ath.txt","chc",    
                   "index/indices.CC68-127.scafSeq","blast_Brapa/CC68-127.blast.out");head(Ath_PC)

#IS sarson
Ath_IS<-eachgroup( "brassica_codemloutput/codeml_outputsar_ath.txt","sar",    
                   "index/indices.IS136-127.scafSeq","blast_Brapa/IS136-127.blast.out");head(Ath_PC)

#RP rapini
Ath_RP<-eachgroup( "brassica_codemloutput/codeml_outputrap_ath.txt","rap",    
                   "index/indices.RP153-127.scafSeq","blast_Brapa/RP153-127.blast.out");head(Ath_PC)




##### vs Aar
#TN
Aar_TN<-eachgroup( "brassica_codemloutput/codeml_outputtrn_aar.txt","trn",
                   "index/indices.TN28-127.scafSeq","blast_Brapa/TN28-127.blast.out");head(Aar_TN)
#PC pak choi
Aar_PC<-eachgroup( "brassica_codemloutput/codeml_outputpak_aar.txt","pak",    
                   "index/indices.PC106-127.scafSeq","blast_Brapa/PC106-127.blast.out");head(Aar_PC)

#CC
Aar_CC<-eachgroup( "brassica_codemloutput/codeml_outputchc_aar.txt","chc",    
                   "index/indices.CC68-127.scafSeq","blast_Brapa/CC68-127.blast.out");head(Aar_PC)

#IS sarson
Aar_IS<-eachgroup( "brassica_codemloutput/codeml_outputsar_aar.txt","sar",    
                   "index/indices.IS136-127.scafSeq","blast_Brapa/IS136-127.blast.out");head(Aar_PC)

#RP rapini
Aar_RP<-eachgroup( "brassica_codemloutput/codeml_outputrap_aar.txt","rap",    
                   "index/indices.RP153-127.scafSeq","blast_Brapa/RP153-127.blast.out");head(Aar_PC)


write.table(Ath_TN,file="Ath_TN.csv",sep=",",row.names=F)
write.table(Ath_RP,file="Ath_RP.csv",sep=",",row.names=F)
write.table(Ath_IS,file="Ath_IS.csv",sep=",",row.names=F)
write.table(Ath_PC,file="Ath_PC.csv",sep=",",row.names=F)
write.table(Ath_CC,file="Ath_CC.csv",sep=",",row.names=F)

write.table(Aar_TN,file="Aar_TN.csv",sep=",",row.names=F)
write.table(Aar_RP,file="Aar_RP.csv",sep=",",row.names=F)
write.table(Aar_IS,file="Aar_IS.csv",sep=",",row.names=F)
write.table(Aar_PC,file="Aar_PC.csv",sep=",",row.names=F)
write.table(Aar_CC,file="Aar_CC.csv",sep=",",row.names=F)




mu <- ddply(Ath_TN, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Ath_RP, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu 
mu <- ddply(Ath_IS, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu 
mu <- ddply(Ath_PC, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Ath_CC, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu

mu <- ddply(Aar_TN, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Aar_RP, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Aar_IS, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Aar_PC, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu
mu <- ddply(Aar_CC, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) ;mu

##########  Now I have table for each dataset

completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}

# library(dplyr)
# WGT_f<-filter(Ath_TN,paleolog=="WGT-paleolog")
# mean(WGT_f$Ka.Ksathvshit,na.rm = T)
# non_f<-filter(Ath_TN,paleolog=="Non-paleolog")
# mean(non_f$Ka.Ksathvshit,na.rm = T)
# 
# library(plyr)

kaksplot<-function(Ath_TN)
  {
Ath_TN <- completeFun(Ath_TN, "paleolog")
mu <- ddply(Ath_TN, "paleolog", summarise, grp.mean=mean(Ka.Ksathvshit,na.rm = T)) #calculate mean value 
#head(mu)
plot_Ath_TN<-ggplot(Ath_TN,aes(x = Ka.Ksathvshit,color=paleolog,fill=paleolog))+
  geom_density(alpha=.3)+xlim(0,1)+
  ggtitle("Ath_vs_??") + theme(plot.title = element_text(lineheight=.8, face="bold")) +
  geom_vline(data=mu, aes(xintercept=grp.mean,color=paleolog),linetype="dashed")+
  annotate("text", x = 0.5, y = 4,   label = paste("mean WGT:",round(mu$grp.mean[2],3)),color="#00BFC4")+
  annotate("text", x = 0.5, y = 3, label = paste("mean Non:",round(mu$grp.mean[1],3)),color="#F8766D")+
  labs(x="Ka/Ks")
return(plot_Ath_TN)
 }

plot_Ath_TN<-kaksplot(Ath_TN);plot_Ath_TN
plot_Ath_RP<-kaksplot(Ath_RP);plot_Ath_RP
plot_Ath_IS<-kaksplot(Ath_IS);plot_Ath_IS
plot_Ath_PC<-kaksplot(Ath_PC);plot_Ath_PC
plot_Ath_CC<-kaksplot(Ath_CC);plot_Ath_CC

plot_Aar_TN<-kaksplot(Aar_TN);plot_Aar_TN
plot_Aar_RP<-kaksplot(Aar_RP);plot_Aar_RP
plot_Aar_IS<-kaksplot(Aar_IS);plot_Aar_IS
plot_Aar_PC<-kaksplot(Aar_PC);plot_Aar_PC
plot_Aar_CC<-kaksplot(Aar_CC);plot_Aar_CC

#############################################################################
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
#############################################################################


library(ggplot2)
multiplot(plot_Ath_TN, plot_Ath_RP,plot_Ath_IS,plot_Ath_PC, plot_Ath_CC,
          plot_Aar_TN, plot_Aar_RP,plot_Aar_IS,plot_Aar_PC, plot_Aar_CC,cols=2)



#










# 
# 
# library(gridExtra)
# pdf("plots.pdf", onefile = TRUE)
# do.call("grid.arrange", c(plot_Ath_TN,plot_Ath_TN))  
# dev.off()
# 
# 
# 
# All_WGT<-subset(All, All$paleolog=='WGT-paleolog')
# All_non<-subset(All, All$paleolog=='Non-paleolog')
# 
# summary(All_WGT$Ka.Ksathvstrn)
# summary(All_non$Ka.Ksathvstrn)
# 
# hist(All_WGT$Ka.Ksathvstrn,xlim=c(0,1),breaks=10000)
# hist(All_non$Ka.Ksathvstrn,xlim=c(0,1),breaks=10000)
# 
# library(sm)
# wgt<-density(All_WGT$Ka.Ksathvstrn)
# plot(wgt)
# polygon(wgt, col="red", border="blue")
# 
# non<-density(All_non$Ka.Ksathvstrn,na.rm = TRUE)
# plot(non)
# 
# sm.density.compare(All_WGT$Ka.Ksathvstrn, All_non$Ka.Ksathvstrn, xlab="")
# sm.density.compare(wgt, non, xlab="")
# 
# mean(All_WGT$Ka.Ksathvstrn,na.rm = TRUE)
# mean(All_non$Ka.Ksathvstrn,na.rm = TRUE)
# 
# summary(All_WGT$Ka.Ksathvstrn,na.rm = TRUE)
# summary(All_non$Ka.Ksathvstrn,na.rm = TRUE)
# 
# library(ggplot2)
# All[,(is.na(All$paleolog))]
#         
# 
# completeFun <- function(data, desiredCols) {
#   completeVec <- complete.cases(data[, desiredCols])
#   return(data[completeVec, ])
# }
# 
# 
# All <- completeFun(All, "paleolog")
#              
#              
#  
# ggplot(All,aes(x = Ka.Ksathvstrn,color=paleolog))+geom_density()+xlim(0,1)
# 
# 
# 
# ggplot(All_non,aes(x = Ka.Ksathvstrn))+geom_density()
# 
# 
# qplot(All_non$Ka.Ksathvstrn)+geom_density()
# 
# 
# 
# 
# 

# test some ideas

## Why the Ath_TN result differ from others. 
WGT<-filter(Ath_TN, paleolog == "WGT-paleolog")
head(WGT)
mean(WGT$Kaathvshit)
mean(WGT$Ka.Ksathvshit)

Non<-filter(Ath_TN, paleolog == "Non-paleolog")
mean(Non$Ka.Ksathvshit,na.rm = T)


# compare the Ks value
mu <- ddply(Ath_TN, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 3.786947
2 WGT-paleolog 1.838256
3         <NA> 2.640747

mu <- ddply(Ath_RP, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu 
paleolog grp.mean
1 Non-paleolog 3.375923
2 WGT-paleolog 2.056608
3         <NA> 2.352949

mu <- ddply(Ath_IS, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu 
paleolog grp.mean
1 Non-paleolog 2.842580
2 WGT-paleolog 1.815586
3         <NA> 2.137540

mu <- ddply(Ath_PC, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 4.820539
2 WGT-paleolog 1.833155
3         <NA> 2.398020

mu <- ddply(Ath_CC, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 3.313390
2 WGT-paleolog 1.767134
3         <NA> 2.294775


mu <- ddply(Aar_TN, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 5.298149
2 WGT-paleolog 2.212116
3         <NA> 2.841303


mu <- ddply(Aar_RP, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 5.062056
2 WGT-paleolog 2.467739
3         <NA> 3.250878


mu <- ddply(Aar_IS, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 4.544076
2 WGT-paleolog 2.465198
3         <NA> 3.073332


mu <- ddply(Aar_PC, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 6.733723
2 WGT-paleolog 2.513783
3         <NA> 2.788145


mu <- ddply(Aar_CC, "paleolog", summarise, grp.mean=mean(Ksathvs,na.rm = T)) ;mu
paleolog grp.mean
1 Non-paleolog 5.268320
2 WGT-paleolog 2.150238
3         <NA> 3.152551



## Ka 
mu <- ddply(Ath_TN, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.1603335
2 WGT-paleolog 0.1005918
3         <NA> 0.1262443
> mu <- ddply(Ath_RP, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu 
paleolog  grp.mean
1 Non-paleolog 0.1567419
2 WGT-paleolog 0.1019142
3         <NA> 0.1400900
> mu <- ddply(Ath_IS, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu 
paleolog  grp.mean
1 Non-paleolog 0.1475796
2 WGT-paleolog 0.1000044
3         <NA> 0.1165922
> mu <- ddply(Ath_PC, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.1731898
2 WGT-paleolog 0.1033859
3         <NA> 0.1312882
> mu <- ddply(Ath_CC, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog   grp.mean
1 Non-paleolog 0.14361838
2 WGT-paleolog 0.09950306
3         <NA> 0.12548569
> 
  > mu <- ddply(Aar_TN, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.2001938
2 WGT-paleolog 0.1197577
3         <NA> 0.1509410
> mu <- ddply(Aar_RP, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.1945952
2 WGT-paleolog 0.1247189
3         <NA> 0.1486244
> mu <- ddply(Aar_IS, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.2711070
2 WGT-paleolog 0.1262540
3         <NA> 0.1424897
> mu <- ddply(Aar_PC, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.2219288
2 WGT-paleolog 0.1313622
3         <NA> 0.1451166
> mu <- ddply(Aar_CC, "paleolog", summarise, grp.mean=mean(Kaathvshit,na.rm = T)) ;mu
paleolog  grp.mean
1 Non-paleolog 0.1839427
2 WGT-paleolog 0.1211872
3         <NA> 0.1461863
> 







