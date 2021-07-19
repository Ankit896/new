#!/bin/bash

source sshfunction.sh

ACTION="a"
Server_Alias="server"
Server_Host="localhost"
Ssh_User="ubuntu"
Ssh_Port="22"
Ssh_Key_Path="~/.ssh/id_rsa"

while getopts "draln:h:u:p:i" arg; do
  case $arg in
   d)
      ACTION="details"
      echo "User wants to see the server details";; 
    l)
      ACTION="list"
      echo "User wants to list a server";; 
    r)
      ACTION="remove"
      echo "User wants to remove a server";;
    a)
      ACTION="add"
      echo "User wants to add a server";; 
    n)
     Server_Alias=${OPTARG}
      echo "Server Alias is ${Server_Alias}";; 

    h)
     Server_Host=${OPTARG}
      echo "Server Host is ${Server_Host}";; 
    u)
     Ssh_User=${OPTARG}
      echo "Server User is ${Ssh_User}";; 
    p)
     Ssh_Port=${OPTARG}
      echo "Port no is ${Ssh_Port}";; 
    i)
     Ssh_Key_Path=${OPTARG}
      echo "Server key is ${Ssh_Key_Path}";; 


  esac
done

case $ACTION in
    add)
    echo "I will Store the server information"
    serverinfo  ${Server_Alias} ${Server_Host} ${Ssh_User} ${Ssh_Port} ${Ssh_Key_Path};;
    
    list)
    echo "I will list all the server"
    Server_List ;;

    remove)
    echo "I will remove  the server ${Server_Alias}"
    Server_Remove ${Server_Alias}  ;;
    details)
     echo "I want to see the server Details ${Server_Alias}"
    Server_Details ${Server_Alias}  ;;


esac