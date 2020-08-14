# CS288 Homework 8
# Read the skeleton code carefully and try to follow the structure
# You may modify the code but try to stay within the framework.

import sys
import os
#import commands
import re
import sys

import MySQLdb

from xml.dom.minidom import parse, parseString

# for converting dict to xml 
#from cStringIO import StringIO
#from xml.parsers import expat

def get_elms_for_atr_val(tag,atr,val):
   lst=[]
   elms = dom.getElementsByTagName(tag)
   for i in range(len(elms)):
      lst.append(elms[i])

   return lst

# get all text recursively to the bottom
def get_text(e):
   obj={}

   obj["symbol"] = e.childNodes[0].childNodes[1].firstChild.nodeValue
   obj["name"] = e.childNodes[1].firstChild.nodeValue
   obj["price"] = e.childNodes[2].firstChild.firstChild.nodeValue
   obj["change"] = replace_non_alpha_numeric(e.childNodes[3].firstChild.firstChild.nodeValue)
   obj["p_change"] = replace_non_alpha_numeric(e.childNodes[4].firstChild.firstChild.nodeValue)
   obj["volume"] = e.childNodes[5].firstChild.firstChild.nodeValue[:-1]
   obj["market_cap"] = e.childNodes[7].firstChild.firstChild.nodeValue[:-1]
        
   return obj

# replace whitespace chars
def replace_white_space(str):
   p = re.compile(r'\s+')
   new = p.sub(' ',str)   # a lot of \n\t\t\t\t\t\t
   return new.strip()

# replace but these chars including ': and .'
def replace_non_alpha_numeric(s):
   p = re.compile(r'[^a-zA-Z0-9.:-]+')
   #   p = re.compile(r'\W+') # replace whitespace chars
   new = p.sub(' ',s)
   return new.strip()

# convert to xhtml
# use: java -jar tagsoup-1.2.jar --files html_file
def html_to_xml(fn):
   # ............
   return xhtml_file

def extract_values(dm):
   lst = []
   l = get_elms_for_atr_val('tr','class','most_actives')
   first=True
   for tr in l:
      if not first:
         text = get_text(tr)
         lst.append(text)

      first = False    

   return lst

# mysql> describe most_active;
def insert_to_db(l,tbl):
   mydb = MySQLdb.connect(
      host="localhost",
      user="cs288",
      password="cs288pw",
      database="stock_market"
   )
   mycursor = mydb.cursor()
   # Create Table first
   s = "CREATE TABLE IF NOT EXISTS " + tbl + " (symbol VARCHAR(10), name VARCHAR(80), price float, chng float(10, 3), p_change float, volume float, market_cap float)"
   mycursor.execute(s)

   sql = "INSERT INTO " + tbl + " (symbol, name, price, chng, p_change, volume, market_cap) VALUES (%s, %s, %s, %s, %s, %s, %s)"
   val = []
   for item in l:
      val.append((item["symbol"], item["name"], item["price"], item["change"], item["p_change"], item["volume"], item["market_cap"]))

   mycursor.executemany(sql, val)

   mydb.commit()

   print(mycursor.rowcount, "was inserted.")
   return mycursor

def select_from_db(cursor, fn):
   s = "SELECT * FROM " + fn 
   cursor.execute(s)
   response = cursor.fetchall()
   return response

# show databases;
# show tables;
def main():
   xhtml_fn = sys.argv[1]
   fn = xhtml_fn.replace('.xhtml','')
   #xhtml_fn = html_to_xml(html_fn)

   global dom
   dom = parse(xhtml_fn)

   lst = extract_values(dom)

   # make sure your mysql server is up and running
   cursor = insert_to_db(lst,fn) # fn = table name for mysql

   l = select_from_db(cursor,fn) # display the table on the screen
   for i in l:
      print(i)
   # make sure the Apache web server is up and running
   # write a PHP script to display the table(s) on your browser
   xml = l
   return xml
# end of main()

if __name__ == "__main__":
    main()

# end of hw7.py