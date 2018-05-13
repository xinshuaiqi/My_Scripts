# this script will run through the files and calculate mean gene pi for each file 

setwd("C:/Users/qxs/Desktop/gene.pi.41020")
files <- list.files(path="C:/Users/qxs/Desktop/gene.pi.41020", pattern="*.out", full.names=T, recursive=FALSE)

lapply(files, function(x) {
  t <- read.table(x, header=F) # load file
  # apply function
  #print(head(t[,5]))
  #print(mean(t[,5]))
  m = mean(t[,5])
  #out <- function(t)
  # write to file
  write.table(data.frame(x,m),"summary.out", sep="\t", quote=F, row.names=F, col.names=F,append =TRUE)
})




#################
setwd("C:/Users/qxs/Desktop/ghost.TN.genes")
files <- list.files(path="C:/Users/qxs/Desktop/ghost.TN.genes", pattern="*.out", full.names=T, recursive=FALSE)

lapply(files, function(x) {
  t <- read.table(x, header=F) # load file
  # apply function
  #print(head(t[,5]))
  #print(mean(t[,5]))
  m = mean(t[,5])
  #out <- function(t)
    # write to file
    write.table(data.frame(x,m),"summary.out", sep="\t", quote=F, row.names=F, col.names=F,append =TRUE)
})



####################

setwd("C:/Users/qxs/Desktop/ghost TN-PC-CC.genes")
files <- list.files(path="C:/Users/qxs/Desktop/ghost TN-PC-CC.genes", pattern="*.out", full.names=T, recursive=FALSE)

lapply(files, function(x) {
  t <- read.table(x, header=F) # load file
  # apply function
  #print(head(t[,5]))
  #print(mean(t[,5]))
  m = mean(t[,5])
  #out <- function(t)
  # write to file
  write.table(data.frame(x,m),"summary.out", sep="\t", quote=F, row.names=F, col.names=F,append =TRUE)
})




