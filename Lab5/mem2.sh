n=0
array=()
echo "" > report2.log

while true; do
array+=(1 2 3 4 5 6 7 8 9 10)
n=$(( $n + 1 ))
mod=$(( $n % 10000 ))


if [ $mod == 0 ]
then
echo ${#array[@]} >> report2.log
echo $n
fi

done