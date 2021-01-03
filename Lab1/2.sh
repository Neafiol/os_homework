#!/bin/bash
str=""
while read line
do
if [ $line == "q" ]; then
break
fi
str+=$line
done
echo $str