
backupDir=~/Backup-`date +'%Y-%m-%d'`
newDir=1
for i in {7..0}
do
 catname=~/Backup-`date -d "$i day ago" +'%Y-%m-%d' `
 if [ -d $catname ]
 then
    backupDir=$catname
    echo "use old directory"
    newDir=0
 fi
done

if [[ "$newDir" == "1" ]]
then
    mkdir $backupDir
    echo "New folder ($catname) created at `date`" >> ~/backup-report
    for file in ~/source/*
    do
       fname=`basename $file`
       cp $file $backupDir/$fname
       echo $fname >> ~/backup-report
    done
else
    echo "Folder edited ($catname) created at `date`" >> ~/backup-report
    for file in ~/source/*
    do
       fname=`basename $file`
       if [[ -f $backupDir/$fname ]]
       then
            s1=`wc -c $backupDir/$fname | awk '{print $1}'`
            s2=`wc -c $file | awk '{print $1}'`
            echo s1 s2: $s1 $s2
            if [[ $s1 != $s2 ]]
            then
                mv $backupDir/$fname $backupDir/$fname.`date +'%Y-%m-%d'`
                cp $file $backupDir/$fname
                echo $fname >> ~/backup-report
            fi
       else
            cp $file $backupDir/$fname
            echo $fname >> ~/backup-report
       fi
    done
fi
