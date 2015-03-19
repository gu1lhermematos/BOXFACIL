#!/bin/bash

arch=$(uname -a | grep x86_64)
cron=$(cat /etc/crontab | grep importaFull)
menu(){
	clear
	echo ".::Consulta Portabilidade BRFONE TELECOM::."
	echo "Instalar agora ?"
	echo "1. Continuar"
	echo "2. Sair"
	read opcao
	case $opcao in
	1) install ;;
	2) sleep; clear; exit ;;
	*) echo "Opcao nao Encontrada..."; echo ; menu ;;
	esac
}
 
install(){
	clear
	echo "Iniciando Instalação Portabilidade"

	mv /var/www/ipbx/install/consultaOp /usr/src/
	cd /usr/src/consultaOp

### SISTEM CONFIG
rm config.ini

	echo "db_host = 127.0.0.1" >> config.ini 
	echo "db_user = root"  >> config.ini 
	echo "db_pass = tofalando2014"  >> config.ini 
	echo "db_name = portabilidade"  >> config.ini 
	echo "cli_chave = 192837465"  >> config.ini
	echo "tb_portados = portados"  >> config.ini
	echo "tb_nao_portados = nao_portados"  >> config.ini
	echo "ftp_server = ftp.brfonetelecom.com.br"  >> config.ini 
	echo "ftp_user = guimatos@brfonetelecom.com.br"  >> config.ini
	echo "ftp_pass = *A5vND+6gMvL"  >> config.ini
	echo "dest_principal = consultaop@boxfacil.com.br"  >> config.ini
	echo "dest_secundario = NULL"  >> config.ini
	echo "remetente = consultaop@boxfacil.com.br"  >> config.ini
	echo "remetente_pass = \"PaBx@portabilidade\""  >> config.ini
	echo "smtp_server = smtp.boxfacil.com.br"  >> config.ini
	echo "smtp_port = 587"  >> config.ini
	echo "smtp_auth = sim"  >> config.ini
	echo "smtp_secure = sim" >> config.ini
	echo "dest_nome = $BOXFACIL" >> config.ini
	echo "rem_name = $BOXFACIL" >> config.ini

sleep 1

cd /var/www/ipbx/install/phpagi
cp -rfv * /var/lib/asterisk/agi-bin/
cd /usr/src/consultaOp

mv usr.sbin.mysqld /etc/apparmor.d/usr.sbin.mysqld
/etc/init.d/apparmor reload
mysql -u root -ptofalando2014 -e "CREATE DATABASE IF NOT EXISTS portabilidade;"
mysql -u root -ptofalando2014 portabilidade < portabilidade.sql
./importaFull
./updatePrefixos

mkdir /var/www/ipbx/.consulta
ln -s /usr/src/consultaOp/consultaOperadora.php /var/www/ipbx/.consulta

chown :www-data /usr/src/consultaOp/consultaOperadora.php
/etc/init.d/apache2 restart

ln -s /usr/src/consultaOp/consulta_op.php /var/lib/asterisk/agi-bin/consulta_op.php
ln -s /usr/src/consultaOp/consultaOp.php /var/lib/asterisk/agi-bin/consultaOp.php

        if  [ "$cron" = "" ]
        then
			echo "00 6 * * * root $base_dir/importaFull" >> /etc/crontab
			echo "00 6 * * * root $base_dir/updatePrefixos" >> /etc/crontab
			echo "#" >> /etc/crontab
		fi 
				
	echo "Instalação Portabilidade terminada."
	bash install-asterisk.sh
}

menu
