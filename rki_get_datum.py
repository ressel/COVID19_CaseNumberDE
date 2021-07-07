# Import libraries
import requests
import urllib.request
import time
import datetime
from bs4 import BeautifulSoup

# Set the URL you want to webscrape from
#url = 'http://web.mta.info/developers/turnstile.html'
url = 'https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Fallzahlen.html'

# Connect to the URL
response = requests.get(url)
#print (response)

# Parse HTML and save to BeautifulSoup object¶
soup = BeautifulSoup(response.text, "html.parser")
#print(soup)

#am Anfang der Seite
Tags = soup.findAll("div", {"id":"main"})
#print(Tags)
count=0;
for tag in Tags:
    #print(tag)
    #print ('\n\n')
    Stand1 = tag.findAll("p")
    for tag2 in Stand1:
        count = count + 1;
    #Datum1=Stand1.string.split(":")[1].strip()
    #print(Datum1)
        #print(tag2)
#    print('\ncount = ', count)
        if count == 2:
            print('\nDatum am ANFANG der Seite: ')
            print(tag2)
            print('\n')
            
        
#print('\nDatum am Anfang der Seite: ' )
#print(Stand1)
    
#am Ende der Seite
Tags = soup.findAll("div", {"class":"dateOfIssue"})
for tag in Tags:
     #print(tag)
     Stand = tag.find("p")
     Datum=Stand.string.split(":")[1].strip()
print('\nDatum am Ende der Seite: ')
print(Datum)

