#!/bin/bash

source stop-pppd.sh
source get-device.sh

echo =========pppd:$dev===================
pppd $dev optiplex-5060:vc709 proxyarp passive # netmask 255.255.255.0

echo =========process status==============
ps -ef | grep -E 'dropbear|pppd'

echo =========ping:vc709==================
ping -c 5 10.0.5.2

if [ $? -eq 0 ]; then
  echo =========Setup Routing and NAT=======
  sysctl -w net.ipv4.ip_forward=1
  iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
  echo =========/nfsroot/vc709.log==========
  if [ $? -eq 0 ]; then
    tail -n 16 /nfsroot/vc709.log
  fi
fi
