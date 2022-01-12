#!/bin/bash

OVPID=`pgrep openvpn`
while [ x"${OVPID}" != "x" ]; do
  sleep 1
  OVPID=`pgrep openvpn`
done

sleep 2

TIMESTAMP=`date "+%y%m%d-%H%M%S"`
echo "${TIMESTAMP}: MONITOR ACTIVATING KILLSWITCH" >>/data/logs/monitor.log

/app/killswitch.sh
