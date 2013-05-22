#!/bin/bash

nginx=`pgrep nginx`
touch /tmp/monitoring.tmp
tmp="/tmp/monitoring.tmp"
PGREP="/usr/bin/pgrep"

if [ -n "$nginx" ]
then
echo "Nginx Is Working"
else
        echo "nginx service down" >> $tmp
fi

EMAIL="rameshkumar.m@angleritech.com"
SUBJECT="Alert You Site is Down"
MESSAGE="$tmp"
COUNT=`wc -m $tmp | awk '{print $1}'`
echo "$COUNT"

if [ $COUNT -ne 0 ]; 
then
/bin/mail -s "$SUBJECT" "$EMAIL" < $MESSAGE
fi

#rm -rf /tmp/monitoring.tmp
