
if [ ! -d $HOME/.trash ]
then
    mkdir $HOME/.trash
fi

if [ ! -e $HOME/trash.log ]
then :
touch $HOME/trash.log
fi

date=$(date +%s)
ln $1 "$HOME/.trash/$date"
rm $1
echo "$PWD/$1 $date" >> $HOME/trash.log