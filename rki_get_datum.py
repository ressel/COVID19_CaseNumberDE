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

Tags = soup.findAll("div", {"class":"dateOfIssue"})
for tag in Tags:
    #print(tag)
    Stand = tag.find("p")
    #print(Stand)
    Datum=Stand.string.split(":")[1].strip()
    
print(Datum)
