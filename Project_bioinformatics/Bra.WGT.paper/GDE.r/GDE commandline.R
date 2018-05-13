
## this is a backet of analysis for GDE
## by Xinshuai Qi
# replace the EUCA_XXX part for your own analysis
# qxs@email.arizona.edu

# all the Raw data are saved on ratel.


#cd diff_out
#R
#install.packages("cummeRbund")
getwd()
setwd("C:/Users/qxs/Desktop/diff_out_EUCA_ch")
library("cummeRbund")
cuff2<-readCufflinks(gtfFile="../Brapa_gene_v1.5.gtf", genome="v1.5" )
cuff2

##s.y.l.v
2 samples
47879 genes
139686 isoforms
92327 TSS
40904 CDS
47879 promoters
92327 splicing
35254 relCDS

##t.r.i.l

##c.h.

##p.k.

#dispersion Plot
#disp<-dispersionPlot(genes(cuff2))
#disp

#To assess the distributions of FPKM scores across samples, 
#you can use the csDensity plot
#dens<-csDensity(genes(cuff2))
#dens

# outlier replicates boxplot
#b<-csBoxplot(genes(cuff2),replicates=T)
#b

#s<-csScatterMatrix(genes(cuff2))
#s
S<-csScatter(genes(cuff2),"EUCA","ch",smooth=T)
S
pdf("csScatter_EUCA_ch.pdf")
plot(
  S
)
dev.off()

#The squared coefficient of variation 
SCV<-fpkmSCVPlot(genes(cuff2),FPKMLowerBound=1, showPool = FALSE)
SCV
pdf("SCV_EUCA_ch.pdf")
plot(
SCV
)
dev.off()


#sig
sigGeneIds<-getSig(cuff2,alpha=0.05,level="genes")
sigGeneIds
length(sigGeneIds)
#1402 s.ylv
#
#
#972 ch

#save GDE information
diffGenes<-getGenes(cuff2,sigGeneIds)
diffGenes

names<-featureNames(diffGenes)
row.names(names)=names$tracking_id
diffGenesNames<-as.matrix(names)
diffGenesNames<-diffGenesNames[,-1]
# get the data for the significant genes
diffGenesData<-diffData(diffGenes)
row.names(diffGenesData)=diffGenesData$gene_id
diffGenesData<-diffGenesData[,-1]
# merge the two matrices by row names
diffGenesOutput<-merge(diffGenesNames,diffGenesData,by="row.names")
head(diffGenesOutput)
write.table(diffGenesOutput,file="diffGenesOutput_EUCA_ch.csv",quote=F,sep="\t")

#make vocano plot
v<-csVolcanoMatrix(genes(cuff2),"EUCA","pk")
pdf("vocano-plot_EUCA_ch.pdf")
plot(
  v 
)
dev.off()


#gene.features<-annotation(genes(cuff2))
#head(gene.features)
#nrow(gene.features)

gene.fpkm<-fpkm(genes(cuff2))
head(gene.fpkm)
tail(gene.fpkm)
write.table(diffGenesOutput,file="fpkm_EUCA_ch.csv",quote=F,sep="\t")

#head map
myGenes<-getGenes(cuff2,sigGeneIds)  #.....
myGenes
h<-csHeatmap(myGenes,cluster='both',replicates=T,heatscale= c(low='yellow',mid='red',high='black'))
h <- h + theme(axis.text.x=element_text(size=5),axis.text.y=element_text(size=1))
pdf("Heatmap_EUCA_ch.pdf")
plot(
  h  
)
dev.off()

#den tree of mygens
myGenes.dend.rep<-csDendro(myGenes,replicates=T)
pdf("Dendrogram.myGenes.rep_EUCA_ch.pdf")
plot(
  myGenes.dend.rep
)
dev.off()


#PCA
genes.MDS.rep<-MDSplot(genes(cuff2),replicates=T)
pdf("genes.MDS.rep_EUCA_ch.pdf")
plot(
  genes.MDS.rep
)
dev.off()

#genes.PCA.rep<-PCAplot(genes(cuff2),replicates=T,
#                       showPoints=F)
#genes.PCA.rep


# myDistHeat<-csDistHeat(genes(cuff2))
# pdf("myDistHeat.pdf")
# plot(
#   myDistHeat 
# )
# dev.off()
# 
# mySigMat<-sigMatrix(cuff2,level='genes',alpha=0.05)

