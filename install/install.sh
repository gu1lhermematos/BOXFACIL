#!/bin/bash
# Copyright (C) 2011-2014 BoxFacil
#
# Script desenvolvido por
# Guilherme Matos ( guilherme@boxfacil.com.br )


clear
echo " > Instalar BoxFacil IPBX"
echo "====================================="
echo "  1)  Instalar BoxFacil"
echo "  0)  Sair"
echo -n "(1-0) : "
read OPTION < /dev/tty

ExitFinish=0

while [ $ExitFinish -eq 0 ]; do

    case $OPTION in

        1)
                        #Instalar Placas
                        echo "====================================="
                        echo "Defina o nome da maquina"
                        read BOXFACIL < /dev/tty
                        echo "O nome da maquina está correto?"
                        echo $BOXFACIL
                        echo -n "Sim = 1:"
                        echo -n "Nao = 2:"
                        read valor_digitado
                        if [ $valor_digitado -eq 1 ]; then
                                export BOXFACIL=$BOXFACIL
                                wget https://raw.githubusercontent.com/gu1lhermematos/BOXFACIL/master/install/install-pabx.sh
                                bash install-asterisk.sh
                                ExitFinish=1
                                else
                                OPTION=1;
                        fi
        ;;

        0)
                        clear
                        ExitFinish=1
        ;;
        *)
    esac
done
