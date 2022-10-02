#!/bin/bash


nb_connections="Nombre de connexions sur ma session : $(last fel | wc -l)"

echo $nb_connections


nb_logs_file="number_connection-$(date +%d-%m-%Y-%H:%M)"

printf "$nb_connections" > "$nb_logs_file"
tar -cf "/home/fel/Dev/git/shell.exe/Job_8/$nb_logs_file.tar" "$nb_logs_file"
mv "/home/fel/Dev/git/shell.exe/Job_8/$nb_logs_file.tar" "/home/fel/Dev/git/shell.exe/Job_8/Backup/"

if [ -f "/home/fel/$nb_logs_file" ]
then
	mv "$nb_logs_file" "/home/fel/Dev/git/shell.exe/Job_8/"
fi

