#!/bin/bash

TIMESTAMP=`date "+%y%m%d-%H%M%S"`
echo "${TIMESTAMP}: KILLSWITCH ACTIVATED" >>/data/logs/monitor.log

# ps a | grep -v grep | grep transmission-daemon | awk '{print $1}' | xargs kill
pkill transmission-daemon
