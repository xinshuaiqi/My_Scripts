# note for all linear regression modeling 

head(mtcars)
m0<-lm(mpg~hp+wt+disp,data=mtcars)
m1<-lm(mpg~hp+wt,data=mtcars)
summary(m1)
summary(m1)[[8]]  # degree of scatter
summary(m1)$r.squared
summary(m1)$adj.r.squared
summary(lm(Y~X))[[4]][4] # The standard error of the slope

anova(m1)
anova(m0,m1)

confint(m1) # estimation of unreliability

resid(m0)
coef(m0)[1]# intercept
coef(m0)[2]# slope

lm.D9$coefficients
lm.D9$effects
lm.D9$model

plot(x,y)
abine(lm(y~x))

# t.test: the siginificance of the slope

plot(lm.D9, las = 1)
par(mfrow=c(2,2));plot(m0)   #model check
# find the best model
step(m1, direction = "both")

dffits(m0) # remove this data and its impact on Y prediction  杠杆点 impact on R^2

dfbetas(m0) # remove the data impact on the slope. 影响点

predict(m0,newdata=list(hp = 110, wt = 3, disp=200)) 
abline(m0)


# logistic regression 
library(faraway)
data(sat)
head(sat)
dim(sat)

plot(sat$total, sat$math)
passlm<-lm(total~ math,data=sat)
abline(passlm)

passglm<-glm(total~salary,data=sat,family = "binomial")
glm(Y~x1+x2, family = binomial,data = )

    ### example
url <- 'https://onlinecourses.science.psu.edu/stat857/sites/onlinecourses.science.psu.edu.stat857/files/german_credit.csv'
GC <- read.csv(url, header = TRUE, sep = ',')
head(GC)


# logistic regression
GC_LR<-glm(Creditability~., data=GC, family = binomial())
summary(GC_LR)
# get predicted values
LR_Pred<-predict(GC_LR,type="response")

# create ROC curve
library(ROCR)
GC_pred<-prediction(LR_Pred,GC$Creditability)
GC_pref<-performance(GC_pred,"tpr","fpr")
plot(GC_pref)




#### variable selection
use "step" function in R

