#!/bin/bash

echo $2

first_value=$1
operator=$2
second_value=$3

echo $first_value
echo $operator
echo $second_value

#if [ operator = "*" ]
#then
#	first_v=$first_value
#	for ((i=1; i<$second_value; i++))
#		first_value=$first_value+$first_v
#done

#echo $first_value
#echo $operator
#echo $second_value

if $operator = "x"
then
	$operator=\*
fi

echo $operator

result=$(( $first_value$operator$second_value ))

echo $result
