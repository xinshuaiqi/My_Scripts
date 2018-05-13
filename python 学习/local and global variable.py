x = 50


x = 50

def func(x):
    print('x等于', x)
    x = 2
    print('局部变量x改变为', x)

func(x)
print('x一直是', x)




def func():
    global x  # 50

    print('x的值是', x)
    x = 2
    print('全局变量x改为', x)  # local 2

func()
print('x的值是', x)   # 50


