#reshape2 

# http://dengkui.space/2015/10/28/R-reshape2-pivot.html

#



# reshape2包用到的基本就是melt和 * cast两个函数，melt负责揉数据，*cast负责捏数据。
library(reshape2)

#melt array
a <- array(c(1:23, NA), c(2,3,4));a
melt(a,varnames = c("row","column","table"),value.name = "value")  # row, column, table, value

#melt lists
l<-list(list(1:3), 1, list(as.list(3:4), as.list(1:2))); l
melt(l)

# use airquality
head(airquality)
melt(airquality)


# Another dplyr 教程
# http://rpubs.com/justmarkham/dplyr-tutorial
# https://www.youtube.com/watch?v=jWjqLW-u3hc

suppressMessages(library(dplyr))
library(hflights)

data(hflights)
head(hflights)

flights <- tbl_df(hflights)
flights

