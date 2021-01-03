#! /bin/bash

#ADD TYPE
printproc(){
declare -A procmap


while [ -n "$1" ]
do
    if [ -f "/proc/$1/io" ]
    then
        loaded=$(cat /proc/$pid/io | grep read_bytes | awk '{ print $2 }')
        procmap["$1"]=$loaded
    fi
    shift
done

sleep 60

for pid in ${procmap[@]}
do
    if [ -f "/proc/$pid/io" ]
    then
        loaded=$(cat /proc/$pid/io | grep read_bytes | awk '{ print $2 }')
        echo "$pid : $(( $loaded - procmap["$pid"] ))"
    fi
done
}

printproc $( ps -A |  sed '1d'  | awk '{ print $1 }') | sort -r -n -k3 | head -3