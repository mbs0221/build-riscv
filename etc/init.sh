#!/bin/sh

# ====================================================
# Environment variables
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

ROOTFS=$NFS_ROOT/rootfs
STDOUT=$NFS_ROOT/log/stdout.log
STDERR=$NFS_ROOT/log/stderr.log
RPMS=$NFS_HOME/rpmbuild/RPMS/x86_64

export ROOTFS STDOUT STDERR RPMS
touch $STDERR $STDOUT

# ====================================================
# Route
#route add -net 10.0.5.0/32 netmask 255.255.255.255 gw 10.0.5.1
#route add default ppp0
#route add default gw 10.0.5.1
#route add default ppp0
#route add default gw 10.0.5.3
#route add default ppp0
route -n 1>>$STDOUT 2>>$STDERR

ifconfig -a ppp0 txqueuelen 1000

# ====================================================
# HTTP Proxy
export http_proxy="$IPREMOTE:8889"
export https_proxy="$IPREMOTE:8889"

# ====================================================
# mkdirs
test -d /home/kiki/RPMS/x86_64 || mkdir -p /home/kiki/RPMS/x86_64
test -d /nfsroot || mkdir -p /nfsroot
test -d /var/www || mkdir -p /var/www

# ====================================================
# NORMAL USER
test $(id -u kiki) || \
	echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki

test $(id -u kimi) || \
	echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi

# FTP USER
test -d /usr/share/empty || mkdir -p /usr/share/empty
test -d /var/ftp || mkdir -p /var/ftp && \
	chown root:root /var/ftp &&\
	chmod og-w /var/ftp

test $(id -u nobody) || \
	adduser -s /usr/sbin/nologin -D -H nobody

test $(id -u ftp) || \
	adduser -h /var/ftp -D -H ftp

# RSYNCD USER
test $(id -u rsyncd) || \
	addgroup -g 48 rsyncd && \
	adduser -h /home/rsync -g "rsyncd Daemon" -s /bin/false -G rsyncd -D -u 48 rsyncd

# ====================================================
# authorized_keys
test -d /home/ubuntu/.ssh || mkdir -p /home/ubuntu/.ssh
test -d /home/kiki/.ssh || mkdir -p /home/kiki/.ssh
test -d /root/.ssh || mkdir -p /root/.ssh

cp $NFS_ROOT/authorized_keys /home/ubuntu/.ssh
cp $NFS_ROOT/authorized_keys /home/kiki/.ssh
cp $NFS_ROOT/authorized_keys /root/.ssh

chown ubuntu:ubuntu -R /home/ubuntu
chown kiki:kiki -R /home/kiki
chown root:root -R /root

chmod go-w /home/ubuntu/.ssh
chmod go-w /home/kiki/.ssh
chmod go-w /root/.ssh

touch /home/ubuntu/.ssh/config
touch /home/kiki/.ssh/config

chmod 600 /home/ubuntu/.ssh/config
chmod 600 /home/kiki/.ssh/config

# ====================================================
# helloworld
test $(which helloworld) || \
	rpm -i $RPMS/helloworld-1.0-1.x86_64.rpm && \
	/usr/bin/helloworld 1>>$STDOUT 2>>$STDERR

# dropbear
# https://www.programmersought.com/article/95981806345/
test $(which dropbear) || \
	rpm -i $RPMS/zlib-1.2.11-1.x86_64.rpm && \
	rpm -i $RPMS/dropbear-2020.81-1.x86_64.rpm && \
	/usr/local/sbin/dropbear -E -R -p 2222 1>>$STDOUT 2>>$STDERR

# vsftpd
test $(which vsftpd) || \
	cp /etc/vsftpd.conf /etc/vsftpd.conf.bck && \
	rpm -i $RPMS/vsftpd-3.0.4-1.x86_64.rpm && \
	cp /etc/vsftpd.conf.bck /etc/vsftpd.conf && \
	/usr/local/sbin/vsftpd & 1>>$STDOUT 2>>$STDERR

# rsync
test $(which rsync) || \
        rpm -i $RPMS/rsync-3.1.2-1.x86_64.rpm

source ~/keygen.sh
source ~/backup.sh

exit 0
