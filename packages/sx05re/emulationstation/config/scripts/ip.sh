#!/bin/sh

  IP="$(ifconfig wlan0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')"
  
  if [ -z "$IP" ]; then
     IP="$(ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')"
  fi

 if [ -z "$IP" ]; then
    echo "No Internet"
 else
    echo ${IP}
    echo ${IP} > /storage/ip.txt
 fi