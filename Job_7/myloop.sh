#!/bin/bash

for (( i=0; i<10; i++))
do
	echo "Je suis un script qui arrive à faire une boucle $(($i+1))"
done

echo -e "\nDeuxième tour avec for in\n"

for i in {1..10}

do
	echo "Je suis un script qui arrive à faire une boucle $i"
done


