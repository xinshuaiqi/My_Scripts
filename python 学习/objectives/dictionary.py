##dictionary

#like hash in perl

D = {'food': 'bread',
     'number':'4',
     'color':'red'}   #use big bracket

D['food']


#                   Nesting qian tao

rec = {'name': {'first':'Xinshuai','last':'Qi'},
       'job':['dev','mgr']
                }

print(rec['name']['first'])

print(rec['job'][0])

### add         key- value to dictionary
D['name']='qixinshuai'
print(D)

###  to check if key in the dictionary
print( 'name' in D)
#    or
if not 'qxs' in D:
    print('missing!')

#help('print')

#print dcit
d = {'x': 'A', 'y': 'B', 'z': 'C' }
for k, v in d.items():
    print(k, '=', v)


## order keys in dictionary
ks = list(D.keys()) # extract keys in dic
ks
ks.sort() # sort them 
ks
for key in ks:
    print (key,'=>', D[key])

# alternative way to sor dic
for D[key] in sorted(D):
    print (key,'=>', D[key])


