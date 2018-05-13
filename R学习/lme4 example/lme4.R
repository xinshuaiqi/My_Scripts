# ref
http://lme4.r-forge.r-project.org/lMMwR/lrgprt.pdf

library(lme4)
str(Dyestuff)
head(Dyestuff)

fm01 <- lmer(Yield ~ 1 + (1|Batch), Dyestuff)
fm01
# Linear mixed model fit by REML ['lmerMod']
# Formula: Yield ~ 1 + (1 | Batch)
# Data: Dyestuff
# REML criterion at convergence: 319.6543

# Random effects:
#   Groups   Name        Std.Dev.
# Batch    (Intercept) 42.00   
# Residual             49.51   
# Number of obs: 30, groups:  Batch, 6

# Fixed Effects:
#   (Intercept)  
# 1528 

fm01ML <- lmer(Yield ~ 1 + (1|Batch), Dyestuff, REML=FALSE)
fm01ML

# Linear mixed model fit by maximum likelihood  ['lmerMod']
# Formula: Yield ~ 1 + (1 | Batch)

# Data: Dyestuff
# AIC       BIC    logLik  deviance  df.resid 
# 333.3271  337.5307 -163.6635  327.3271        27 

# Random effects:
#   Groups   Name        Std.Dev.
# Batch    (Intercept) 37.26   
# Residual             49.51   
# Number of obs: 30, groups:  Batch, 6

# Fixed Effects:
#   (Intercept)  
# 1527  

# qxs:
- Generally the REML estimates of variance
components  are  preferred  to  the  ML  estimates.
- the Batch 37.26% are the percentage explained by Batch 
- the Residual are the percentage can not be explained. 


fm02 <- lmer(Yield ~ 1 + (1|Batch), Dyestuff2)
fm02

fm02ML <- lmer(Yield ~ 1 + (1|Batch), Dyestuff2, REML=FALSE)
fm02ML

summary(fm02)

fm02a<-lm(formula = Yield ~ 1, data =Dyestuff2)
summary(fm02a)


pr01<-profile(fm01ML)
xyplot(pr01,aspect=1.3)


# random effects
ranef(fm01ML)

dotplot(ranef(fm01ML, postVar = TRUE))
