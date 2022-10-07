#!/bin/bash


#cat -etv <<<"$IFS\n"

oldIFS=$IFS

IFS=","

#cat -etv <<<"$IFS"

while IFS="," read -r user_id user_firstname user_lastname user_password user_role
do

#	DELETE EXISTING SPACES IN CSV FILE VARIABLES

	user_firstname=${user_firstname//[[:blank:]]/}

	user_lastname=${user_lastname//[[:blank:]]/}

	user_name=$user_firstname$user_lastname

	user_name=${user_name,,}

	user_fullname="$user_firstname $user_lastname"


#	CHECK IF USER ID AND GROUP ID EXIST AND ASSIGN THEM TO USER IF THEY DON'T

	id_passwd=$(sudo cat "/etc/passwd" | grep $user_id)

	id_group=$(sudo cat "/etc/group" | grep $user_id)

	if [[ -z $id_passwd && -z $id_group ]]
	then
		echo "L'id $user_id et l'id groupe $user_id n'existent pas, assignation des id correspondant"
		sudo useradd -u $user_id -c "$user_fullname" $user_name
	else
		echo "id déjà utilisé, attribution d'id automatique"
		sudo useradd -c "$user_fullname" $user_name
	fi

#	REMOVE LAST CHARACTER OF LINE WITH %?

	if [ ${user_role%?} = "Admin" ]
	then
		usermod -aG sudo $user_name
	fi


#	SET PASSWORD FROM CSV FILE VALUE

	echo $user_name:$user_password | chpasswd


#	FORCE USER TO CHANGE PASSWORD ON NEXT CONNECTION

	chage -d 0 $user_name

done < <(tail -n +2 Shell_Userlist.csv)



IFS=$oldIFS

#cat -etv <<<"$IFS"
