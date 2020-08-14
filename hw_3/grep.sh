#!/bin/bash

# Download page from youtube
# wget -O index.html "$@"

# Grep the view count
views= grep -oP "[0-9,]+(?=\sviews)" index.html
echo $views
titles= grep -oP "title (?=\stitles)" index.html
echo $titles
