#!/bin/bash


first_value=$1
operator=$2
second_value=$3

echo $first_value

if [ $operator = "x" ]
then
	operator=\*
fi

result=$(( $first_value$operator$second_value ))

echo $result
