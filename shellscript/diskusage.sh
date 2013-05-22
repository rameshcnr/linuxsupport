#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while r
ead output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 85 ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(da
te)" |
     mail -s "Alert: Almost out of disk space $usep%" example@example.com
  fi
done
