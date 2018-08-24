# apply
# apply(X, MARGIN, FUN, ...)

x<-matrix(1:12,ncol=3)
x

apply(x,1,sum) # for each line 
apply(x,2,sum) # for each column


# example 2
x <- cbind(x1 = 3, x2 = c(4:1, 2:5)); x

myFun<-function(a,a1,a2){
  c(sum(a[a1],1)),mean(a[a2])
}

# lapply 用于 list 数据集
x <- list(a = 1:10, b = rnorm(6,10,5), c = c(TRUE,FALSE,FALSE,TRUE));x

lapply(x, sum) # for matrix, lapply to each value
lapply(data.frame(x), sum) # for data frame, lapply to each column.

# sapply, similar to lapply, but return a vector
sapply(x, sum)
sapply(data.frame(x), sum) 


class(lapply(x, sum)) # as list
class(sapply(x, sum)) # as vector


