# this notes including many useful phenotype summary in R
# these codes are from CROP454, textbook 
# E:\mega\__编程 生信 统计\CROPS545 
# @@@@TEXTBOOK.pdf
# Page 32 


# then you can call the column names
attach(mtcars)

# how to summarized data
apply(mtcars,2,mean)
apply(mtcars,2,sd)

# Compute Summary Statistics of Data Subsets
aggregate(mtcars,list(mtcars$cyl),FUN=mean)

# frequency
table(mtcars$cyl)

#
hist(mtcars$mpg,breaks=10)

boxplot(mpg~cyl)

# check normality of data distribution
hist(hp)
shapiro.test(hp)

# qqplot
require(graphics)
qqnorm(mtcars$mpg)
qqline(mtcars$mpg)

# 
library(MASS)
?MASS


















