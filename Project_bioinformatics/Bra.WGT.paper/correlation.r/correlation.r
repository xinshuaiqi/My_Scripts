getwd()

#remember to edit the input file before run
#  A01 1 1e+05	4   =>  A01_1_1e+05	4

mk<-read.table("92MK.gene.list.out.counts",sep = "\t",header = F)
swd<-read.table("3387SweeD.outlier.gene.list.out.counts",sep = "\t",header = F)
no<-read.table("5424None.WGT.gene.list.out.counts",sep = "\t",header = F)
wgt<-read.table("27919.WGT.gene.list.out.counts",sep = "\t",header = F)
#gde<-read.table("6801.GDE.gene.list.out.counts",sep = "\t",header = F)
gde<-read.table("7813GDEunique.gene.list.out.counts",sep = "\t",header = F)
class(mk)

nrow(mk)
nrow(swd)
nrow(no)
nrow(wgt)
nrow(gde)

nrow(all)

#merge two tables at a time, keep all cases in the new dataset
all=""
all<-merge(wgt,no,by="V1",all=TRUE)
all<-merge(all,swd,by="V1",all=TRUE)
all<-merge(all,mk,by="V1",all=TRUE)
all<-merge(all,gde,by="V1",all=TRUE)

#replaace na with 0
all[is.na(all)]<-0
head(all)
tail(all)
   
# or
  all<-na.omit(all)


#rename col
colnames(all)<-c("pos","WGT gene","none WGT gene","SweeD","MK test","GDE")

write.table(all,file="all",sep="\t")

class(all)
all2<-all[,c(2:6)]
head(all2)


allcor<-cor(all2,method = "spearman")






##plot
library(corrplot)
library(RColorBrewer)
corrplot(allcor,method = "color",#order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))

#P value
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

p.mat <- cor.mtest(all2)
head(p.mat[, 1:5])

col<- colorRampPalette(c("black","darkred", "darkorange4","gray","darkgreen","darkblue","gray1"))(20)
corrplot(allcor, type="lower",method = "ellipse",#order="hclust",
         tl.col="black",col=col
         #col=brewer.pal(n=8, name="RdYlBu")
         )



corrplot(allcor, type="lower",method = "circle",#order="hclust",
         tl.col="black",
          p.mat=p.mat,sig.level = 0.05,#add=TRUE,#insig = "blank",
         col=col,
         #bg="darkgray"
)

corrplot(allcor, type="upper",method = "number",#order="hclust",
         tl.col="black",
         p.mat=p.mat,sig.level = 0.001,add=TRUE,#insig = "blank",
         col=col,
         #bg="darkgray"
)



# corrplot(allcor, method="color", col=col(200),  
#          type="upper", order="hclust", 
#          addCoef.col = "black", # Add coefficient of correlation
#          tl.col="black", tl.srt=45, #Text label color and rotation
#          # Combine with significance
#          p.mat = p.mat, sig.level = 0.05, insig = "blank", 
#          # hide correlation coefficient on the principal diagonal
#          add=TRUE,
#          #diag=FALSE 
# )













library(PerformanceAnalytics)
chart.Correlation(all2,histogram = TRUE,pch=19)




