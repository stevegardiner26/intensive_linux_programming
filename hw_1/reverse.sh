#!/bin/bash

reversed=()

function reverse {
	array=()
	counter=0
	for i in "$1"/*
	do
		array+=($i)
		counter=$((counter + 1))
	done
	for j in ${array[@]}
	do
		reversed+=(${array[$counter]})
		counter=$((counter - 1))
	done
}

function main {
	reverse "$1"
	echo ${reversed[@]}
}

main "$1"
