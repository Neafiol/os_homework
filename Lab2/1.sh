#! /bin/bash
text=`ps -u neafiol -f`

echo "$text" | wc -l
echo "$text" | awk '{ print $1 " - "  $8 }'