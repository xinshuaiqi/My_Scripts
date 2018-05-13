# -*- coding: utf-8 -*-
"""
Created on Thu Aug 25 18:38:03 2016

@author: qxs
"""

#matplotlib 教程
import numpy as np
import matplotlib.pyplot as plt

# sin plot
x=np.arange(-5,5,1)
plt.plot(x,sin(x))
plt.show()

x = np.linspace(-1, 1, 50)
y = 2*x + 1

plt.figure()
plt.plot(x,y)
plt.show()

y1 = 2*x + 1
y2 = x**2
plt.figure(num=3, figsize=(8, 5),)
plt.plot(x, y2)
plt.plot(x, y1, color='red', linewidth=1.0, linestyle='--')

T = np.arctan2(x,y) # for color value
plt.scatter(x, y)
plt.scatter(x, y, s=75, c=T, alpha=.5)


plt.bar(x,+y)

# a scatter plot

fs = 18
ms = 10
all_files = [ 'nets' + str(i) + '.txt' for i in np.arange(1,5) ]
plot_file = "dots.ex1.png"
plot_file = "dots.ex1.pdf"
plot_file = "dots.ex1.jpg"

## input file must all number, except the first line as head
data = [ np.loadtxt(all_files[i]) for i in range(0, len(all_files))]

subdata = data[0]
plt.plot(subdata[:,6], subdata[:,9], 'r+', markersize = ms, label = 'Nets 1')

subdata = data[1]
plt.plot(subdata[:,6], subdata[:,9], 'mx', markersize = ms, label = 'Nets 2')

subdata = data[2]
plt.plot(subdata[:,6], subdata[:,9], 'bs', markersize = ms, label = 'Nets 3')

subdata = data[3]
plt.plot(subdata[:,6], subdata[:,9], 'gv', markersize = ms, label = 'Nets 4')



plt.title('This is title', fontsize=fs)
plt.xlabel('Clustering Coefficient', fontsize=fs)
plt.ylabel('Efficiency', fontsize=fs)
plt.xlim((0,1))
plt.ylim((0,1))
for label in plt.gca().xaxis.get_ticklabels():
 label.set_fontsize(fs)
for label in plt.gca().yaxis.get_ticklabels():
 label.set_fontsize(fs)
plt.legend(loc=0, fontsize=fs)
plt.savefig(plot_file, bbox_inches='tight')













