
#Python 函数没有明确的开始（begin）或者结束（end），也没有用大括号来标记函数从哪里开始从哪里停止。唯一的定界符就是一个冒号（:）和代码自身的缩进。

#代码块是通过它们的缩进来定义的
“代码块”，意思是指函数，if 语句、 for 循环、 while 循环，等等

#Python 使用回车符来分割语句，使用一个冒号和缩进来分割代码块。

#Python 使用 try...except 块来处理异常，使用 raise 语句来抛出异常。 Java 和 c++ 使用 try...catch 块来处理异常，使用 throw 语句来抛出异常。


#Python 里面所有的名称都是区分大小写的


'''if'''
number = 23
guess = int(input(‘请输入一个整数：’))      #等待输入整数
if guess == number:
    print('恭喜，你猜对了。')    # 新块从这里开始
    print('(但你没有获得任何奖品！)')    # 新块在这里结束
elif guess < number:
    print('不对，你猜的有点儿小')    # 另一个块
else:
    print('不对，你猜的有点大')
print('完成')


##  for loop
for x in 'spam':  #
    print(x)

for x in range(1,10):
    print x
	
for x in [1,2,3,4]:
    print(x**2)
	
for i in K:
    print (i.strip("'\ "), "===>>>".strip('\''),D[i])

##
for x in "9xinshuai":
    print (x.upper()),   # add  ,  so remove \n 

#
square=[] # add a empty list
for i in [1,2,3,4,5]:
    square.append(i+10)

print  ("\n", square)

for x in 'spam':  #
    print(x)

for x in range(1,10):  #默认情况下，range() 的起始值是 0。
    print x
else:
	print ("end")
	
a = ['Mary ', 'had', 'a', 'little ', 'lamb']
for i in range(len(a)):
    print(i, a[i])

l = ["%.2d" % i for i in range(16)]
for i in l:
    print(i)

# 多变量的for loop
for x,y in [(1,1),(2,4),(3,9)]:
		print (x,y)
	

elements = []
for i in range(10):
    elements.append(i)
    #print((elements))
    join_elements=''.join(elements)
    print(hoin_elements+f"{i}")

str(i) for i in elements

	
D={'a':1,
   'b':2,
   'c':3,
   'd':4
   }

##   list all key

K = list(D.keys())
V=list(D.values())

	
	


         
while True:
    reply = input ("Enter a number:")      #this is for python 2.7, use "input" for python 3.0
    if reply == 'stop':
        break
    elif not reply.isdigit():
        print('not digit')
    else:
        print (reply.upper())      #python 2.7 you can remove () for print
        print ('good boy')


####   while
x=20
while x>0:
    print(x)
    x  = x - 1
    
x=0
while x<20:
    x=x+1
    print(x)

	
# break
while True:
    s = input('输入一些东西 : ')
    if s == 'quit':
        break
    print('字符串的长度是', len(s))
print('完成')



#continue
while True:
    s = input('输入一些东西: ')
    if s == 'quit':
        break
    if len(s) < 3:
        print('太小')
        continue
    print('输入的东西有足够的长度')
	
	
	
	
	
	
	
	
