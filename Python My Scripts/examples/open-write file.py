#   make a new file
f = open    ('data.txt','w')  #write model
f.write('hello world\n')
f.close()

#read a file
f = open('data.txt')  #open file
text = f.read()     # read entire file  to variable 'text'
print(text)


## read a file and print each line
f = open('list.txt')
lines=f.readlines()

print str(lines) # this is a list 

##  in this way you can out print exactly what is in your input files.
f = open('list.txt')
lines=f.readlines()

from sys import stdout   
printf = stdout.write
for line in lines:
            print (line)


##standard in
import sys
print("Please tell me what you want to input?")
for line in sys.stdin:
            print line

while True:
            reply = input ("Enter text (stop for break):")
            if reply == 'stop': break
            print(reply.upper())

#           a better version
while True:
    reply = raw_input ("Enter text:")      #this is for python 2.7, use "input" for python 3.0
    if reply == 'stop':
                        break
    elif not reply.isdigit():
                        print('not digit')
    else:
                        print reply.upper()      #python 2.7 you can remove () for print
print ('byebye')






###         raw_input
qxs=raw.input("tell me what you want")












