
#########glob 

import glob
files=glob.glob("*.py")
for file in files:
    file=file+"out"
    print(file)

## this can be used to rename files, process every file in a folder

