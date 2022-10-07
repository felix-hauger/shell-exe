#!/bin/bash


#cat -etv <<<"$IFS\n"

oldIFS=$IFS

IFS=","

#cat -etv <<<"$IFS"

while IFS="," read -r user_id user_firstname user_lastname user_password user_role
do

	echo "id : $user_id"

#	DELETE EXISTING SPACES IN CSV FILE VARIABLES

	user_firstname=${user_firstname//[[:blank:]]/}
	echo "prénom : $user_firstname"

	user_lastname=${user_lastname//[[:blank:]]/}
	echo "nom de famille : $user_lastname"

	user_name=$user_firstname$user_lastname
	user_name=${user_name,,}
	echo "user name : $user_name"

	user_fullname="$user_firstname $user_lastname"
	echo "nom complet : $user_fullname"

#	echo "mot de passe : $user_password"

	echo "rôle : $user_role"


#	CHECK IF USER ID AND GROUP ID EXIST AND ASSIGN THEM TO USER IF THEY DON'T

	id_passwd=$(sudo cat "/etc/passwd" | grep $user_id)
	echo $id_passwd

	id_group=$(sudo cat "/etc/group" | grep $user_id)
	echo $id_group

	if [[ -z $id_passwd && -z $id_group ]]
	then
		echo "L'id $user_id et l'id groupe $user_id n'existent pas, assignation des id correspondant"
		sudo useradd -u $user_id -c "$user_fullname" $user_name
	else
		echo "id déjà utilisé, attribution d'id automatique"
		sudo useradd -c "$user_fullname" $user_name
	fi


	if [ ${user_role%?} = "Admin" ]
	then
		usermod -aG sudo $user_name
		echo "proute"
	fi

	echo $user_name:$user_password | chpasswd

	echo ""

done < <(tail -n +2 Shell_Userlist.csv)



IFS=$oldIFS

#cat -etv <<<"$IFS"
