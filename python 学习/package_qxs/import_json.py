import json
from pprint import pprint

with open('input.json') as data_file:    
    data = json.load(data_file)
pprint(data)


data["maps"][0]["id"]  # will return 'blabla'
data["masks"]["id"]    # will return 'valore'
data["om_points"]      # will return 'value'


d = dict(name='Bob', age=20, score=88)
json.dumps(d)


