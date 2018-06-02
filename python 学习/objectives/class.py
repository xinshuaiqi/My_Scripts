# liao xue feng example
# https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/001431864715651c99511036d884cf1b399e65ae0d27f7e000

class Student(object):
    pass

qxs = Student()
qxs # 后面的0x10a67a590是内存地址
Student


class Student(object):
    def __init__(self, name, score):
        self.name = name
        self.score = score
        self.__age = 18
    def print_score(self):
        print('%s: %s' % (self.name, self.score))
    def get_grade(self):
        if self.score >= 90:
            return 'A'
        elif self.score >= 60:
            return 'B'
        else:
            return 'C' 
    # the following function allow you to access private variables    
    def get_age(self):
        return self.__age
    def set_age(self, age):
        self.__age = age
    """
    define a class
        __init__ add property; spectial variable, 
            you can access them from outside
        self is the default variable
        self.__age is a private variable
    """        
        
sss=Student("Shanshan Song",100) # define a instance


sss.name # call the variables in the instance
sss.score

sss.print_score() # call the functions within a instance

sss.get_grade()

sss.get_age()
sss._Student__age  # you can still access private variable in this way

# 继承
class PrettyStudent(Student):
    looks ="Beauti"
    def sayit(self):
        print ("She is very pretty")
sss=PrettyStudent("Shanshan Song",100)

sss.looks
sss.name
sss.sayit()




# 多态 
def superPretty(PrettyStudent):
    PrettyStudent.sayit()
    PrettyStudent.sayit()

superPretty(sss)  # as long as the instance has a "sayit" function, this will work


# how to get more information about an object
type()
dir()
isinstance(sss,Student) # if you want to check whether a instance is a class?
isinstance(sss,PrettyStudent)


# add new function to a class
def speak(self,txt):
    print ('Hi  ',txt)

Student.speak=speak

sss=Student("Shanshan Song",100)

sss.speak("I love you")



## more advanced function 
# https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/00143186781871161bc8d6497004764b398401a401d4cce000
__slots__   # 给实例绑定一个属性








#########################################

class Milo():
            var1 = "class public properties"
            __var2 = "class private properties"   # you can not visit private properties

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


# example 2
class qxs:
    def name(self):
        return "qixinshuai"
    lp ="sss"   
    def __init__(self, fname,lname):
        self.f = "qi"
        self.l = "xinshuai"    

x=qxs()
x.name()
x=qxs("shanshan","song")

x.f


# example 3
class MyClass:
    i = 12345
    def f(self):
        return 'hello world'
    def __init__(self):
        print('This is init content')

x = MyClass()
x.i
x.__init__