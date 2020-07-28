#!/bin/bash

index_page="https://finance.yahoo.com/most-active"

wget -O $html_file_name $index_page

# let timer var = 0
# while loops to make sure this executes 60 times so it gets every minute in an hour while timervar < 60
current_date=`date +"%Y_%m_%d_%H_%M_%S"`
html_file_name="yahoo_${current_date}.html"
# wget
# java -jar /usr/share/java/tagsoup-1.2.1.jar --files $html_file_name
# Calculate the final file xfn=${hfn/.html/.xhtml}
# run python code to extract and send to db / python database.py $html_file_name
# sleep 60 // Sleep for 1min
# timer + 1