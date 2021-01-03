
backupDir=`ls ~/ | grep Backup- | sort -n | tail -n 1`

if [ -z $backupDir ]
then
echo "Бэкапов не найдено"
exit
fi

files=`ls ~/$backupDir |  egrep -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}$"`

if ! [[ -d ~/restore ]]
then
    mkdir ~/restore
fi

for i in $files
do
 cp ~/$backupDir/$i ~/restore
done