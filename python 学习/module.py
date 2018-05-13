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

# 运行程序时， 
import sys
sys.path
sys.path.append('/Users/michael/my_py_scripts')




























