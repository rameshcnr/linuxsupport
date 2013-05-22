#!/bin/bash

if wget -q http://linuxforums.org
then
echo "up"

else
echo "down"
exit
fi
