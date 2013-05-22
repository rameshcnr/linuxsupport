#!/bin/bash
/etc/rc.d/rc.nginx status
if [[ $? == 3 ]]; then
   echo "Httpd is down `date`" | mail rameshkumar.m@angleritech.com
   exit 1
fi
exit 0
