#!/bin/bash

# Copyright (C) 2011-2014 BoxFacil
#
# Script incialmente desenvolvido por
# Emerson Luiz ( eluizbr@tofalando.com.br )

# Atualizado por Guilherme Matos (guilherme@boxfacil.com.br)

source funcoes.sh
    clear
    echo " > Instalar DAHDI BoxFacil"
    echo "====================================="
    echo "  1)  Instalar Dahdi"
    echo "  2)  Instalar Dahdi + ISDN "
    echo "  3)  Instalar Dahdi + R2 "
    echo "  0)  Sair"
    echo -n "(0-3) : "
    read OPTION < /dev/tty

ExitFinish=0

while [ $ExitFinish -eq 0 ]; do


	 case $OPTION in

		1)
			clear
			cd /usr/src/


				clear
				func_install_dahdi
				func_install_libpri
				cd /usr/src/
				bash install_dahdi.sh
				ExitFinish=1


                ;;


		2)
        		clear
        		cd /usr/src/
				clear
				func_install_dahdi
				func_install_libpri
				cd /usr/src/
				bash install_dahdi.sh
				ExitFinish=1
		;;

		3)
        		clear
				func_install_dahdi
				func_install_libpri
				func_install_openr2
				cd /usr/src/
				bash install_dahdi.sh
				ExitFinish=1
		;;



		0)
        		clear
        		cd /usr/src/
				bash install-asterisk.sh
				ExitFinish=1
		;;
		*)
	esac
done

