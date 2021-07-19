#!/bin/bash

operation=$1

set -ex

addTeam() {
	gname=$1
	sudo addgroup --force-badname $gname
}

addUser() {
	uname=$1
	gname=$2
	
	
	if id -u $uname >/dev/null 2>&1
	then
		echo "User already exists. Changing permission...."
 		sudo usermod -a -G $gname $uname
                sudo chown -R $uname:$gname /home/$uname
                sudo chmod o-rwx /home/$uname

                echo "Creating shared directories..."
                sudo mkdir /home/$uname/team /home/$uname/ninja /home/$uname/all
                
		sudo setfacl -m g:$gname:rwx /home/$uname/team
		sudo setfacl -m g:$gname:rwx /home/$uname/ninja
		sudo setfacl -m g:$gname:rwx /home/$uname/all
		sudo setfacl -m o:rwx /home/$uname/all
	else
                echo "Creating new user...."
                
		sudo adduser $uname
		
	        echo "changing permissions.."
		sudo usermod -a -G $gname $uname
	        sudo chown -R $uname:$gname /home/$uname
        	sudo chmod o-rwx /home/$uname
		
		echo "Creating shared directories..."
		sudo mkdir /home/$uname/team /home/$uname/ninja /home/$uname/all
		sudo setfacl -m g:$gname:rwx /home/$uname/team
		sudo setfacl -m g:$gname:rwx /home/$uname/ninja
		sudo setfacl -m g:$gname:rwx /home/$uname/all
		sudo setfacl -m o:rwx /home/$uname/all
	fi
}

case $operation in
	addTeam)
		addTeam $2 ;;
	addUser)
		addUser $2 $3 ;;
	*)
		echo "Invalid operation name" ;;
esac
