#!/bin/bash
if [ $HOME == `pwd`]; then
echo $HOME
else
echo "Error, not home directory: " `pwd`
exit 1
fi
