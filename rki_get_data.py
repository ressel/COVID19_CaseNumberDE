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

#print (soup.findAll('td'))

data = []
table = soup.find('table')
#rows = table.findAll('tr')
#for row in rows:
#    print(row)
#
#    cols = row.findAll('td')[6]
#    print(cols)
#
#    country = cols[0].string
#    number  = cols[1].string
#    diff    = cols[2].string
#    np100t  = cols[3].string
#    dead    = cols[4].string
#    #remarks = cols[5].string
#
#    #entry = (country, number, diff, np100t, dead, remarks)
#    entry = (country, number, diff, np100t, dead)
#    print (entry)

dt_date = datetime.datetime.now()
date    = datetime.date.today()
#print ("The Current date is:" ,dt_date)
#print("In specified format:", dt_date.isoformat())
filename='RKI_Corona_'+dt_date.isoformat()
f1=open(filename, 'w')

rows = table.find_all('tr')
#print(rows)
for row in rows:
    cols = row.findAll('td')
    if len(cols) > 0:
      country = cols[0].text.strip()
      number  = cols[1].text.strip()
      diff    = cols[2].text.strip()
      np100t  = cols[3].text.strip()
      inc7    = cols[4].text.strip()
      dead    = cols[5].text.strip()
      f1.write("%s, %s, %s, %s, %s, %s\n" % (date, country, number, diff, np100t, dead))
    #cols = [ele.text.strip() for ele in cols]
    #data.append([ele for ele in cols if ele])

f1.close()

print(filename)
