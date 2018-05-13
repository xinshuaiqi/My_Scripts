##

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