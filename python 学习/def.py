'''
Def function
'''

#
def times (x,y):
    return x*y #函数的返回值用return语句返回

m=times(2,3)
print(m)

n=times('qxs',3)
print(n)


## multiple variables 
def list (first,*food, **dic):
    print (first)
    print (food)
    print (dic)

list ('apple','peach','pineapple',strawberry="red")


def printMax(a, b):
    if a > b:
        print(a, '大')
    elif a == b:
        print(a, '等于', b)
    else:
        print(b, '大')
		
def greeting():
	print ("Hello world")
	
	
	
#函数默认参数举例：
def say(message, times = 1):
    print(message * times)

say('你好')
say('世界', 5)
输出：
你好
世界世界世界世界世界


#参数关键字举例：
def func(a, b=5, c=10):
    print('a为', a, '和b为', b, '和c为', c)

func(3, 7)
func(25, c=24)
func(c=50, a=100)

# multiple return
import math

def move(x, y, step, angle=0):
    nx = x + step * math.cos(angle)
    ny = y - step * math.sin(angle)
    return nx, ny

x, y = move(100, 100, 60, math.pi / 6)
print(x, y)

r = move(100, 100, 60, math.pi / 6)
print(r)
# 原来返回值是一个tuple！

# 不确定数量的参数
def total(initial=5,*numbers, **keywords):
    print (initial)
    print(numbers)
    print(keywords)
    
total(10,11,12,12,13,qxs="qxs",sss="sss")
# *   here number goes into a taple
# ** keywords goes into a dict


#return语句举例：
def maximum(x, y):
    if x > y:
        return x
    elif x == y:
        return '两个数相等'
    else:
        return y

print(maximum(2, 3))

'''documentation strings'''

def printMax(x, y):
    '''打印两个数中的最大值。
    两个值必须是整数。'''
    x = int(x) # 如果可能，转换为整数
    y = int(y)

    if x > y:
        print(x, '最大')
    else:
        print(y, '最大')

printMax(3, 5)
print(printMax.__doc__)


# 递归函数 
# 所有的递归函数都可以写成循环的方式，但循环的逻辑不如递归清晰

#计算阶乘
def fact(n):
    return fact_iter(n, 1)
    
def fact_iter(num, product):
    if num == 1:return product    
    return fact_iter(num - 1, num * product)

fact(5)

'''
小结
    使用递归函数的优点是逻辑简单清晰，缺点是过深的调用会导致栈溢出。
    针对尾递归优化的语言可以通过尾递归防止栈溢出。尾递归事实上和循环是等价的，没有循环语句的编程语言只能通过尾递归实现循环。
    Python标准的解释器没有针对尾递归做优化，任何递归函数都存在栈溢出的问题
'''



# if __name__ == '__main__' 如何正确理解?
https://www.zhihu.com/question/49136398
















