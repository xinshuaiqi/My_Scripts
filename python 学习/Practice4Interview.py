# Practice4Interview.py

'''
Store your street address, city, state, and zip code in variables 
(or even better, a dictionary!), then print them in the usual format:
'''

info ={
    "name": "Xinshuai Qi",
    "city": 'Tucson',
    'treet':' 2929 E 6th St',
    'state':'Arizona',
    'zip':'85716',    
}

print(info['name'])
print(info['city']+","+info['state']+","+info['zip'])




'''
Write a program that converts seconds to years. Test your program with 
600000000 seconds, 60 seconds, and 40000.33 seconds.
'''

def t2m (t):
    m = t/60
    return m
    
t2m(600)  


'''
Create a collection of these authors and the year they kicked the bucket. Print the collection in the following format:

Charles Dickens died in 1870.
'''
authors = {
    "Charles Dickens": "1870",
    "William Thackeray": "1863",
    "Anthony Trollope": "1882",
    "Gerard Manley Hopkins": "1889"
}

authors.keys()
len(authors.items())
 
for key, value in authors.items():
    out ="%s died in %s"
    var = (key,value)
    print(out % var)    
    
#    
answers = ["Arrr! How are ye?", "Hello, friend."]

for i in answers:
    if "Arrr!" in i:
        print("Go away, scurvy sea dog!")
    else:
        print("Welcome!")



# Print out the longest word in “The quick brown fox jumped over the lazy dogs” and its length.
sentence = "The quick brown fox jumped over the lazy dogs"
import re
s = sentence.split()

for m in s:
    print(m)
    
    
 




