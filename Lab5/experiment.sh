echo "" > "mon2.log"
bash mem.sh &
bash mem2.sh &

START=$(date +%s%N)


while true; do

echo "`ps -eo %mem,%cpu,command | sort -r | head -5`" >> "mon2.log"
echo `vmstat -s | grep 'used memory'` >> "mon2.log"
echo `vmstat -s | grep 'used swap'` >> "mon2.log"

END=$(date +%s%N)
DIFF=$(($(($END - $START))/1000000000))
echo "$DIFF seconds" >> "mon2.log"

echo "=========" >> "mon2.log"


sleep 2
echo `vmstat -s | grep 'used memory'`
done