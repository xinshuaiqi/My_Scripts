# rrBLUP

library(rrBLUP)
setwd("E:/GoogleDrive/My_Scripts/R学习/rrBLUP")


Markers<-as.matrix(read.table("snp.txt"))
head(Markers[1:3,1:3])

Pheno<-as.matrix(read.table("traits.txt",header=T))
head(Pheno)

#imputing markers using the population mean for that marker
# missing is 0.14% 
# markers with >50% missing data are removed
impute=A.mat(Markers,max.missing=0.5,impute.method="mean",return.imputed=T)
head(impute)

#Rename imputed marker matrix as Markers_impute
Markers_impute=impute$imputed

#which(is.na(Markers_impute) == T)
Markers_impute2=Markers_impute[,-c(169,562)]
head(Markers_impute2)

# set train and validation populations
train = as.matrix(sample(1:96,58))
head(train)

test <- setdiff(1:96,train)
test

Pheno_train = Pheno[train, ]
m_train = Markers_impute2[train, ]

Pheno_valid = Pheno[test, ]
m_valid = Markers_impute2[test, ]

# Run Mixed.solve
yield = (Pheno_train[,1])
yield_answer= mixed.solve(yield,Z = m_train, K = NULL, SE =FALSE, return.Hinv= FALSE)


YLD <-yield_answer$u
e = as.matrix(YLD)
head(e) # Marker effect of the first five markers

# predict yield based on the marker effeects 

pred_yield_valid = m_valid %*% e 
pred_yield = (pred_yield_valid[,1])+ yield_answer$beta
pred_yield

# Determine the Correlation Accuracy

traits = 1
cycles =500
accuracy = matrix (nrow = cycles, ncol = traits) 
for (r in 1:cycles){
  train = as.matrix(sample(1:96,38))
  test = setdiff(1:96, train)
  Pheno_train = Pheno[train,]
  m_valid = Markers_impute2[test,]
  
  Yield = (Pheno_train[,1])
  yield_answer= mixed.solve(yield,Z = m_train, K = NULL, SE =FALSE, return.Hinv= FALSE)
  
  YLD <-yield_answer$u
  e = as.matrix(YLD)
  
  pred_yield_valid = m_valid %*% e 
  pred_yield = (pred_yield_valid[,1])+ yield_answer$beta
  pred_yield
  
  yield_valid = Pheno_valid[,1]
  accuracy[r,1] <-cor (pred_yield_valid,yield_valid,use="complete")
}

mean(accuracy) # 0.49


