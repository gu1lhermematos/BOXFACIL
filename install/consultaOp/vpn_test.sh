#!/bin/bash

ping -c 20 10.8.0.1 >/dev/null;

if [ "$?" = "0" ] ;
then
   echo "Conexao ativa";
else
   echo "Restabelecendo a conexao"
   /etc/init.d/openvpn restart;
fi
