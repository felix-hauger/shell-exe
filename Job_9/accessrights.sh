#!/bin/bash


#cat -etv <<<"$IFS\n"


oldIFS=$IFS

IFS=","

cat -etv <<<"$IFS"


while IFS="," read -r user_id user_firstname user_lastname password role
do
	echo "id : $user_id"

	echo "prénom : $user_firstname"

	echo "nom de famille : $user_lastname"

	user_name=$user_firstname$user_lastname

	user_name=${user_name,,}

	user_name=${user_name//[[:blank:]]/}

	echo "user name : $user_name"

	echo "mot de passe : $password"

	echo "rôle : $role"

	echo ""

	if [ $role = "Admin" ]
	then
		echo "proute"
	fi


done < <(tail -n +2 Shell_Userlist.csv)



IFS=$oldIFS

#cat -etv <<<"$IFS"
