#!/bin/bash

#set -ex

operation=$1
GroupName=$2
UserName=$3


#1- Add NinjaTeam (Group).

	function addGroup(){
 			
	var1=`grep $GroupName /etc/group | awk -F":" '{print $1}'`  
    
    if [[ $var1 == "$GroupName" ]]
 	then
    echo "$GroupName exists"
    else
    sudo groupadd $GroupName
	echo "$GroupName is created."
	fi
    }


#2- Add a User under a Group.

	function addUserToGroup(){
		
		#User Creation
		
		var2=`grep -w $UserName /etc/passwd | awk -F":" '{print $1}'`

		if [[ $var2 == $UserName ]]

		then
			echo "User " $UserName " already exixts"
		else
	
		var3=`grep "^$UserName" /etc/group | awk -F":" '{print $1}'`

		if [[ $var3 == $UserName ]]

		then

		echo "Group -> " $UserName " already exixts"

		else

		sudo groupadd $UserName
		echo "Group-> " $UserName "is created"
						
		fi

		sudo useradd -m -g $UserName $UserName
		echo "User " $UserName "is created"

		sudo mkdir -p /home/$UserName/team
		sudo chmod 775 /home/$UserName/team

		sudo mkdir -p /home/$UserName/ninja
		sudo chmod 775 /home/$UserName/ninja

		sudo mkdir -p /home/$UserName/all
		sudo chmod 777 /home/$UserName/all


		sudo chmod 770 /home/$UserName/ 


		fi
		


		#Group Creation
		
		var3=`grep "^$GroupName" /etc/group | awk -F":" '{print $1}'`
		
		if [[ $var3 == $GroupName ]]
		
		then
			echo "Group => "$GroupName " already exixts"

		else
			
			sudo groupadd $GroupName
			echo "Group => "$GroupName "is created"
			
		fi
			sudo usermod -a -G $GroupName $UserName
			echo "User =>  $UserName is added into Group => $GroupName "

		}


	case $operation in

	addgroup) addGroup ;;
	addusers) addUserToGroup ;;
	

	*) 
	
	echo "Invalid entry." ;;

	esac