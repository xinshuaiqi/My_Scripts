from bs4 import BeautifulSoup
from urllib.request import urlopen

html = urlopen("https://morvanzhou.github.io/static/scraping/table.html").read().decode('utf-8')
print(html)

# load html to bs4
soup = BeautifulSoup(html, features='lxml')
print(soup.h1)

soup.head
soup.body
soup.find_all('href')


# soup + regex, phrase it to a dictionary
import re
links = soup.find_all('img',{'src':re.compile('.*\.jpg')})
for l in links:
    print(l['src'])



# requests a webpage
import requests
import webbrowser

key='plant genome'
key =key.replace(' ', '+')
url = "https://scholar.google.com/citations?view_op=search_authors&hl=en&mauthors=%s&btnG=" % key
print(url)

webbrowser.open(url)





