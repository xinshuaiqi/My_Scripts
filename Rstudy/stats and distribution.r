#binomial experiment
##An experiment for which the following four conditions are satisfied is called a binomial experiment.
# 1. The experiment consists of a sequence of n trials, where n
# is fixed in advance of the experiment.
# 2. The trials are identical, and each trial can result in one of
# the same two possible outcomes, which are denoted by
# success (S) or failure (F).
# 3. The trials are independent.
# 4. The probability of success is constant from trial to trial:
#   denoted by p.


掷骰子
rbinom(x,n,p) x =test times; n=sample size, prob

rbinom(100000,6,1/6)
table(rbinom(100000,6,1/6))
barplot(table(rbinom(100000,6,1/6)))

barplot(table(rbinom(100000,2,1/2)))
barplot(table(rbinom(100000,100,1/2)))
hist(rbinom(100000,100,1/2))

dbinom(x, N, p) # Binomial distribution
pbinom(x, N, p)
qbinom(q, N, p)
rbinom(n, N, p)







##Poisson Distribution 
rpois(x, lambda) # Poisson distribution

# model the number of events occurring within a given time interval.
# rare occurrences; such as car accidents
# over a period of time, we can see rare events.
# 
# death of infants
# the number of misprints in a book
# the number of customers arriving
#泊松分布适合于描述单位时间内随机事件发生的次数的概率分布。
# 如某一服务设施在一定时间内受到的服务请求的次数，电话交换机接到呼叫的次数、
# 汽车站台的候客人数、机器出现的故障数、自然灾害发生的次数、
# DNA序列的变异数、放射性原子核的衰变数等等。
#example:
λ （lambda） 是单位时间内时间发生的平均次数
#Number of wars beginning by year for years 1482-1939.
#Table of frequency counts and proportions (458 years):

x1 = rep(0, 242)
x2 = rep(1, 148)
x3 = rep(2, 49)
x4 = rep(3, 15)
x5 = rep(4, 4)
x = c(x1, x2, x3, x4, x5)
sum(x) # 307
mean(x) # 0.67
var(x) # 0.738

dpois(0:4, 0.67)

#example 2 
A production line produces 600 parts per hour
with an average of 5 defective parts an hour.
If you test every part that comes off the line in
15 minutes, what are your chances of finding
no defective parts (and incorrectly concluding
                    that your process is perfect)?

λ<-5*0.25

barplot(table(rpois(1000,1.25)))

##why not binomial
#because in this case: n=600 large, p= 5/600 small 小概率事件

## 随着lambda 增加， possion 接近正态分布
lambda <- 1
poisson.d <- dpois(seq(1,20),lambda)
plot(poisson.d, xlab='X',ylab='p',type='l')
for (lambda in 1:10){
  poisson.d <- dpois(seq(1,20),lambda)
  lines(poisson.d, type='l',
        col=rainbow(10)[lambda])
  legend(lambda, 0.4-lambda/50,
         paste('lambda =',lambda, sep=' '),
         text.col = rainbow(10)[lambda],
         box.lty=0, cex=0.8)}
#Properties of Poisson distribution
# The mean and variance are both equal to λ.
# The sum of independent Poisson variables is a
# further Poisson variable with mean equal to the sum
# of the individual means.
# The Poisson distribution provides an approximation
# for the Binomial distribution.

##########################
Some import continuous distributions
###########################

 The uniform distribution
 The normal distribution
 The chi-square distribution
 The student t distribution
 The F distribution


# 均匀分布
# 均匀分布(Uniform distribution)是均匀的，不偏差的一种简单的概率分布，
# 分为：离散型均匀分布与连续型均匀分布。
runif(x, min, max) # Uniform distribution



# 正态分布
you must know μ and σ

Convert your measurement x to a standard score, then you get a :
standard normal distribution

Use the area UNDER the normal distribution• 
For example, the area under the curve between x=a and
x=b is the probability that your next measurement of x will
fall between a and b


# Normal distribution
dnorm(seq( -3, 3, by = 0.1), mean = 0, sd = 1)
pnorm(seq( -3, 3, by = 0.1), mean = 0, sd = 1)
qnorm(seq( 0.1, 0.9, by = 0.1), mean = 0, sd = 1)
rnorm(10, mean = 0, sd = 1)


#############
Historical data shows that the temperature of a particular pipe in a
normally-operating continuous production line is (94 ± 5)°C (±1σ).
You glance at the control display and see that T = 87 °C. How
abnormal is this measurement?
• z = (87 – 94)/5 = -1.4
• From the table of z distribution, -1.4 gives an area of 0.0808.
• In other words, when the line is operating normally, you would expect
to see even lower temperatures about 8 % of the time.
• This measurement alone should not worry you.
############

use normal table 
What proportion of standard normal distribution
values Z are less than 1.40? That is, P(Z < 1.40)
= ?

pnorm(1.4)

#example
Jim gets 680 on SAT math exam. Mean on
this exam is 500 and SD is 100.
• Jim’s standardized score is:z=(680-500)/100=1.8



set.seed(1)
x <- seq(-5,5,length.out=100)
y <- dnorm(x,0,1)

plot(x,dnorm(x,1,0.5),col="red",
     xlim=c(-5,5),ylim=c(0,1),type='l',
     xaxs="i", yaxs="i",ylab='density',xlab='',
     main="The Normal Density Distribution")

lines(x,dnorm(x,0,0.5),col="green")
lines(x,dnorm(x,0,2),col="blue")
lines(x,dnorm(x,-2,1),col="orange")

legend("topleft",legend=paste("m=",c(0,0,0,-2)," sd=", c(1,0.5,2,1)), lwd=1, col=c("red", "green","blue","orange"))

#累积正态分布
set.seed(1)
x <- seq(-5,5,length.out=100)
y <- pnorm(x,0,1)

plot(x,y,col="red",xlim=c(-5,5),ylim=c(0,1),type='l',
     xaxs="i", yaxs="i",ylab='density',xlab='',
     main="The Normal Cumulative Distribution")

lines(x,dnorm(x,0,1),col="green")

lines(x,pnorm(x,0,0.5),col="green")
lines(x,pnorm(x,0,2),col="blue")
lines(x,pnorm(x,-2,1),col="orange")

legend("bottomright",
       legend=paste("m=",c(0,0,0,-2)," sd=", c(1,0.5,2,1)), 
       lwd=1,col=c("red", "green","blue","orange"))

# 检验数据是否符合正态分布
Shapiro Wilk test
S<-rnorm(1000)
S
shapiro.test(S)
##W = 0.99876, p-value = 0.7256 
# w close to 1, P>0.05 can not reject normal distribution

ks.test(S, "pnorm")
# D值很小, p-value>0.05，不能拒绝原假设，所以数据集S符合正态分布！

When can you assume the shape of
the sampling distribution is normal?
• When the population distribution is normal
• When you check sample mean (Based on the Central Limit Theorem)
– shapiro.test(x) p>0.05
– qqnorm(x) straight line


# χ²(卡方)分布 "z score squared" 
# 若n个相互独立的随机变量ξ₁、ξ₂、……、ξn ，均服从标准正态分布（也称独立同分布于标准正态分布）
# ，则这n个服从标准正态分布的随机变量的平方和构成一新的随机变量，
# 其分布规律称为χ²分布（chi-square distribution）。其中参数n称为自由度，
# 自由度不同就是另一个χ²分布，正如正态分布中均值或方差不同就是另一个正态分布一样。

# Chi-square is the distribution of a sum of squares.
# Each squared value (usually deviation) is taken from
# the unit normal: N(0,1). The shape of the chi-square
# distribution depends on the number of squared values
# that are added together.

# The distribution of chi-square depends on its degrees of freedom
# As df gets large, curve is less positively skewed, more normal.
? 和possion分布有啥区别？

# chi square distribution
rchisq(100, df = 3)

y<-dchisq(x,1)

y<-pchisq(x,1)

plot(dchisq(seq(0.1,10,by=0.1),
df = 1),type='l',xlab='x',xlim=c(0,10))





##F-分布（F-distribution）是一种连续概率分布，
# 被广泛应用于似然比率检验，特别是ANOVA中。
# F分布定义为：设X、Y为两个独立的随机变量，X服从自由度为k1的卡方分布，Y服从自由度为k2的卡方分布，
# 这2 个独立的卡方分布被各自的自由度除以后的比率这一统计量的分布。
# 即： 上式F服从第一自由度为k1，第二自由度为k2的F分布。

# F分布的性质
# 
# 它是一种非对称分布
# 它有两个自由度，即n1 -1和n2-1，相应的分布记为F（ n1 –1， n2-1）， n1 –1通常称为分子自由度， n2-1通常称为分母自由度
# F分布是一个以自由度n1 –1和n2-1为参数的分布族，不同的自由度决定了F 分布的形状
# F分布的倒数性质：Fα,df1,df2=1/F1-α,df1,df2[1]


#The F distribution is the ratio of two variance estimates of normal distributions
# also = the ratio of two chi-squares, each divided by its degrees of freedom


F depends on two parameters: v1 and v2 (df1 and df2).
The shape of F changes with these. Range is 0 to
infinity. Shaped a bit like chi-square.

# F distribution
df(x, df1, df2, log = FALSE)
pf(q, df1, df2, lower.tail = TRUE, log.p = FALSE)
qf(p, df1, df2, lower.tail = TRUE, log.p = FALSE)
rf(n, df1, df2)


x<-seq(0,5,length.out=1000)
y<-df(x,1,1,0)

#累积密度
y<-pf(x,1,1,0)





#T分布
# 学生t-分布（Student's t-distribution），可简称为t分布。
# 应用在估计呈正态分布的母群体之平均数。它是对两个样本均值差异进行显著性测试的学生t检定的基础。
# 学生t检定改进了Z检定（Z-test），因为Z检定以母体标准差已知为前提。
# 虽然在样本数量大（超过30个）时，可以应用Z检定来求得近似值，
# 但Z检定用在小样本会产生很大的误差，因此必须改用学生t检定以求准确。
# 
# 在母体标准差未知的情况下，不论样本数量大或小皆可应用学生t检定。
# 在待比较的数据有三组以上时，因为误差无法压低，此时可以用变异数分析（ANOVA）代替学生t检定。

set.seed(1)
x<-seq(-5,5,length.out=1000)
y<-dt(x,1,0)

y<-pt(x,1,0)

# 正态总体均值的假设检验
# t检验
# 单个总体
# 例一
# 某种元件的寿命X（小时），服从正态分布，N（mu,sigma^2），其中mu,sigma^2均未知，16只元件的寿命如下：问是否有理由认为元件的平均寿命大于255小时。
# 命令：
X<-c(159, 280, 101, 212, 224, 379, 179, 264,
     222, 362, 168, 250, 149, 260, 485, 170)
t.test(X, alternative = "greater", mu = 225)
#两个总体
#例二
#X为旧炼钢炉出炉率，Y为新炼钢炉出炉率，问新的操作能否提高出炉率
#命令：
X<-c(78.1,72.4,76.2,74.3,77.4,78.4,76.0,75.5,76.7,77.3)
Y<-c(79.1,81.0,77.3,79.1,80.0,79.1,79.1,77.3,80.2,82.1)
t.test(X, Y, var.equal=TRUE, alternative = "less")
#成对数据t检验
#例三
#对每个高炉进行配对t检验
#命令：
X<-c(78.1,72.4,76.2,74.3,77.4,78.4,76.0,75.5,76.7,77.3)
Y<-c(79.1,81.0,77.3,79.1,80.0,79.1,79.1,77.3,80.2,82.1)
t.test(X-Y, alternative = "less")


# t-test daily energy intake in kJ for 11 women (Altman, 1991, p. 183)
daily.intake = c(5260,5470,5640,6180,6390,6515,
                 6805,7515,7515,8230,8770)
mean(daily.intake)
sd(daily.intake)
quantile(daily.intake)
t.test(daily.intake, mu = 7725)
# Nonparametric
wilcox.test(daily.intake, mu = 7725)
# Two samlpes
x1 = rnorm(300, 0, 1)
x2 = sample(0:100, 300, rep = T)
t.test(x1, x2)
# Check normality
plot(x1); hist(x1); qqnorm(x1)  # qq straight line
shapiro.test(x1) # shapiro p>0.05

#Two-tailed Test
t.test(x, mu = 100, alt = "two.sided")
#Right-tailed Test
t.test(x, mu=100, alt = "greater")
#Left-tailed Test
t.test(x, mu=0, alt = "less")



# Z test
Test continuous outcome
#Known variance
pnorm(z)
t.test(x, mu=0, var.equal = T)
#Unknown variance
t.test(x, mu=0, var.equal = F)

# Plot a normal distribution and t distributions
x <- seq(-4, 4, len = 1000)
z <- dnorm(x, 0, 1)
plot(x, z, type = 'l', col = 'blue') # the normal curve
segments( 1.96, -0.05, 1.96, 0.1, col = 'brown')
segments(-1.96, -0.05,-1.96, 0.1, col = 'brown')
abline(0,0)
lines(x, dt(x, 15), col = 'green')
lines(x, dt(x, 4), col = 'red')













#超几何分布
超几何分布和Fisher's Exact Test是完全一模一样的原理，只是两种不同的称谓。 '
超几何分布是统计学上一种离散概率分布。它描述了由有限个物件中抽出n个物件，成功抽出指定种类的物件的个数（不归还）。
例如在有N个样本，其中m个是不及格的

#取样函数
x<-1:100
sample(x,10,replace=T)

#13000基因，标记934个
#如果抽1000 里面有标记的有几个
#取十次
rhyper(10,934,13000-934,1000)

#取到130个的概率
1-phyper(130,934,13000-934,1000)



# 指数分布(Exponential distribution)用来表示独立随机事件发生的时间间隔，
# 比如旅客进机场的时间间隔、中文维基百科新条目出现的时间间隔等等。
# 
# 许多电子产品的寿命分布一般服从指数分布。
# 有的系统的寿命分布也可用指数分布来近似。
# 它在可靠性研究中是最常用的一种分布形式。
# 指数分布是伽玛分布和weibull分布的特殊情况，产品的失效是偶然失效时，其寿命服从指数分布。
# Exponential distribution is a skewed distribution
set.seed(1)
x<-seq(0,10,length.out=100)
y<-dexp(x,1.1)

plot(x,y,col="red",xlim=c(0,10),ylim=c(0,5),type='l',
     xaxs="i", yaxs="i",ylab='density',xlab='',
     main="The Exponential Density Distribution")
lines(x,dexp(x,1),col="green")
lines(x,dexp(x,2),col="blue")
lines(x,dexp(x,5),col="orange")

legend("topright",legend=paste("rate=",c(.5, 1, 2,5)), lwd=1,col=c("red", "green","blue","orange"))

#累积分布
set.seed(1)
x<-seq(-1,2,length.out=100)
y<-pexp(x,0.5)

plot(x,y,col="red",xlim=c(0,2),ylim=c(0,1),type='l',
     xaxs="i", yaxs="i",ylab='density',xlab='',
     main="The Exponential Cumulative Distribution Function")
lines(x,pexp(x,1),col="green")
lines(x,pexp(x,2),col="blue")
lines(x,pexp(x,5),col="orange")

legend("bottomright",legend=paste("rate=",c(.5, 1, 2,5)), 
       lwd=1, col=c("red", "green","blue","orange"))

# The central limit theorem
# Exponential distribution is a skewed distribution
y <- rexp(100); hist(y, col = 'grey')
# Define a vector with length 200
sample.mean <- numeric(200)
# The mean of 200 samples
for(i in 1:200) sample.mean[i] <- mean(rexp(100))
# A normal distribution appears
hist(sample.mean , col = 'grey')
shapiro.test(sample.mean)



# γ(伽玛)分布
# 伽玛分布(Gamma)是著名的皮尔逊概率分布函数簇中的重要一员，称为皮尔逊Ⅲ型分布。
# 它的曲线有一个峰，但左右不对称。

y<-dgamma(x,1,2)
#累积
y<-pgamma(x,1,2)

#检验
S<-rgamma(1000,1)
ks.test(S, "pgamma", 1)


##
# weibull分布
# 
# weibull(韦伯)分布，又称韦氏分布或威布尔分布，是可靠性分析和寿命检验的理论基础。
# Weibull分布能被应用于很多形式，分布由形状、尺度（范围）和位置三个参数决定。
# 其中形状参数是最重要的参数，决定分布密度曲线的基本形状，
# 尺度参数起放大或缩小曲线的作用，但不影响分布的形状。
# 
# Weibull分布通常用在故障分析领域( field of failure analysis)中；
# 尤其是它可以模拟(mimic) 故障率(failture rate)持续( over time)变化的分布。
# 故障率为：
# 
# 一直为常量(constant over time)， 那么 α = 1， 暗示在随机事件中发生
# 一直减少(decreases over time)，那么α < 1， 暗示"早期失效(infant mortality)"
# 一直增加(increases over time)，那么α > 1， 暗示"耗尽(wear out)" - 随着时间的推进，失败的可能性变大





# β(贝塔Beta)分布
# 贝塔分布(Beta Distribution)是指一组定义在(0,1)区间的连续概率分布，
# Beta分布有α和β两个参数α,β>0，其中α为成功次数加1，β为失败次数加1。
# Beta分布的一个重要应该是作为伯努利分布和二项式分布的共轭先验分布出现，
# 在机器学习和数理统计学中有重要应用。贝塔分布中的参数可以理解为伪计数，
# 伯努利分布的似然函数可以表示为，表示一次事件发生的概率，它为贝塔有相同的形式，
# 因此可以用贝塔分布作为其先验分布。

set.seed(1)
x<-seq(-5,5,length.out=10000)
y<-dbeta(x,0.5,0.5)















################
# 各种假设检验
################
# It is extremely important to realize that we are not
# making definitive conclusions. We are giving
# probabilistic conclusions. We are either concluding that
# the results we get are likely due to chance, or unlikely.

# Origins
# History
# • Hypothesis testing is the product of Ronald Fisher, Jerzy Neyman, Karl
# Pearson and Egon Pearson.
# • Fisher emphasized rigorous experimental design and methods to
# extract a result from few samples assuming Gaussian distributions.
# • Neyman and E. Pearson emphasized mathematical rigor and methods
# to obtain more results from many samples and a wider range of
# distributions (Neyman and Pearson 1933).
# • Modern hypothesis testing is a hybrid of the Fisher vs.
# Neyman/Pearson formulation, methods and terminology developed in
# the early 20th century.


各种情况使用的方法
Aim                       Parametric tests          Non-parametric tests
--------------------------------------------------------------------------
  compare two means         Student's T test          Wilcoxon's U test

compare more than        Anova analysis             Kruskal--Wallis test
two means variance)

Compare two variances    Fisher's F test            Ansari-Bradley or Mood test

Comparing more than two       Bartlett test         Fligner test'


#other options:
  Confidence interval 
  Bayesian approach to hypothesis testing is to base 
    rejection of the hypothesis on the posterior probability

#Formal hypothesis testing
    1. Making/checking assumptions
    2. Convert your claim into a symbolic null and alternative hypothesis
    3. Select the sampling distribution and establish the critical region
    4. Calculate a test statistic
    5. Compare the test statistic to critical values OR a probability, write a conclusion

#Central limit theorem 中心极限定理
    • Sampling distribution of means becomes normal as N
    increases, regardless of shape of original distribution.
    中心极限定理说明，大量相互独立的随机变量，其均值的分布以正态分布为极限。
    这组定理是数理统计学和误差分析的理论基础，指出了大量随机变量之和近似服从正态分布的条件。
    
#大数定律 
样本数量越多，则其平均就越趋近期望值    
  
Don’t use “Accept”
use ‘fail to reject’   
Reject H0 if P-value ≤ α
Fail to reject H0 if P-value > α    
    
#     You need to know
#     • How to turn a question into hypotheses
#     • Failing to reject the null hypothesis DOES NOT
#     mean that the null is true
#     • Every test has assumptions
#     – A statistician can check all the assumptions
#     – If the data does not meet the assumptions there are nonparametric
#     versions of the tests  


#     Common mistakes in hypothesis testing
#     • Lack of independence
#     • Violation of normality
#     – Highly skewed data
#     • Assume equal variances and the
#     variances are not equal
#     (Did not do variance test)
    
#     Check variance
#     • bartlett.test(), sensitive to outliers
#     • var.test(), Fisher’s F test, sensitive
#     to outliers
#     • fligner.test(), performs a Fligner-
#       Killeen (median) test of the null that
#     the variances in each of the groups
#     (samples) are the same. It is a nonparametric
#     test which uses the
#     ranks of the absolute values.    
#     
#     example:
    plot(count ~ spray, data = InsectSprays)
    bartlett.test(InsectSprays$count, InsectSprays$spray)
    var.test (InsectSprays$count, InsectSprays$spray)
    fligner.test (InsectSprays$count, InsectSprays$spray)
    fligner.test (count ~ spray, data = InsectSprays)
    
    
@ "从4 开始看Hypothesis testing"    
    
    
    
    