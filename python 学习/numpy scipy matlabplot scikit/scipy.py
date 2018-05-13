# http://www.scipy-lectures.org/intro/scipy.html

import numpy as np
from scipy import stats

# input output
from scipy import io as spio

 a = np.ones((3,3,2))
spio.savemat('file.mat', {'a': a}) # savemat expects a dictionary
data = spio.loadmat('file.mat', struct_as_record=True)
data['a']

#还可以读image 此处略过 看原文


# scipy cheat sheet
np
np.mgrid[0:5,0:5]
np.ogrid[0:5,0:5]


a=np.array([[(1.5,2,3), (4,5,6)], [(3,2,1), (4,5,6)]])
a

a.flatten()

np.transpose(a)

b=np.matrix(np.random.random((5,5)))
b.T

