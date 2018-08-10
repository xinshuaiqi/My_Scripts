# -*- coding: utf-8 -*-
"""
Created on Mon Dec 25 12:07:02 2017

@author: qxs
"""

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = 2*x + 1
z=np.sin(x)

data= 2 * np.random.random((10,10))
data2= 3 * np.random.random((10,10))



plt.figure()
plt.plot(x, y, color='red', linewidth=1.0, linestyle='--')
plt.xlim((-1, 2))
plt.ylim((-2, 3))
plt.xlabel('I am x')
plt.ylabel('I am y')
plt.show()



