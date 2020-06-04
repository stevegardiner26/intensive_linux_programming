#!/bin/bash

depth=$1
breadth=$2
dir=$3
method=$4

if [ "$method" = "breadth" ]
then
	echo "Breadth"
	remember=($dir)
	for ((i=0;i<depth;i++)); do
		for b in ${remember[@]}; do
			unset #{remember[$b]}
			for ((j=0;j<breadth;j++)); do
				mkdir -p $b/$j
				remember+=("$b/$j")
			done
		done
	done
else
	echo "Depth"
fi
