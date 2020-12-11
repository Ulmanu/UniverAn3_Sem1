import mechanize
from bs4 import BeautifulSoup
import requests
import re

def gethtml(text):
    br=mechanize.Browser()
    htmltext=br.open(text)
    return htmltext

def gethtmlfile(text):
    br=mechanize.Browser()
    htmlfile=br.open(text)
    return htmlfile

def getarticletext(text):
    #link1=requests.get(text).text
    soup1=BeautifulSoup(text,'lxml')
    tags=""
    for tag in soup1.findAll('p'):
        clean = re.compile('<.*?>|&([a-z0-9]+|#[0-9]{1,6}|#x[0-9a-f]{1,6});')
        tags+=re.sub(clean, '', str(tag))
    print (tags)
    return tags

def getarticle(url):
    htmltext=gethtml(url)
    return getarticletext(htmltext)
        
def getkeywords(text):
    common=open("content.txt").read().split('\n')
    word_dict={}
    word_list=text.lower().split()
    for word in word_list :
        if word not in common and word.isalnum():
            if word not in word_dict:
                word_dict[word]=1
            if word in word_dict:
                word_dict[word]+=1
    top_words=sorted(word_dict.items(),key=lambda kv: (-kv[1], kv[0]),reverse=False)[0:30]
    top30=[]
    for w in top_words:
        top30.append(w[0])
    return top30

def getkeywordsindex(text):
    common=open("content.txt").read().split('\n')
    word_dict={}
    word_list=text.lower().split()
    for word in word_list :
        if word not in common and word.isalnum():
            if word not in word_dict:
                word_dict[word]=1
            if word in word_dict:
                word_dict[word]+=1
    top_words=sorted(word_dict.items(),key=lambda kv: (-kv[1], kv[0]),reverse=False)[0:30]
    top30=[]
    for w in top_words:
        top30.append(w[1])
    return top30
