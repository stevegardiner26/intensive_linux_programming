#!/bin/bash

# Declare array of the alphabet
letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# Loop through and print the table
for alpha in ${letters[@]}
do
	counter=0
	for i in /bin/$alpha*
	do
		counter=$((counter + 1))
	done
	echo "${alpha} ${counter}"
done
