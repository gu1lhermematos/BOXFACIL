#!/bin/bash

# Copyright (C) 2011-2014 ToFalando
#
# Script incialmente desenvolvido por
# Emerson Luiz ( eluizbr@tofalando.com.br )
echo "`ip addr show eth0 | cut -c16-32 | egrep \"[0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}$\"`" | tr -d ' : ' >/tmp/mac.txt
MAC=$(cat /tmp/mac.txt)
ALEATORIO=$MAC
TOFALANDO="ToFalando-$ALEATORIO"
TOFALANDO2="$ALEATORIO"
#echo " $TOFALANDO"
#echo "$TOFALANDO2"
export TOFALANDO=$TOFALANDO
export TOFALANDO2=$TOFALANDO2
clear


if [ -e /etc/openvpn/$TOFALANDO.crt ]; then

	clear
	echo "VPN Já instalada"

else

	cd /etc/openvpn/

	echo "`ip addr show eth0 | cut -c16-32 | egrep \"[0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}[:][0-9a-z]{2}$\"`" | tr -d ' : ' >/tmp/mac.txt
	MAC=$(cat /tmp/mac.txt)
	ALEATORIO=$MAC
	TOFALANDO="ToFalando-$ALEATORIO"
	TOFALANDO2="$ALEATORIO"
#	echo " $TOFALANDO"
#	echo "$TOFALANDO2"
	export TOFALANDO=$TOFALANDO
	export TOFALANDO2=$TOFALANDO2


	echo "$TOFALANDO" > /etc/hostname

	echo "127.0.0.1	localhost" > /etc/hosts
	IP_LOCAL=$(/sbin/ifconfig | sed -n '2 p' | awk '{print $3}')
	echo "${IP_LOCAL}	$TOFALANDO.tofalando.net	$TOFALANDO" >> /etc/hosts

	echo "

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" >> /etc/hosts



	ssh root@vpn.tofalando.com.br '/usr/src/gera-key.sh '$TOFALANDO''
	scp root@vpn.tofalando.com.br:/etc/openvpn/easy-rsa/keys/$TOFALANDO* .

	wget https://raw.githubusercontent.com/eluizbr/BOXFACIL/master/install/etc/openvpn/client.conf
	wget https://raw.githubusercontent.com/eluizbr/BOXFACIL/master/install/etc/openvpn/ca.crt

	sed -i s/"cert ipbx.crt"/"cert "$TOFALANDO".crt"/g /etc/openvpn/client.conf
	sed -i s/"key ipbx.key"/"key "$TOFALANDO".key"/g /etc/openvpn/client.conf

	sed -i s/SNEP_VERSION/$TOFALANDO2/g /var/www/ipbx/modules/default/views/scripts/systemstatus/index.phtml
	sed -i s/$TOFALANDO2/"'$TOFALANDO2'"/g /var/www/ipbx/modules/default/views/scripts/systemstatus/index.phtml

	mv ToFalando* /etc/openvpn/
	/etc/init.d/openvpn restart


fi
