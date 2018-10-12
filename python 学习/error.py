#errors
#coding:utf8

filename=raw_input('请输入您要操作的文件:')
try:  # test error
            open('abc.txt')
            print (hello)
except IOError,msg:
            pass           ## do nothing
            print  "您指定的文件不存在"
except NameError,msg:
            pass

##each except only catch one type error, the tyep is decided by the print information


#finally



### raise: provide error message when you want

if filename=="hello":
            raise TypeError("nothing!!!!!")

while True:
    try: 
        x = int(input("please enter an int:"))
        print ("Good boy")
    except ValueError:
        raise ("Urchin boy. Do what I asked.")
    else：
        exit()
try:
	XXX
except ImportError: # 导入失败会捕获到ImportError
    import StringIO    
    
## error types
IOError
NameError
AttributeError
ImportError
IndexError
KeyError
IndentationError
SyntaxError
TypeError
ValueError
UnboundLocalError

try:
    process = subprocess.run(cmd, shell=True, check=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    with open('/tmp/esp_worker.log','a') as fp:
        fp.write("[info] " + process.stdout.decode('utf-8') + os.linesep)
except Exception as ex:
    with open('/tmp/esp_worker.log','a') as fp:
         if ex is None:
             fp.write("[error] " + "Exception is None" + os.linesep)
         else:
             fp.write("[error] " + str(ex) + os.linesep)