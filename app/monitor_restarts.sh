#!/bin/bash

RESTARTCOUNT=`grep 'Restart pause, 300 second(s)' /var/log/openvpn/openvpn.log | wc -l`
while [ "${RESTARTCOUNT}" -lt 3 ]; do
  sleep 1
  RESTARTCOUNT=`grep 'Restart pause, 300 second(s)' /var/log/openvpn/openvpn.log | wc -l`
done

TIMESTAMP=`date "+%y%m%d-%H%M%S"`
echo "${TIMESTAMP}: RESTART MONITOR ACTIVATING KILLSWITCH" >>/data/logs/monitor.log

/app/killswitch.sh
