#!/bin/bash

LOGFILE=/var/log/ckinet.log

MAXRETRIES=10
SLEEPTIMESECS=60
COUNTER=0
while [ $COUNTER -lt $MAXRETRIES ]; do
  if ping -c1 -q 8.8.8.8 &> /dev/null; then 
    echo "Internet accessible.  Continuing."
    exit 0
  else
    echo "Ping problem [$COUNTER].  Retrying." >> $LOGFILE
    echo "Ping problem [$COUNTER].  Retrying."
    date >> $LOGFILE

    let COUNTER=COUNTER+1
    sleep $SLEEPTIMESECS
  fi
done

echo "Internet not accessible for $MAXRETRIES tries at $SLEEPTIMESECS sec each.  Rebooting..." >> $LOGFILE
date >> $LOGFILE

sudo /sbin/shutdown -r now

