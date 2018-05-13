
#######                         string
S="songshanshan"
len(S)

S[0]
S[-1] ## last iterm
S[-3:]  ##  from last 3 to the end
S[:-3] ## print, except the last three
S + '123'

#string Ìæ´ú
name="qxs"
age="32"

s="my name is {name}, my age is {age}"
print(s)

##remove empty part

a='          abc'
a.strip()

b='\t\tsss'
b.strip()

c='ATCG\n\r'
c.strip()