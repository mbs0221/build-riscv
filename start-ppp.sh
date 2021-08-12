#!/bin/bash

source get-device.sh

echo =========dropbear====================
test -e /var/run/dropbear.pid || dropbear -E -R -p 2222 &
ps -ef | grep -E 'dropbear'

echo =========ppp:$dev====================
test -e /var/run/ppp0.pid || pppd $dev $(hostname):vc709 proxyarp passive

ps -ef | grep -E 'pppd'

echo =========ping:vc709==================
ping -c 5 vc709

if [ $? -eq 0 ]; then

	ifconfig -a ppp0 txqueuelen 1500

	source setup-route.sh
	
      	echo =========ports:======================
      	nc -zv 10.0.5.2 2222  # dropbear
      	nc -zv 10.0.5.2 22    # openssh
      	nc -zv 10.0.5.2 21    # vsftpd
	nc -zv 10.0.5.2 6379  # redis
	nc -zv 10.0.5.2 10000 # memcached
fi
