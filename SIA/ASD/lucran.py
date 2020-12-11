import requests
import re
query=input("keyword:")
who_link="http://www.scholarpedia.org/w/index.php?title=Special%3ASearch&profile=default&search="+query+"&fulltext=Search"
headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'}

link=requests.get(who_link,headers=headers).text
print(link)
from bs4 import BeautifulSoup
soup=BeautifulSoup(link,'lxml')
print(who_link)
print(soup)
print(soup.prettify())
selectall=soup.find_all("div",{"class": "searchresult"})
#print(*selectall,sep='\n')

stri = [''  for stri in range(len(selectall))]
i=0
for lin in selectall:
    stri[i]=str(lin)
    i=i+1


for i in stri:
    clean = re.compile('<.*?>')
    i=re.sub(clean, '', i)
    print(i)



selectall1=soup.find_all("div",{"class": "mw-search-result-heading"})
#print(*selectall,sep='\n')

stri1 = [''  for stri1 in range(len(selectall))]
i=0
for lin in selectall1:
    stri1[i]=str(lin)
    i=i+1


for i in stri1:
    clean = re.compile('<.*?>')
    i=re.sub(clean, '', i)
    print(i)
