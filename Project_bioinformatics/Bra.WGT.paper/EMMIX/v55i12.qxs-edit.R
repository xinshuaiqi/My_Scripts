#################
# preliminaries #
#################

library("EMMIXuskew")

##################################
# Data Simulation - Section 4.1  #
##################################
RNGversion("3.0.2")
set.seed(12345)
rfmmst(1, 500, c(1,2), diag(2), c(-1,1), 4, 1)
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <-  c(0.25, 0.25, 0.5)
rfmmst(3, 500, known=obj)


########################################
# Fitting Lymphoma Data - Section 4.2  #
########################################
data("Lympho")
RNGversion("3.0.2");  set.seed(12345)
LymphoSample <- Lympho[sample(1:nrow(Lympho), 500),]
Fit <- fmmst(1, LymphoSample)
summary(Fit)
print(Fit)

obj2 <- list()
obj2$mu <- list(c(5,6))
fmmst(1, LymphoSample, initial=obj2)

fmmst(1, LymphoSample, nkmeans=50)

###################################
# Fitting AIS Data - Section 4.3  #
###################################
data("ais")
Fit2 <- fmmst(2, ais[,c(2,12)], print=TRUE)
table(ais$Sex, Fit2$clusters)

library("mixsmsn")
RNGversion("3.0.2");  set.seed(1)
Fit3 <- smsn.mmix(ais[c(2, 12)], g = 2, family = "Skew.t", group = TRUE)
table(ais$Sex, Fit3$group)

library("EMMIXskew")
Fit4 <- EmSkew(ais[c(2,12)], 2, "mst", debug = FALSE)
table(ais$Sex, Fit4$clust)

################################
# Skewness Test - Section 4.5  #
################################
Fit5 <- fmmt(2, ais[,c(2,12)])
table(ais$Sex, Fit5$clusters)
delta.test(Fit2, Fit5)

########################################
# Discriminant Analysis - Section 4.5  #
########################################
RNGversion("3.0.2")
set.seed(732)    
X <- rfmmst(3, 200, known=obj)
Ind <- sample(1:nrow(X),175)
train <- X[Ind,]
test <- X[-Ind,]
trainmodel <- fmmst(3, train[,1:2])
results <- fmmstDA(3, test[,1:2], trainmodel)
table(test[,3], results)


################################
# Contour Plots - Section 4.5  #
################################

# Lymphoma data
fmmst.contour.2d(Lympho, model=Fit, map="heat", xlab="SLP76", ylab="ZAP70")

#AIS data
label <- abs(unclass(ais$Sex) - 2)
fmmst.contour.2d(ais[,c(2,12)], model=Fit2, clusters=label, xlab="Ht", ylab="Bfat")

#Discriminant analysis data
fmmst.contour.2d(X, model=trainmodel, clusters=X[,3], map="cluster", component=1:3)

# DLBCL data
DLBCL <- read.table("DLBCL.txt", header=TRUE)       
true.clusters <- read.table("DLBCL.clusters.txt", header=T)$true.clusters
plot.parameters <- dget("plot.parameters.txt")

library("rgl")

plot3d(DLBCL[,1], DLBCL[,2], DLBCL[,3],           
    col=c("blue", "red", "green", "blue", "magenta")[true.clusters+1], 
    xlab="CD3", ylab="CD5", zlab="CD19",     
    xlim=range(DLBCL[,1]+c(-1,1)), ylim=range(DLBCL[,2]+c(-1,1)), zlim=range(DLBCL[,3]+c(-1,1)))

par3d(plot.parameters)       #for identical graphical parameters 


#EMMIXuskew
RNGversion("3.0.2")
set.seed(53)

Fit6 <- fmmst(4, DLBCL, nkmeans=1)         #nkmeans=1 so that the specified seed is used
fmmst.contour.3d(DLBCL, model = Fit6, level = 0.985, drawpoints = FALSE,   
  xlab="CD3", ylab="CD5", zlab="CD19", component=1:4, grid=50)                 
error.rate(true.clusters[true.clusters!=0], Fit6$clusters[true.clusters!=0])    #error.rate is provided by EMMIXskew


#flowClust
library("flowClust")
Fit7 <- flowClust(DLBCL,K=4,nu.est=2)   
flowClust.clusters <- as.numeric(apply(Fit7@z,1,which.max))
error.rate(true.clusters[true.clusters!=0], flowClust.clusters[true.clusters!=0])

#flowMeans
library("flowMeans")
Fit8 <- flowMeans(DLBCL, c("CD3",  "CD5", "CD19"), MaxN = 4, NumC = 4)
flowMeans.clusters <- as.numeric(Fit8@Label)
error.rate(true.clusters[true.clusters!=0], flowMeans.clusters[true.clusters!=0])

# Instructions for using FLAME
# 1) register for FLAME on http://www.broadinstitute.org/cancer/software/genepattern/modules/FLAME
# 2) Zip the file "DLBCL.txt" into a zip file called "DLBCL.zip"
# 3) log on to FLAME, choose FLAMEPreprocess from the panel on the left.
#    Upload the zip file produced in the previous step.
#    Set the parameters as follows: 
#        file type:        txt
#        channels:         1, 2, 3
#        channel names:    CD3, CD5, CD19
#        scatter channels: 0
#        transformation:   none
#    For all other parameters, leave it as default.  
#    Press the 'Run' button.
#
# 4) Once Step 3 had completed, a zip file with the postfix ".PreprocessedData.zip" will be produced. 
#    Click on the small arrow button next to the zip file and choose FLAMEMixtureModel.
#    Set the paramemeters as follows:
#         g.min:           4
#         g.max:           4
#         density:         skew t
#         channels to cluster: 1, 2, 3   
#    For all other parameters, leave it as default.  
#    Press the 'Run' button.
#
#  5) Once Step 4 had completed, a zip file with the postfix ".PreprocessedData.MixtureModel.zip" will be produced.
#     Download the zip file. Unzip and extract the text file with postfix ".membership.txt" into the current working directory.
#     Run the following code to calculate the misclassificaton rate of the output labels.
#

FLAME.clusters <- as.numeric(read.table("DLBCL.mst.4.membership.txt", header=TRUE)$cluster)
error.rate(true.clusters[true.clusters!=0], FLAME.clusters[true.clusters!=0])
