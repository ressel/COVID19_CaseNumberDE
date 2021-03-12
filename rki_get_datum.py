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
for tag in Tags:
     #print(tag)
     Stand = tag.p
print('\nDatum am Anfang der Seite: ' )
print(Stand)
    
#am Ende der Seite
Tags = soup.findAll("div", {"class":"dateOfIssue"})
for tag in Tags:
     #print(tag)
     Stand = tag.find("p")
     Datum=Stand.string.split(":")[1].strip()
print('\nDatum am Ende der Seite: ')
print(Datum)

