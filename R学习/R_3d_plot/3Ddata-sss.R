
# generate 3D plot for SSS

d<-read.csv("3Ddata-sss.csv")
colnames(d)
dim(d)

d[is.na(d)]<-0

d2<-mapply(c,d[,c(1:3)],d[,c(1,4,5)]);d2<-as.data.frame(d2)
d2<-mapply(c,d2,d[,c(1,6,7)]);d2<-as.data.frame(d2)
d2<-mapply(c,d2,d[,c(1,8,9)]);d2<-as.data.frame(d2)
d2<-mapply(c,d2,d[,c(1,10,11)]);d2<-as.data.frame(d2)
d2<-mapply(c,d2,d[,c(1,12,13)]);d2<-as.data.frame(d2)
d2<-mapply(c,d2,d[,c(1,14,15)]);d2<-as.data.frame(d2)
 
d2<-as.data.frame(d2)
head(d2)
tail(d2)
dim(d2)

library(plotly)
axx <- list(
  nticks = 4,
  range = c(-25,75)
)

axy <- list(
  nticks = 4,
  range = c(-25,75)
)

axz <- list(
  nticks = 4,
  range = c(0,50)
)


plot_ly(d,x=~x,y=~y1,z=~z1,type = 'scatter3d', mode = 'lines',name = 'A1',  
        line = list(color = 'red', width = 1)) %>%
  add_trace(y = ~y2,z=~z2, name = 'A2', 
            line = list(color = 'red', width = 1)) %>%
  add_trace(y = ~y3,z=~z3, name = 'A3', 
            line = list(color = 'red', width = 1)) %>%
  
  add_trace(y = ~y4,z=~z4, name = 'B1', 
            line = list(color = 'blue', width = 1)) %>%
  add_trace(y = ~y5,z=~z5, name = 'B2', 
            line = list(color = 'blue', width = 1)) %>%
  add_trace(y = ~y6,z=~z6, name = 'B3', 
            line = list(color = 'blue', width = 1)) %>%
  
  add_trace(y = ~y7,z=~z7, name = 'C1', 
            line = list(color = 'green', width = 1)) %>%
  add_trace(y = ~y8,z=~z8, name = 'C2', 
            line = list(color = 'green', width = 1)) %>%
  add_trace(y = ~y9,z=~z9, name = 'C3', 
            line = list(color = 'green', width = 1))



%>%
  layout(scene = list(yaxis=axy))
  
  
p<-plot_ly(d2,x=~x,y=~as.factor(y1),z=~z1,type = 'scatter3d', mode = 'lines',color =~y1)
plotly_IMAGE(p, format = "pdf", out_file = "output.pdf")  

## not used approach.
install.packages("plot3D")
library("plot3D")
# http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization

scatter3D(d$x,d$y1, d$z1,  theta=30,phi = 30, bty = "g", type = "l", 
          ticktype = "detailed", lwd = 4)
par(new=TRUE)
scatter3D(d$y2, d$z2, d$x, phi = 0, bty = "g", type = "l", 
          ticktype = "detailed", lwd = 4)
