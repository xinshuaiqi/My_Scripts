library(dplyr) # 高速处理数据，取代R自带的一些函数，代码简单易记
library(tidyr) # 提供一些其他功能
library(reshape2)


name1 <- c("Bob","Mary","Jane","Kim")
name2 <- c("Bob","Mary","Kim","Jane")
weight <- c(60,65,45,55)
height <- c(170,165,140,135)
birth <- c("1990-1","1980-2","1995-5","1996-4")
accept <- c("no","ok","ok","no")

df1 <- data.frame(name1,weight,height)
df2 <- data.frame(name2,birth,accept)
# 合并
rbind(df1,df1[c(2,4),]) # 行合并，需要列数、列名相同
cbind(df1,df2) # 列合并，需要行数相同
data.frame(df1,df2) # 建立数据框，达到相同的效果

# dplyr包中高效合并
bind_rows(df1,df1[c(2,4),])  
bind_cols(df1,df2)

?apply
df1

apply(df1[,c(2,3)],2,sum)
summary(df1)



df<-as.data.frame(cbind(x1 = 3, x2 = c(4:1, 2:5)))
myF<-function (x){x*x}
apply(df,1,myF,x = 'x1', y ='x2')

lapply(df,myF)

## apply
name1 <- c("Bob","Mary","Jane","Kim")
name2 <- c("Bob","Mary","Kim","Jane")
weight <- c(60,65,45,55)
height <- c(170,165,140,135)
birth <- c("1990-1","1980-2","1995-5","1996-4")
accept <- c("no","ok","ok","no")

df1 <- data.frame(name1,weight,height)
df2 <- data.frame(name2,birth,accept)
 
myF<-function (d,d1,d2){d1+d2}

as.data.frame(apply(df1,1,myF,d1=df[1],d2=df[2])) # ouot a list
class(apply(df1,1,myF,d1=df[1],d2=df[2]))

as.data.frame(lapply(df1,myF,d1=df[1],d2=df[2])) # ouot a list
class(lapply(df1,myF,d1=df[1],d2=df[2]))

as.data.frame(sapply(df1,myF,d1=df[1],d2=df[2])) # out a vector 

myF<-function(d,d1,d2){d1/10}
ap<-apply(df1,1,myF,d1=df1[1,],d2=df1$height)
as.data.frame(ap)


as.data.frame(apply(iris[, 1:4], 2, summary))
summary(iris[, 1:4])


#reshape
library(reshape2)
df1

m<-melt(df1)
m

cast(m,value~name1+variable)
cast(m,name1~value)



