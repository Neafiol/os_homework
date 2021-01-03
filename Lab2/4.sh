#! /bin/bash
getART(){
    nr_switches=$(cat /proc/$1/sched | grep nr_switches | awk '{ print $3 }')
    sum_exec_runtime=$(cat /proc/$1/sched | grep se.sum_exec_runtime | awk '{ print $3 }')
    ppid=$(cat /proc/$1/status | grep PPid: | awk '{ print $2 }')
    echo ProcessID=$1 ": Parent_ProcessID=$ppid : Average_Running_Time=$(bc -l <<< "$sum_exec_runtime / $nr_switches")"
}

printproc(){
count=1
while [ -n "$1" ]
do
    getART $1
    count=$[ $count + 1 ]
    shift
done
}

printproc $( ps -A |  sed '1d'  | awk '{ print $1 }') > proc.info