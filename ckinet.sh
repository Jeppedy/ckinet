#!/bin/bash

LOGFILE=/var/log/ckinet.log

COUNTER=0
while [ $COUNTER -lt 5 ]; do
  if ping -c1 -q 8.8.8.8 &> /dev/null; then 
    echo "Internet accessible.  Continuing."
    exit 0
  else
    echo "Ping problem.  Retrying." >> $LOGFILE
    date >> $LOGFILE

    let COUNTER=COUNTER+1
    sleep 30
  fi
done

echo "Internet not accessible.  Resetting..." >> $LOGFILE
date >> $LOGFILE

sudo /sbin/shutdown -r now

