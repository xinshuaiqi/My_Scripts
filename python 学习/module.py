'''\
每一个包目录下面都会有一个__init__.py的文件
__init__.py可以是空文件
'''

#!/usr/bin/env python3
# -*- coding: utf-8 -*-' a test module '__author__ = 'Michael Liao'import sysdef test():

args = sys.argv    
if len(args)==1:
        print('Hello, world!')    
elif len(args)==2:
        print('Hello, %s!' % args[1]) 
else:
        print('Too many arguments!')
if __name__=='__main__':
       test()

# this will import everything, and you can all the variable and function directly.
from pp import * 


#第三方 module

pip install Pillow
pip3 install XXXX

Pillow，处理图片易如反掌
from PIL import Image
im = Image.open('test.png')
print(im.format, im.size, im.mode)
PNG (400, 300) RGB
im.thumbnail((200, 100))
im.save('thumb.jpg', 'JPEG')

MySQL的驱动：mysql-connector-python，
用于科学计算的NumPy库：numpy，
用于生成文本的模板工具Jinja2

# Python之编写模块
# http://www.infoq.com/cn/articles/Python-writing-module
# 运行程序时， 得先告诉它我写了这样一个文件
import sys
sys.path.append('/Users/michael/my_py_scripts')
import mu_py_scripts

'''
解释器，英文是：interpreter，在Python中，它的作用就是将.py的文件转化为.pyc文件，而.pyc文件是由字节码（bytecode）构成的，然后计算机执行.pyc文件。
当Python解释器读取了.py文件，先将它变成由字节码组成的.pyc文件，
然后这个.pyc文件交给一个叫作Python虚拟机的东西去运行（那些号称编译型的语言也是这个流程，不同的是它们先有一个明显的编译过程，编译好了之后再运行）。
如果.py文件修改了，Python解释器会重新编译，只是这个编译过程不全显示给你看。
'''

'''
如果要作为程序执行，则__name__ == "__main__"；
如果作为模块引入，则pm.__name__ == "pm"，即变量__name__的值是模块名称。
'''

#用下面的方法可以看到模块所在位置：
import sys
import pprint
pprint.pprint(sys.path)

# 设置PYTHONPATH环境变量
将存放python文件的目录添加到环境变量。
export PATH = /home/qw/python:$PATH

包和库都是比“模块”大的。
一般来讲，一个“包”里面会有多个模块，
当然，“库”是一个更大的概念了，比如Python标准库中的每个库都有好多个包，每个包都有若干个模块。

# package
__init__.py


#qxs's module
def test():
    pass
    print "qxs, your test works"
def apple():
    print "apple pie and beef"
    __doc__ "this will print some message for you"

__version__="1.0"

dir(sys)  # list all function as a list














