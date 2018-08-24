# ref
https://www.youtube.com/watch?v=VhMWPkTbXoY


library(nlme)
data("Oats")
summary(Oats)

str(Oats)
head(Oats)

plot(Oats)

model1 = lm (yield ~ Variety * nitro, data = Oats)
summary(model1)


model2 = lme (yield ~ Variety * nitro, data= Oats, random = ~1 |Block/Variety)
summary(model2)

# AIC goodness of fit, compare different models

coef(model1)
coef(model2)

plot(ranef(model2))
plot(model2)

#======================
# including random effect using lme is neccessary, it's better than lm model.




