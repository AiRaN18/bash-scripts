#!/bin/bash
#SCRIPT BASH PARA LA AUTOMATIZACION DE BACKUPS PERSONALIZABLE

#----> IMPORTANTE CAMBIAR LAS RUTAS POR LAS QUE CORRESPONDAN <----

#El siguiente comando creara un backup de todos los directorios /home del sistema 
TPUT_BG_COLOR=$(tput setab 31)
TPUT_RESET=$(tput sgr0)
RED="\e[31m"
RESET="\e[0m"

for x in /home/*
do
	users=$(echo $x | cut -d "/" -f3)
	echo "------------------------------------------------------------------------"
	echo ""
	if [[ $users == "kali" ]] #por si quieres saltarte algun usuario(puedes cambiarlos y usar un 
	then #			   un comparador como OR para saltarte varios usuarios
		echo "nos saltamos el usuario $users"
	else
	
	#------------------------------------AQUI EMPIEZA A COPIAR
	echo "${TPUT_BG_COLOR}Copiando el directorio $users${TPUT_RESET}" 
	tar -cvpjf "/home/kali/bash/$users-backup-`date +%d%b%y`.tar.bz2" $x
	
	echo ""
	echo -e "${RED}El hash en md5 del backup es:${RESET} "
	md5sum "/home/kali/bash/$users-backup-`date +%d%b%y`.tar.bz2"
	
	echo ""
	md5sum "/home/kali/bash/$users-backup-`date +%d%b%y`.tar.bz2" >> hashes-backups.hash
	fi
done
echo -e "${RED}LOS HASHES ESTAN GUARDADOS EN UN FICHERO EN ESTE MISMO DIRECTORIO${RESET}"

