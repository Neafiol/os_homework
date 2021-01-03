#!/bin/bash
max=$1
for i in {1..12}
do
number=$RANDOM
n=${!i}
let "res=n*number"
echo "Обработка параметра $i дала $res"
done