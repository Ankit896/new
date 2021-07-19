#!/bin/bash

operation=$1


killProcess () {
	if [ $1 -eq $1 ] 
	then
		pid=$1
		kill -9 $pid
	else
		processName=$1
		pkill $processName
	fi
}


RunningDurationProcess () {
	if [ $1 -eq $1 ]
        then
                pid=$1
                ps -p $pid -o etime
        else
                pid=$1
                ps -C $pid -o etime
        fi
}



case $operation in
	"topProcess")
		n=$2
		bywhat=$3
		case $bywhat in
			"memory")
				ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -$n ;;
			"cpu")
				ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -$n ;;
		esac ;;	
	"killLeastPriorityProcess")
		pidno=`ps -eo pid,comm,pri,nice --sort=-pri | tail -1 | awk  '{ print $1 }'`
		echo -e $pidno ;;
	"RunningDurationProcess")
		RunningDurationProcess $2 ;;
	"listOrphanProcess")
		ps -elf | head -1; ps -elf | awk '{if ($5 == 1 && $3 != "root") {print $0}}' ;;
	"listZombieProcess")
		ps axo pid=,stat= | awk '$2~/^Z/ { print }' ;;
	"killProcess")
		killProcess $2 ;;
	"ListWaitingProcess")
		ps -aux | awk '{if ($8=="S") print $11}' ;;
	*)
		echo "Invalid Operation. Please Choose one of them 
		      topProcess	
		      killLeastPriorityProcess
		      RunningDurationProcess
		      listOrphanProcess
		      listZombieProcess
		      killProcess
		      ListWaitingProcess" ;;	
esac
