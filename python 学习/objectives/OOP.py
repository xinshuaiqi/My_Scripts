

#object orinted programming 

# first def a class
class exampleClass:
    eye="black"
    age=32
    def method(self):
        return x+"this method works!" 

exampleClass  # your class has been successfully created 

qxs = exampleClass()
qxs.eye
qxs.age
qxs.method()




############        class

##

class Milo():
            var1 = "class public properties"
            __var2 = "class private properties"   # you can not visit private properties
#you can create function within class
            def fun(self):
                        self.var2 ="object public properties self var2"
                        self.__var3 = 'object private var3'
                        var4 = "function local var 4"  ## as a local var, you can only use var4 within this function
                        print(var4)
                        print(self.__var3,"\n")

            def other(self):
                        print(var4)
                        print(self.__var3)


#run
qxs = Milo()

qxs.fun()    # to visit fun , you need to run this
print (qxs.var1)
print (qxs.var2)   # only after run qxs.fun(), you can visit self.var2

song=Milo()  ##first set song as class Milo
song.fun()   

print (song.var2)

#example 2
class className:
    def createName (self,name):
        self.name=name
    def displayName (self):
        return self.name                 # return is very important! 
    def saying (self):
        print "hello %s" % self.name

#refer the above class
first =className()
second = className()

first.createName('qxs')
first.displayName()
second.createName('sss')
second.saying('sssmmm')



##### subclass superclass

class parentClass:
    v1 ="I am v1"
    v2 ="I am v2"

class childClass (parentClass): # inherit all the trait of parentClass/ you can name this also as subclass, superclass
    pass  #this means do nothing
    v3 = "hehe v3"
    v1 = "toast" # you can overwrite variable in parentClass

p_object=parentClass()
p_object.v2

c_object=childClass()
c_object.v1
c_object.v2
c_object.v3

##subclass with multiple 
class mom:
    mm="this is mom"

class child(mom,parentClass):
    pass
    childnew="I am a child"

kid= child()
kid.mm
kid.v2
kid.childnew




##          constructor 
#traditional class
        clsss swine:
            def apple(self):
                print "apple pie and beef"

obj=swine()
obj.apple()

class new:
    # once a new obj cite this function, initialize it with the following function
    def __init__(self): 
        print "this is some thing"  

newobj=new()



## create module 
import sys
sys.path.append('C:\\Users\\qxs\\Documents\\Python Scripts')
import qxs_module
qxs_module.test()
qxs_module.apple()

reload(qxs_module)

# or 
baby=qxs_module.test
baby()

## use buildin module
import math
math.sqrt(81)
# what each module contain
dir(math)
dir(qxs_module)

help(math)
help(qxs_module)

math.__doc__  # for build in module, this will provide you more information



###      maps
income = [10,20,45]
def double(x):
    return x*2

for i in income:
    print (double(i))

new = list(map(double,income))
print new















class Student:
  def __init__(self, name):
    self.name = name
  def sayHi(self):
    print("Hi from "+self.name)
  
s1 = Student("Amy")
s1.sayHi()

# Inheritance
class Animal: 
  def __init__(self, name, color):
    self.name = name
    self.color = color

# subclass
class Cat(Animal):
  def purr(self):
    print("Purr...")
        
class Dog(Animal):
  def bark(self):
    print("Woof!")

fido = Dog("Fido", "brown")
print(fido.color)
fido.bark()


# super function
class A:
  def spam(self):
    print(1)

class B(A):
  def spam(self):
    print(2)
    super().spam() # call the function defined by parent class
            
B().spam()


## 
class SpecialString:
  def __init__(self, cont):
    self.cont = cont

  def __truediv__(self, other):
    line = "=" * len(other.cont)
    return "\n".join([self.cont, line, other.cont])

spam = SpecialString("spam")
hello = SpecialString("Hello world!")
print(spam / hello)



import random

class VagueList:
  def __init__(self, cont):
    self.cont = cont

  def __getitem__(self, index):
    return self.cont[index + random.randint(-1, 1)]

  def __len__(self):
    return random.randint(0, len(self.cont)*2)

vague_list = VagueList(["A", "B", "C", "D", "E"])
print(len(vague_list))
print(len(vague_list))
print(vague_list[2])
print(vague_list[2])



# encapsulation 封装
class Queue:
  def __init__(self, contents):
    self._hiddenlist = list(contents)

  def push(self, value):
    self._hiddenlist.insert(0, value)
   
  def pop(self):
    return self._hiddenlist.pop(-1)

  def __repr__(self):
    return "Queue({})".format(self._hiddenlist)

queue = Queue([1, 2, 3])
print(queue)
queue.push(0)
print(queue)
queue.pop()
print(queue)
print(queue._hiddenlist)





'''================================================================
## 一篇文章搞懂Python中的面向对象编程
# http://yangcongchufang.com/%E9%AB%98%E7%BA%A7python%E7%BC%96%E7%A8%8B%E5%9F%BA%E7%A1%80/python-object-class.html
'''



# define a class
class Student(object):
    """ add some note here """
    
    def __init__(self, name, score):
        self.name =name
        self.score = score
        
    def speak(self):
        print('I am a student!')
        
    def print_socre(std):
    print("%s: %s" % (std.name, std.score))
    

 
#'''类名通常是大写字母开头的单词'''

bart = Student()
bart.speak()

bart
<__main__.Student at 0x2d7e55f6630>  # # bart是Student()的实例

Student
__main__.Student # Student 本身是一个类

bart = Student('diggzhang', 99)
lisa = Student('Lisa Simpson', 87)
bart.age = 8


print_socre(bart)

# 比较
dir(bart)
dir(lisa) 
# bart 比lisa多了个age属性

'''访问限制;  加了__的代码更健壮'''
bart.age=30
bart.age

class Student(object):
    """ add some note here """
    
    def __init__(self, name, score):
        self.__name =name
        self.__score = score
        self.__age =10
    def speak(self):
        print('I am a student!')
        
    def print_socre(std):
    print("%s: %s" % (std.name, std.score))
    

'''
_name，这样的实例变量外部是可以访问的, 建议不要访问
__name 仍然可以访问 通过_Student__name来访问
'''



'''继承 多态'''
class Animal(object):
    def run(self):
        print('running...')
    name = 'I am an Animal'
class Dog(Animal):
    def run(self):
        print("Dog running...")

class Cat(Animal):
    def run(self):
        print("Cat running...")


a= Animal()
a.run()
b = Dog()
b.run()


'''继承类型'''
isinstance(b,Animal)

def run_twice(animal):
    animal.run()
    animal.run()
    
run_twice(a)
run_twice(b)


class Tortoise(Animal):
    def run(self):
        print("Tortoise is running slowly...")
c = Tortoise()

run_twice(Tortoise())


'''
要限制实例的属性 定义一个特殊的__slots__变量

'''
class Student(object):
    __slots__ = ('name', 'age') 
    score = ''
e = Student()
e.name = 'digg'
e.age = '19'
e.score = 99 # 这里会报错

# __slots__定义的属性仅对当前类实例起作用，对继承的子类是不起作用的
class GraduateStudent(Student):
    pass
g = GraduateStudent()
g.score = 9999
























