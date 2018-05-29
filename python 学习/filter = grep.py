##          filter function, which is equal to grep function

## now grep elements in an list

names = ['aet2000','ppt2000', 'aet2001', 'ppt2001']
qxs = filter(lambda x:'aet' in x, names)
print(qxs)


## with regex

import re
qxs = filter (lambda x: re.search(r'\d+',x),names)    ##not sure what 'lambda' mean here.
print (qxs)



import glob
glob.glob("*.txt")
# ['data.txt', 'list.txt', 'out.txt']