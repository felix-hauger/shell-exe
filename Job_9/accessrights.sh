#!/bin/bash


#cat -etv <<<"$IFS\n"


oldIFS=$IFS

IFS=","

cat -etv <<<"$IFS"



while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4 rec_column5
do
	#echo "$rec_column1"
	user_id=$rec_column1
	echo "id : $user_id"
#	echo "colonne 2 : $rec_column2"

	user_firstname=$rec_column2
#	echo "prénom : $user_firstname"
#	echo "colonne 3 : $rec_column3"

	user_lastname=$rec_column3
	echo "nom de famille : $user_lastname"

	user_name=$user_firstname$user_lastname
#	echo "$user_name"

	user_name=${user_name,,}
#	echo "$user_name"

	user_name=${user_name//[[:blank:]]/}
	echo "user name : $user_name"
#	echo "$rec_column4"

	password=$rec_column4
#	echo "$rec_column5"
	echo "mot de passe : $password"

	role=$rec_column5
	echo "rôle : $role"

	echo ""

done < <(tail -n +2 Shell_Userlist.csv)



IFS=$oldIFS

#cat -etv <<<"$IFS"
