#!/bin/bash

INPUT_STRING="hello"

while $INPUT_STRING != "bye":
do
	echo "Hello John (bye to exit)"
	read INPUT_STRING
	echo "You typed ${INPUT_STRING}"
done
