#! /bin/bash
# ps -au | grep /sbin | awk '{ print $2 }'

for i in $(ls /proc/ | grep "[0-9]\+")
do
cat /proc/$i/exe | grep "/sbin" | echo $i
done
