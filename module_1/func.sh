#!/bin/bash

echo a b c
function my_func() {
	local x=$1 y=$2 p= q= r= cnt=
	echo $x
	y=$x
	echo $y
}

function main() {
	p=$1 q=$2
	echo p=$p q=$q
	my_func $p $q
	# unknown= `my_func $p $q`
       	echo $unknown	
}

echo 0=$0 1=$1 2=$2 3=$3 4=$4
main $1 $2 $3 $4

