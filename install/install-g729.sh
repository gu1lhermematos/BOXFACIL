#!/bin/bash

# Copyright (C) 2011-2014 BoxFacil
#
# Script incialmente desenvolvido por
# Emerson Luiz ( eluizbr@tofalando.com.br )

# Atualizado por Guilherme Matos (guilherme@boxfacil.com.br)

source funcoes.sh

# Checar asterisk

	if [ ! -d "/etc/asterisk" ]; then
		
		func_install_asterisk
		func_install_g729
		bash install-asterisk.sh
                ExitFinish=1

		
	else
		func_install_g729
		bash install-asterisk.sh
                ExitFinish=1

	fi
		
		
# Fim seta CPU


