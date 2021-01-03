ids=`ps -f --ppid $1 |  sed '1d' | awk '{ print $2 }' | tr "\n" "," | rev |  cut -c 2- | rev`
res=$ids


while [[ $ids =~ ^*,*$ ]]
do
    ids=`ps -f --ppid $ids |  sed '1d' | awk '{ print $2 }' | tr "\n" "," |  rev |  cut -c 2- | rev`
    res+=$ids
done


echo `echo $res | tr , "\n"`

# 133564