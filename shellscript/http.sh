#!/bin/bash

apache=`pgrep apache2`
touch /tmp/monitoring.tmp
tmp="/tmp/monitoring.tmp"
PGREP="/usr/bin/pgrep"

if [ -n "$apache" ]
then
echo "Apache Is Working"
else
        echo "Apache service down" >> $tmp
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
