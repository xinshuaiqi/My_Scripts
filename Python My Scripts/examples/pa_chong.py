##pa_chong

###         get jpg from a website
#!/usr/bin/python

import re
import urllib
## get website
def getHtml(url):
            page=urllib.urlopen(url)         # access the webpage   
            html=page.read()        #read page source code to html
            return html

#use regex
def getImg(html):
            reg = r'src="(.*?\.jpg)" width'  #here is the regex
            imgre=re.compile(reg)  # comple 
            imglist = re.findall(imgre,html)
            x=0
            for imgurl in imglist:
                        urllib.urlretrieve(imgurl,'%s.jpg'%x)
                        x+=1
                        
            return imglist


html= getHtml("http://weibo.com/milozou?s=6uyXnP&is_all=1")


print getImg(html)
