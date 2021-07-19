function serverinfo () {
    Server_Alias=$1 
    Server_Host=$2
    Ssh_User=$3 
    Ssh_Port=$4 
    Ssh_Key_Path=$5
    
    echo "Conection Detail"
    echo "ssh -i ${Ssh_Key_Path} -p ${Ssh_Port} ${Ssh_User}@${Server_Host}" > servers/${Server_Alias}  
}

function Server_List () {
    ls -l servers/ | awk '{print $9}'
}

function Server_Remove () {
    Server_Alias=$1
    rm servers/${Server_Alias}
}

function Server_Details () {
    Server_Alias=$2
    cat servers/${Server_Host}
}