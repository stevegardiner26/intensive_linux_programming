#!/bin/bash

index_page="https://finance.yahoo.com/most-active"

timer=0
while [ $timer -lt 60 ]
do
    current_date=`date +"%Y_%m_%d_%H_%M_%S"`
    html_file_name="yahoo_${current_date}.html"
    wget -O $html_file_name $index_page
    java -jar /usr/share/java/tagsoup-1.2.1.jar --files $html_file_name
    converted_file_name=${html_file_name/.html/.xhtml}
    python3 database.py $converted_file_name
    sleep 60
    timer=$[$timer+1]
done 