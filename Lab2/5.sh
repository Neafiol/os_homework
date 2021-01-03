#! /bin/bash
ppidnow=-1
art_total=0
records=0

while IFS= read -r line
do
    Parent_ProcessID=$(echo $line  | tr "=" " " | awk '{ print $5 }')
    Average_Running_Time=$(echo $line  | tr "=" " " | awk '{ print $8 }')

    if [[ $ppidnow != $Parent_ProcessID ]]
    then

    if [[ $records > 0 ]]
    then
        echo "Average_Sleeping_Children_of_ParentID=$ppidnow is $(bc -l <<< "$art_total / $records")"
    fi

    ppidnow=$Parent_ProcessID
    records=0
    art_total=0
    fi

    records=$[ $records + 1 ]
    art_total=$(bc -l <<< "$art_total + $Average_Running_Time")
    echo $line
    shift
done < proc.info

if [[ $records > 0 ]]
then
    echo "Average_Sleeping_Children_of_ParentID=$ppidnow is $(bc -l <<< "$art_total / $records")"
fi