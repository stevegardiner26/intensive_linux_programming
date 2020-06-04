#!/bin/bash

depth=$1
breadth=$2
dir=$3
method=$4

remember=($dir)
if [ "$method" = "breadth" ]
then
	echo "Breadth First Search"
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
	echo "Depth First Search"
	for ((i=0;i<depth;i++)); do
		for b in ${remember[@]}; do
			unset #{remember[$b]}
			for ((j=0;j<breadth;j++)); do
				if [[ "$i" = $((depth - 1)) ]]; then
					mkdir -p $b/$j
				fi
				if [[ ! " ${remember[@]} " =~ "$b/$j" ]]; then
					remember=("$b/$j" "${remember[@]}")
				fi
			done
		done
	done
fi
