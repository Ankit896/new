#!/bin/bash
if [ "$operation" -eq "starts" ]
    then 
        processname="$2"
        (./"$2" ${@:3:$#}) &
        pid= ps | grep $2 | awk '{print $1}'
        ps | grep $2 | awk '{print $1}' > y ;
        echo
        echo "PID of the 'otProcessManager' is :- $$"
        echo -n "PID of the $2 is $pid " ; 
        ps | grep -e "$2" | awk '{print $1}'
        echo -n "Memory % utilisation by '$2' is :- " ;
        ps aux | grep echo $y | awk ' {print $4}' 
        echo -n "CPU % utilisation by '$2' is :- " ;
        ps aux | grep echo $y | awk ' {print $3}' ; rm y  ;
fi
if [ "$operation" == "continue" ]
    then 
        echo
        echo "User want to start the process '$2' "
        pid=ps aux | grep "$2"
        kill -CONT "$pid"
fi 
if [ "$operation" == "stop" ]
    then 
        pid= ps | grep $2 | awk '{print $1}'
        # echo $pid
        kill -STOP $pid
fi
