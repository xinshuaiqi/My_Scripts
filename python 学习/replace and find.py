

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
 
 
 
 
 
 
 
 
 
