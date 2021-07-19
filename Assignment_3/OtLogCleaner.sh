#!/bin/bash


function logInfo(){
dt=`date '+%d/%m/%Y_%H:%M:%S'`
MSG="$1"
echo "[INFO] [$dt] ${MSG}" >> ${ot_log_cleaner_log}

}


function logError(){
dt=`date '+%d/%m/%Y_%H:%M:%S'`
MSG="$1"
echo " [ERROR] [$dt] [$1]" >> ${ot_log_cleaner_log}

}

# For Size

function getFileSize(){
FILE_PATH=$1
wc -c </var/log/andy.log

}

#For rotating

function rotatelogfile() { 
 FILE_PATH=$1
 Target_Location=$2
 mv $1 $2
 Backup_retained=$3 
} 


 


CONF_FILE=$1

# echo "Reading conf file ${CONF_FILE}"
source ${CONF_FILE}
echo "Log output to ${ot_log_cleaner_log}"

logInfo "Reading conf file ${CONF_FILE}" 
logInfo "Reading conf file ${log_file_path}"
logInfo "If size is greater then ${log_rotate_size}"


if test -f "${log_file_path}"; then
    logInfo "File Processing ${log_file_path}"
    FILE_SIZE=`getFileSize ${log_file_path} `
    logInfo "Size of File ${log_file_path} is ${FILE_SIZE}"

    #Checking File Size
    if [ "$FILE_SIZE" -gt "${log_rotate_size}" ]; then
	    logInfo "File size exced have to rotate log file ${log_file_path} to ${log_backup_dir}"
	   
	  rotatelogfile ${log_file_path} ${log_backup_dir} ${backup_retained}
    else
	    logInfo "File ${log_file_path} is still below threshold"
    fi


else
	logError "File ${log_file_path} doesn't exit"

fi

