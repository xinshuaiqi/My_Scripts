## print
print ("Xinshuai is great!")

a = ("sss")
b = ("qxs")
c=a+b
print (c)
print (a,b)




# 变量替代
hello = "Hey %s, how about %s %s%s"
varb =('qxs', 'sss','aaa','bbb')
a=('asdf')
print(a)
print (hello % varb, a)
Hey qxs, how about sss

# 变量替代
out ="%s died in %s"
var = ('qxs', 'sss')
print(out % var)  


print('这个人的名字是%s,已经有%d岁了！'%(name,age))

# There are many ways to do this. To fix your current code using %-formatting, you need to pass in an iterable like a tuple:

Pass it as a tuple:

print("Total score for %s is %s" % (name, score))
Here are some other common ways of doing it:

Pass it as a dictionary:

print("Total score for %(n)s is %(s)s" % {'n': name, 's': score})
There's also new-style string formatting, which might be a little easier to read:

Use the new-style string formatting:

print("Total score for {} is {}".format(name, score))
Use the new-style string formatting with numbers (useful for reordering or printing the same one multiple times):

print("Total score for {0} is {1}".format(name, score))
Use the new-style string formatting with explicit names:

print("Total score for {n} is {s}".format(n=name, s=score))
The clearest two, in my opinion:

Pass the values as parameters and print will do it:

print("Total score for", name, "is", score)
If you don't want spaces to be inserted automatically by print in the above example, change the sep parameter:

print("Total score for ", name, " is ", score, sep='')
If you're using Python 2, won't be able to use the last two because print isn't a function in Python 2. You can, however, import this behavior from __future__:

from __future__ import print_function
Use the new f-string formatting in Python 3.6:

print(f'Total score for {name} is {score}')











# print without \n in the end of line
from __future__ import print_function # import function in python 3 
for i in "spam":
    print (i)
	
for i in "spam":
    print (i,end="")   ## this is a function in python3, so you have to 
    # first import this above line

	
	
# print 小数 otherwise, 是整数
from __future__ import division
3//2
1/3
repr(1/3.0) # convert result to string
str(1/3)

## set decimal number
import decimal
decimal.getcontext().prec=4
decimal.Decimal(1)/decimal.Decimal(7)


#fraction , 分数
from fractions import Fraction
y=Fraction(2,3)
print (y)


# print 小数 otherwise, 是整数
from __future__ import division 
3//2
1/3
repr(1/3.0) # convert result to string 

5/2
5/-2
5//2.0
5//-2.0

1.9**200

# under binary format 二进制
x=1     # 0001
x<<2    # 0100
x&1     # 0001 

pow (2,4)  # 2 **4  # exponentiation / power

## set decimal number
import decimal
decimal.getcontext().prec=4
decimal.Decimal(1)/decimal.Decimal(7)


#fraction , 分数
from fractions import Fraction
y=Fraction(2,3)
print (y)

