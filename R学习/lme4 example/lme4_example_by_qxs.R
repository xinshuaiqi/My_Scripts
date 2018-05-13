# lme4 for linear mixed model; GLMM, Nonlinear mixed model
# fixed + random effects

# example
# the average reaction time per day for subjects in a sleep deprivation study

library(lme4)
names(data())
 
str(sleepstudy)
head(sleepstudy)
dim(sleepstudy)
summary(sleepstudy)
plot(sleepstudy)

# estimate the SD of random effects for the intercept and slope
fm1<-lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
summary(fm1)
# REML criterion at convergence: 1743.6
# 
# Scaled residuals: 
#   Min      1Q  Median      3Q     Max 
# -3.9536 -0.4634  0.0231  0.4634  5.1793 
# 
# Random effects:
#   Groups   Name        Variance Std.Dev. Corr
# Subject  (Intercept) 612.09   24.740       
# Days                 35.07    5.922   0.07
# Residual             654.94   25.592  

# Number of obs: 180, groups:  Subject, 18
# 
# Fixed effects:
#   Estimate Std. Error t value
# (Intercept)  251.405      6.825   36.84
# Days          10.467      1.546    6.77
# 
# Correlation of Fixed Effects:
#   (Intr)
# Days -0.138
fm1_thpar<-getME(fm1,"theta")
fm1_thpar

fm1Fun <- update(fm1,devFunOnly=TRUE)
fm1_thpar <- getME(fm1,"theta")

Sv_to_Cv <- lme4:::Sv_to_Cv
Cv_to_Sv <- lme4:::Cv_to_Sv

fm1_spar <- Cv_to_Sv(fm1_thpar,s=sigma(fm1))
all(abs(Sv_to_Cv(fm1_spar,s=fm1_spar[4])-fm1_thpar)<1e-6)

pp <- profile(fm1)
head(pp)
plot(pp)


########################################
#example 2
gm1 <- glmer(cbind(incidence, size - incidence) ~
               period + (1 | herd),
             data = cbpp, family = binomial)
summary(gm1)
# AIC      BIC   logLik deviance df.resid 
# 194.1    204.2    -92.0    184.1       51 
# 
# Scaled residuals: 
#   Min      1Q  Median      3Q     Max 
# -2.3816 -0.7889 -0.2026  0.5142  2.8791 
# 
# Random effects:
#   Groups Name        Variance Std.Dev.
# herd   (Intercept) 0.4123   0.6421  
# Number of obs: 56, groups:  herd, 15
# 
# Fixed effects:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -1.3983     0.2312  -6.048 1.47e-09 ***
#   period2      -0.9919     0.3032  -3.272 0.001068 ** 
#   period3      -1.1282     0.3228  -3.495 0.000474 ***
#   period4      -1.5797     0.4220  -3.743 0.000182 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Correlation of Fixed Effects:
#   (Intr) perid2 perid3
# period2 -0.363              
# period3 -0.340  0.280       
# period4 -0.260  0.213  0.198


## generalized linear mixed model
library(lattice)
xyplot(incidence/size ~ period|herd, cbpp, type=c('g','p','l'),
       layout=c(3,5), index.cond = function(x,y)max(y))
(gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
              data = cbpp, family = binomial))
## using nAGQ=0 only gets close to the optimum
(gm1a <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
               cbpp, binomial, nAGQ = 0))
## using  nAGQ = 9  provides a better evaluation of the deviance
## Currently the internal calculations use the sum of deviance residuals,
## which is not directly comparable with the nAGQ=0 or nAGQ=1 result.
(gm1a <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
               cbpp, binomial, nAGQ = 9))

## GLMM with individual-level variability (accounting for overdispersion)
## For this data set the model is the same as one allowing for a period:herd
## interaction, which the plot indicates could be needed.
cbpp$obs <- 1:nrow(cbpp)
(gm2 <- glmer(cbind(incidence, size - incidence) ~ period +
                (1 | herd) +  (1|obs),
              family = binomial, data = cbpp))
anova(gm1,gm2)

## glmer and glm log-likelihoods are consistent
gm1Devfun <- update(gm1,devFunOnly=TRUE)
gm0 <- glm(cbind(incidence, size - incidence) ~ period,
           family = binomial, data = cbpp)
## evaluate GLMM deviance at RE variance=theta=0, beta=(GLM coeffs)
gm1Dev0 <- gm1Devfun(c(0,coef(gm0)))
## compare
stopifnot(all.equal(gm1Dev0,c(-2*logLik(gm0))))
## the toenail oncholysis data from Backer et al 1998
## these data are notoriously difficult to fit
## Not run: 
if (require("HSAUR2")) {
  gm2 <- glmer(outcome~treatment*visit+(1|patientID),
               data=toenail,
               family=binomial,nAGQ=20)
}



########################################
#example 3
library(lme4)
df_lme<-lmer(Height~1+Block+(1|Family),data=tree)
print(df_lme)
anova(df_lme)  ####求方差
ranef(df_lme)  ####求随机效应的BLUP值
fixef(df_lme)  ####求固定效应的BLUE值

###################nlme包中运行的blue和blup值#######################
library(nlme)
df_nlme <- lme(Height~1+Block,random = ~1|Family,data=tree)
print(df_nlme)
anova(df_nlme)
random.effects(df_nlme)

fixed.effects(df_nlme)


########################################
# example 4 Oats

# refer: http://blog.csdn.net/sinat_26917383/article/details/51636011

library(MASS)  
data(oats)  
names(oats) = c('block', 'variety', 'nitrogen', 'yield')  
summary(oats)
plot(oats$yield ~ oats$variety)
plot(oats$yield ~ oats$block)
plot(oats$yield ~ oats$nitrogen)


head(oats)
m1.lme4 <-lmer(yield ~ variety + nitrogen + (1 | block), data = oats)
summary(m1.lme4)
anova(m1.lme4)



########################################
# example 5 catch dragons 
# This example is VERY GOOD !!!!!
# https://ourcodingclub.github.io/2017/03/15/mixed-models.html

load("dragons.RData")

head(dragons)
dim(dragons)
str(dragons)  
boxplot(testScore ~ mountainRange, data = dragons) 
hist(dragons$bodyLength)
dragons$bodyLength2 <- scale(dragons$bodyLength)

plot(dragons$testScore~dragons$bodyLength)
m1<-lm(testScore~bodyLength,data = dragons)
summary(m1)

basic.lm <- lm(testScore ~ bodyLength2, data = dragons)
summary(basic.lm)

library(ggplot2)  # load the package
ggplot(dragons, aes(x = bodyLength, y = testScore)) +
  geom_point() +
  geom_smooth(method = "lm") 

#Plot the residuals - the red line should be nearly flat, like the dashed grey line:
plot(basic.lm, which = 1) 
plot(m1) # four plots: 
  # residuals vs fitted
  # qqplot
  # fotted vs Standardized residuals
  # Leverage ~ Standardized residuals
?plot

# plot testScore ~ bodyLength
ggplot(dragons, aes(x = bodyLength, y = testScore, colour = mountainRange)) +
  geom_point(size = 2) +
  theme_classic() +
  theme(legend.position = "none")

ggplot(aes(bodyLength, testScore, colour = mountainRange), data = dragons) + 
  geom_point() + 
  facet_wrap(~ mountainRange) + 
  xlab("length") + 
  ylab("test score")



# now consider mountain as a fixed effect
mountain.lm <- lm(testScore ~ bodyLength2 + mountainRange, data = dragons)
summary(mountain.lm)

# now mixed model
library(lme4)

mixed.lmer <- lmer(testScore ~ bodyLength2 + (1|mountainRange), data = dragons)
summary(mixed.lmer)
plot(mixed.lmer)
qqnorm(resid(mixed.lmer))
qqline(resid(mixed.lmer))  #

# take the variance for the mountainRange and divide it by the total variance:
339.7/(339.7 + 223.8)  
# So the differences between mountain ranges explain ~60% of the variance. 
# Do keep in mind that’s 60% of variance “left over” after the variance 
# explained by our fixed effects.



# Now let's consider the influence of site
# (how to account for crossed random effects )
# because each mountain may has multiple sample sites
# this is the WRONG way to do it:
mixed.WRONG <- lmer(testScore ~ bodyLength2 + (1|mountainRange) + (1|site),
                    data = dragons)

# this is the right way to do it:
  # add a new column
dragons <- within(dragons, sample <- factor(mountainRange:site))

mixed.lmer2 <- lmer(testScore ~ bodyLength2 + (1|mountainRange) + (1|sample), 
                    data = dragons)  
summary(mixed.lmer2)


ggplot(dragons, aes(x = bodyLength, y = testScore, colour = site)) +
  facet_wrap(~mountainRange, nrow=3) +
  geom_point() +
  theme_classic() +
  geom_line(data = cbind(dragons, pred = predict(mixed.lmer2)), aes(y = pred)) +
  theme(legend.position = "none")

# this is the predicted score for each dragon
pred = predict(mixed.lmer2)
plot(dragons$testScore~pred)




#### Now how to report your model
library(stargazer)
summary(mixed.lmer2)
stargazer(mixed.lmer2, type = "text",
          digits = 3,
          star.cutoffs = c(0.05, 0.01, 0.001),
          digit.separator = "")







