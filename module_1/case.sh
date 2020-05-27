#!/bin/bash

echo "Please talk to me..."
while :
do
	read INPUT_STRING
	case $INPUT_STRING in
		hello)
			echo "Hello Yourself!"
			;;
		bye)
			echo "See ya later"
			break
			;;
		*)
			echo "I don't understand"
			;;
	esac
done
echo
echo "That's all folks"
