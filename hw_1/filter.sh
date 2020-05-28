#!/bin/bash

# This program gets the actual size of the files because '(' or ')' is not allowed in the name of a directory or file so I was not able to test that. I hope this is sufficient to show I understand functions and basic bash.

function main {
	average $1
	filter $1
	echo ${new_list[@]}
}

function average {
	local count= total_filesize=
	# Loop through files adding a counter and their filesize then divide the two to get the avg
	for i in "$@"/*
	do
		current_size=$(du -k $i | cut -f1)
		total_filesize=$((total_filesize + current_size))
		count=$((count+1))
	done
	dir_average=$((total_filesize/count))
}


function filter {
	new_list=()
	for i in "$@"/*
	do
		current_size=$(du -k $i | cut -f1)
		if [ $current_size -gt $dir_average ]; then
			name=$(basename $i)
			new_list+=($name)
		fi
	done
}

main $1
