#!/bin/bash

for j in $@
do
	input_array+=($j)
done

END=$#
for((i=1;i<END;i++))
do
	j=$((i - 1))
	temp_i_val=${input_array[$i]}
	while [ "$j" -ge 0 ] && [ "${input_array[$j]}" -gt "$temp_i_val" ]
	do
		input_array[$((j+1))]=${input_array[$j]}
		j=$((j - 1))
	done
	input_array[$((j+1))]=$temp_i_val
done

# Print Sorted Array
echo ${input_array[@]}
