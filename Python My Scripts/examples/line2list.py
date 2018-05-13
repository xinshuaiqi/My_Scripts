## read line 2 list, then perform some step


for line in open('list.txt') :
            #print(line)
            list=line.split()          #split each line to a list, then print the list
            print(list[0],list[1])


            ##################

with open ('list.txt') as f:
            lines = f.read().splitlines()
            print(lines[0])

f=open('list.txt')
lines=f.readlines()
for line in lines:
            print(line)



