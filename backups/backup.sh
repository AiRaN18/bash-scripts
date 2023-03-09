#!/bin/bash

#SCRIPT BASH PARA LA AUTOMATIZACION DE BACKUPS PERSONALIZABLE

#----> IMPORTANTE CAMBIAR LAS RUTAS POR LAS QUE CORRESPONDAN <----

#El siguiente comando creara un backup del directorio raiz(/)para 
#crear un backup de todo el sistema. Excluyendo los directorios configurados
tar -cvpjf "/home/kali/bash/backup-`date +%d%b%y`.tar.bz2" --exclude=/proc --exclude=/lost+found --exclude=/backup-*.tar.bz2 --exclude=/mnt --exclude=/sys --exclude=/media /home/kali/probando

echo ""
echo "El hash en md5 del backup es: " && md5sum "/home/kali/bash/backup-`date +%d%b%y`.tar.bz2"

echo ""
echo ""

echo "Lo tienes guardado en un fichero en el mismo directorio que el backup aunque recomiendo apuntarlo"
md5sum "/home/kali/bash/backup-`date +%d%b%y`.tar.bz2" > "/home/kali/bash/hash-backup-`date +%d%b%y`.hash"

#importante cuanto restauremos el sistema crear los directorios que han sido excluidos
