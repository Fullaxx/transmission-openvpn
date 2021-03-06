#!/bin/bash

PEERPORT=${PEERPORT:-51413}
RPCPORT=${RPCPORT:-9091}

bail()
{
  echo "$1"
  exit 1
}

if [ x"${OVPNCFG}" != "x" ]; then
  /app/openvpn.sh || bail "openvpn startup failed!"
  if [ "${MONITOR}" == "1" ]; then
    /app/monitor.sh &
    /app/monitor_restarts.sh &
  fi
fi

mkdir -p /data/incomplete /data/watch /data/logs /data/config /data/dl

if [ -z "${ALLOWLIST}" ]; then
  ALLOWLIST="127.0.0.1,172.17.0.1"
fi

if [ -n "${THEME}" ]; then
  /app/setup_themes.sh
fi

exec transmission-daemon -f \
-P ${PEERPORT} -p ${RPCPORT} -a ${ALLOWLIST} \
--incomplete-dir /data/incomplete \
-e /data/logs/transmission.log \
-c /data/watch \
-g /data/config \
-w /data/dl
