

###          replace and find
S.find ('an')  #out put the match position
S.replace('g','k')

S.upper()
S.isalpha()  #  test if S is word
S.isdigit() #  test if S is digit

#                        splite into a list
A="good, abc, bad"
list=A.split(',')   
list

line = 'aaa,bbb,ccc,ddd\n'
line=line.rstrip() #        remove \n
line

# in case you want to split using regular express
import re
test="what I want to      test"
list=re.split(r'\s+',test)
list
list[0]


 # in

 's' in 'qxs'
 #True

 
 
 
 
 
 
 
# 变量替代 %s
hello = "Hey %s, how about %s %s%s"
varb =('qxs', 'sss','aaa','bbb')
a=('asdf')
print(a)
print (hello % varb, a)
Hey qxs, how about sss
 
 
 
 
 
 
 #match

import re
match = re.match('hello[ \t]*(.*) (world)', 'hello pythond world')   # match a pattern in the string
match.group(1)  ##      print $1 in the kuohao


## method 1
re.findall(r't{2}','^abctiptttttopqxs sss aaaaaaaaaaabc')
print (re.findall(s,'^abctiptttttopqxs sss aaaaaaaaaaabc'))


## method 2 compile the regex , it will faster
r1=r'\d{3,4}-?\d{8}'
p_tel=re.compile(r1)     ## compile the regex , it will faster#
print re.findall(p_tel,'010-12345678')

csvt_re=re.cpmpiple(r'csvt',re.I)   # both A and a 


# method 3              match
import re
match = re.match('hello[ \t]*(.*) (world)', 'hello pythond world')   # match a pattern in the string
match.group(1)  ##      print $1 in the kuohao

#if match do some thing
test="what I want to test"
if re.match(r'\w\w\w\w',test):
    print ("find match")
else:
    print ("didn't find match")

# 选取match 中的部分内容， notepad的括号功能
test="718 XinshuaiQi"
list=re.match(r'(\d+)\s(\w+)',test)
list.group(0)  # entire match
list.group(1)  # the first match within the bracket
list.group(2)  # the second match within the bracket
list.group()

str='/usr/home/qxs'
match=re.match('/(.*)/(.*)/(.*)',str)
match.groups() #entire group
match.group(0) #entire
match.group(1) # $1
match.group(2) # $2
match.group(3)

match ##only search the start of the string,, yes or no 
search #    search entire string
finditer()   # return a iterative list


 
 
