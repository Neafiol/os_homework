K=$1
N=19540000

i=1

while [ $i -le $K ]
do
echo $i
bash newmem.sh $N &
i=$(($i+1))
sleep 1
done
