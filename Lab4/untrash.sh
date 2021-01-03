for i in `cat $HOME/trash.log | tr " " "|" | grep -h $1 `
do
    file1=`echo $i | awk -F "|" '{print $1}'`
    file2=`echo $i | awk -F "|" '{print $2}'`

    if [ -e $HOME/.trash/$file2 ];
        then
        echo "Restore $file1 ?"
        read ans
        if [[ $ans == "yes" ]]
        then
            dir=`dirname $file1`
            if ! [ -d $dir ]
            then
                dir=$HOME
            fi

            if [[ -e $file1 ]]
            then
                echo "Enter new name"
                read name
                ln $HOME/.trash/$file2 $dir/$name
            else
                ln $HOME/.trash/$file2 $dir/`basename $file1`
            fi

            rm $HOME/.trash/$file2
        fi
    fi

done