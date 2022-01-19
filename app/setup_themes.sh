#!/bin/bash

STFILE="transmission-web-soft-theme-master.tar"
STURL="https://git.eigenlab.org/sbiego/transmission-web-soft-theme/-/archive/master/${STFILE}"

if [ ! -d /opt/transmission ]; then
  mkdir /opt/transmission
fi

# Download Soft Theme
if [ ! -d /opt/transmission/themes ]; then
  mkdir /opt/transmission/themes
  cd /opt/transmission/themes
  wget -q ${STURL}
  tar xf ${STFILE}
  rm ${STFILE}
  cp -r transmission-web-soft-theme-master/web/* /usr/share/transmission/web/
fi

# Setup Soft Theme
if [ ! -d /opt/transmission/themecfg ]; then
  mkdir /opt/transmission/themecfg
  cd /opt/transmission/themecfg
  cp /usr/share/transmission/web/index.html ./
  cat /opt/transmission/themecfg/index.html | sed -e '21i\\t\t<link href="./style/transmission/soft-theme.min.css" type="text/css" rel="stylesheet" />\n\t\t<link href="style/transmission/soft-light-theme.min.css" type="text/css" rel="stylesheet" />\n' >./index.light.html
  cat /opt/transmission/themecfg/index.html | sed -e '21i\\t\t<link href="./style/transmission/soft-theme.min.css" type="text/css" rel="stylesheet" />\n\t\t<link href="style/transmission/soft-dark-theme.min.css" type="text/css" rel="stylesheet" />\n' >./index.dark.html
fi

if [ "${THEME}" == "SOFTLIGHT" ]; then
  cp /opt/transmission/themecfg/index.light.html /usr/share/transmission/web/index.html
  echo "Soft Light Theme Installed"
fi

if [ "${THEME}" == "SOFTDARK" ]; then
  cp /opt/transmission/themecfg/index.dark.html /usr/share/transmission/web/index.html
  echo "Soft Dark Theme Installed"
fi
