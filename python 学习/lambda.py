#           lambda, a fast way, single line
def f(x,y):
	return x*y



#匿名函数 因为函数没有名字，不必担心函数名冲突
f = lambda x: x*x
f(2)


ff = lambda x,y: x+y
ff(2,3)


def build(x):
    return lambda x:x*x*x
    
print(build(2))

#偏函数
#functools.partial的作用就是，把一个函数的某些参数给固定住（也就是设置默认值），
#返回一个新的函数，调用这个新函数会更简单
#当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数
import functools
int2 = functools.partial(int, base=2)
int2('1000000')



def square(x):          # 计算平方数
    return x ** 2

print(map(square, [1,2,3,4,5])) 
