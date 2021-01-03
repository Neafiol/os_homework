#! /bin/bash
printproc(){
    maxmem=0
    respid=0
    while [ -n "$1" ]
    do
    if [ -f "/proc/$1/status" ]
    then
        nr_switches=$(cat /proc/$1/status | grep VmData | awk '{ print $2 }')
        if [[ $nr_switches -ge $maxmem ]]
        then
#             echo $maxmem $respid $nr_switches
            maxmem=$nr_switches
            respid=$1
        fi
    fi
    shift
    done
    echo $respid
}

printproc $(ps -A |  sed '1d'  | awk '{ print $1 }')