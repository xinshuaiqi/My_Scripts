
#current dir 
import os
os.getcwd()
##set dir 
os.chdir('C:\\Users\\qxs\\Documents\\Python Scripts')
#  
os.chdir("C:\\Users\\evrpa\\OneDrive - Monsanto\\GitHub\\My_Scripts\\python ??")


# remove line break
line = 'aaa,bbb,ccc,ddd\n'
line=line.rstrip() #        remove \n
line


# input

x=input("Enter name: \n>")
print (x)

x,y=input().split(",")
print(x+y)




## argv 
from sys import argv
#"python", "Xinshuai","Wei Ning", "Shanshan" = argv
a,b,c = argv

print ("The script is called:", a)





###  standard in
#import sys
#print("Please tell me what you want to input?")
#for line in sys.stdin:
#            print (line)
#
#while True:
#            reply = raw_input ("Enter text (stop for break):")
#            if reply == 'stop': break
#            print(reply.upper())
#
##           a better version
#while True:
#    #reply = raw_input ("Enter text:")      #this is for python 2.7, use "input" for python 3.0
#    reply = input ("Enter text:") 
#    if reply == 'stop':
#                        break
#    elif not reply.isdigit():
#                        print('not digit')
#    else:
#                        print(reply.upper())      #python 2.7 you can remove () for print
#print ('byebye')






###open and write to a file
with open ('list.txt') as fl:
    for line in fl:
        print(line)


LMF=open("list.txt").readlines()
type(LMF) # list
print(LMF[0])
len(LMF)




#   make a new file
f = open('c:document/data.txt','w')  #write model
f = open('data.txt','w')  #write model
f.write('hello world\n')
f.close()


##                                   print to file
qxs = 'qxinshuai'
import sys
f=open ('out.txt','w')
f.write(qxs)
f.close()

#read a file
f = open('data.txt')  #open file
f = open('data.txt'£¬'r')
f.read(3) # only read the frist 3 bite.  
f.read() # read the rest part of the file
text = f.read()     # read entire file  to variable 'text'
print(text)

##                          read a file and print each line
f = open('list.txt')
f.readline()
lines=f.readlines()
print str(lines) # this is a list 
lines[1]


##                      print exactly what is in your input files.
f = open('list.txt')
lines=f.readlines()

from sys import stdout   
printf = stdout.write
for line in lines:
            print (line)

##edit a specific line in the list.txt
f = open('list.txt','w')
lines=f.readlines()
lines[2]="mmmmm I am hydir\n"
f.writelines(lines)
f.close()

##                      standard in
import sys
print("Please tell me what you want to input?")
for line in sys.stdin:
            print line

while True:
            reply = raw_input ("Enter text (stop for break):")
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



'''read a file'''

#read a file
f = open('¡¢usr/data.txt')  #open file
f = open('data.txt'£¬'r')

f.read() # read the rest part of the file
f.read(3) # only read the frist 3 bite.
text = f.read()     # read entire file  to variable 'text'

print(text)

f.close()


##  read a file and print each line
f = open('list.txt')
f.readline()
lines=f.readlines()
print str(lines) # this is a list
lines[1]

##    print exactly what is in your input files.
f = open('list.txt')
lines=f.readlines()

from sys import stdout
printf = stdout.write
for line in lines:
            print (line)

##edit a specific line in the list.txt
f = open('list.txt','w')
lines=f.readlines()
lines[2]="mmmmm I am hydir\n"
f.writelines(lines
f.close()

# ¼òÐ´
with open ('paty/to/file','r') as f:
	print (f.read())



'''output write to a file'''
##                                   print to file
qxs = 'qxinshuai'
import sys
f=open ('out.txt','w')
f.write(qxs)
f.close()

###open and write to a file
#   make a new file
f = open('c:document/data.txt','w')  #write model
f = open('data.txt','w')  #write model
f.write('hello world\n')
f.close()

#¼òÐ´£º
with open ('/sure/file','w') as f:
	f.write("hellow world!")
	
# 	Python  ##################
# http://www.runoob.com/python/python-command-line-arguments.html	
#!/usr/bin/python
# -*- coding: UTF-8 -*-

import sys, getopt

def main(argv):
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
   except getopt.GetoptError:
      print 'test.py -i <inputfile> -o <outputfile>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'test.py -i <inputfile> -o <outputfile>'
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   print ('enter your input', inputfile)
   print ('enter your output file name', outputfile)

if __name__ == "__main__":
   main(sys.argv[1:])