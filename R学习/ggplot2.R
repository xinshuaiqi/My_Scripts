# ggplot2

library(ggplot2)

#####################
# 以下内容来自https://www.zhihu.com/question/24779017
#
######################


x <- rnorm(100,14,5) 
y <- x + rnorm(100,0,1) 

ggplot(data= NULL, aes(x = x, y = y)) +  #开始绘图
  geom_point(color = "darkred",alpha=0.1) +  #添加点
  annotate("text",x =13 , y = 20,parse = T,
           label = "x[1] == x[2]") #添加注释
 
# alpha function within geom is the transparence. 



# geom和 stat的关系
x <- c(rnorm(100,14,5),rep(20,20)) 
y <- c(rnorm(100,14,5) + rnorm(100,0,1),rep(20,20))

ggplot(data= NULL, aes(x = x, y = y)) +  #开始绘图
  stat_sum(color = "darkred",geom = "point")
ggplot(data= NULL, aes(x = x, y = y)) +  #开始绘图
  geom_point(color = "darkred",stat = "sum")

#
head(mtcars)

p <- ggplot(mtcars, aes(wt, mpg)) #<---- code 1
p + geom_point(aes(colour = disp)) #<---- code 2


ggplot(mtcars, aes(wt, mpg)) + geom_point()
ggplot(mtcars, aes(wt, mpg)) + geom_point(aes(color=cyl)) # 连续变量
ggplot(mtcars, aes(wt, mpg)) + geom_point(aes(color=factor(cyl))) # 不连续变量

















