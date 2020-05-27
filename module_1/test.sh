#!/bin/bash

x=0

if [ "$x" -lt "0" ]
then
	echo "X is less than 0"
fi

if ["$x" -le "0" ] && { echo "Done" } || echo "X is not less than or equal"
