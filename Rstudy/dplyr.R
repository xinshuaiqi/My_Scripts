library(dplyr)

# http://dplyr.tidyverse.org/


# dplyr is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges:
#   
# mutate() adds new variables that are functions of existing variables
# select() picks variables based on their names.
# filter() picks cases based on their values.
# summarise() reduces multiple values down to a single summary.
# arrange() changes the ordering of the rows.


# http://rpubs.com/justmarkham/dplyr-tutorial

 

# http://rpubs.com/justmarkham/dplyr-tutorial
# https://www.youtube.com/watch?v=jWjqLW-u3hc

head(hflights)

# convert to local data frame
flights <- tbl_df(hflights)

# filter
filter(flights, Month == 1, DayofMonth ==1)

# re arrange data
arrange(flights, DepTime)
arrange(flights, ArrTime, desc(FlightNum)) # first based on ArrTime, then descending order of FlightNum

# select some column 
select(flights, Year, Month, DayofMonth, FlightNum)

# unique in the column
distinct(select(flights,UniqueCarrier))

#mutate data 

  # generate new column
flights<-mutate(flights, gain = DepDelay-ArrDelay)
flights$gain
  
  # only keep the new column
new<-transmute(flights, gain = DepDelay-ArrDelay)
new


# data summary
summarise(flights,mean(ActualElapsedTime))

carrier<-group_by(flights,UniqueCarrier)
delay<-summarise(carrier,count = n(), dis)



















        