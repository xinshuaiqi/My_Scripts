 Comprehensions
 
 
for item in list:
    if conditional:
        expression
		
new_list = [expression(i) for i in old_list if filter(i)]

x= [i for i in range(10)]
print(x)

[x.lower() for x in ["A","B","C"]]
