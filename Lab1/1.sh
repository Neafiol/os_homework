#!/bin/bash
max=$1
for i in $1 $2 $3
do
((i > max)) && max=$i
done
echo $max,