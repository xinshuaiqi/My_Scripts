#speraman correlation plot
setwd("D:/R/R_data_qxs/")
data1<-read.csv("spearman.rank.Y.csv")
data1<-na.omit(data1)


cor(data1)
library(corrplot)
M=cor(data1,method = "spearman")
col<- colorRampPalette(c("red", "white", "blue"))(50)
corrplot(M,method="circle",
         type="lower",
         sig.level = 0.01,
         tl.col="black",
         tl.srt=0,
         col=col,
         main="Phenotype data spearman correlation (Y population)",
         insig="blank")
                                          
                                          #install.packages(corrgram)
                                          library(corrgram)
                                          ?corrgram
                                          #1
                                          corrgram(data1,order=TRUE,lower.panel = panel.shade,
                                                   upper.panel = NULL,
                                                   text.panel = panel.txt,
                                                   main="Correlogram of growth related traits",
                                                   font.labels = 7,
                                                   cex.labels = 2
                                                   )
                                          #2
                                          corrgram(data1,order=TRUE,
                                                   lower.panel = panel.ellipse,
                                                   upper.panel = panel.pts,
                                                   text.panel = panel.txt,
                                                   diag.panel = panel.minmax,
                                                   main="Correlogram of growth related traits")
                                          #3
                                          corrgram(data1,order=TRUE,
                                                   lower.panel = panel.ellipse,
                                                   upper.panel = panel.pts,
                                                   text.panel = panel.txt,
                                                   diag.panel = panel.minmax,
                                                   main="Correlogram of growth related traits")
                                          
                                          
                                          
                                          corrgram(mtcars,order=TRUE,lower.panel = panel.shade,
                                                   upper.panel = panel.pie,
                                                   text.panel = panel.txt
                                          )
                                          
                                          corrgram(mtcars,order=TRUE,
                                                   lower.panel = panel.ellipse,
                                                   upper.panel = panel.pts,
                                                   text.panel = panel.txt,
                                                   diag.panel = panel.minmax,
                                                   main="Correlogram of growth related traits")
                                          
                                          
                                          
                                          


#___________________________________________
#W pop
data1<-read.csv("spearman.rank.W.csv")
data1<-na.omit(data1)


cor(data1)


#install.packages(corrgram)
library(corrgram)
?corrgram


library(corrplot)
M=cor(data1,method = "spearman")
col<- colorRampPalette(c("red", "white", "blue"))(50)
corrplot(M,method="circle",
         type="lower",
         sig.level = 0.01,
         tl.col="black",
         tl.srt=0,
         col=col,
         main="Phenotype data spearman correlation (W population)",
         insig="blank")
