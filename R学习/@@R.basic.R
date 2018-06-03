# R语言教程 https://www.w3cschool.cn/r/
  

# Data Type
## list all the variables
list()
ls(all.name = TRUE) # list -a; inlcuidng .XX.txt
rm()


## format
format(23.123456789, digits = 4)
format(c(6, 13.14521), scientific = TRUE)
format(23.47, nsmall = 5)
format(6) # as string
format(13.7, width = 6)


# String
nchar("Count the number of characters") # total characters, including SPACE
substring("Extract", 5, 7)

# seq 
seq(5, 9, by = 0.4)

### variable type
class()
#character, raw, complex, logical, numeric, integer

vector = c('a','b','c')
v = 1:10
class(vector) # charactor
print(vector)

list = list(c('a','b','c'))
class(list)
print(list)

 



# always 2D
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

# Arrays 
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)


## factor 
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')
# Create a factor object.
factor_apple <- factor(apple_colors)
# Print the factor.
print(factor_apple)
levels(factor_apple)
print(nlevels(factor_apple))

#data.frame ()






## print
a = "qixinshuai"
out=paste("Hello ",a,sep="", collapse="")
print(out)
# print("Hello ", a)   <- NOT work

cat("Hello ", a)








## packge
search() # show loaded packages






## loop

i =1
while (i<=10){
  print(i)
  i=i+1
}

for (i in c(1:10)){
  print(i)
}

break
next





# vector cbind, rbind 
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)
addresses <- cbind(city,state,zipcode)
print(addresses)

# ？？？
merge()
melt()
cast()

 


