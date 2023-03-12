#!/bin/bash

#Crear directorios o borrarlos con lista pasada en $2
clear
echo "Escribe Make or Delete y recuerda pasar la lista en $ X1 de los directorios: "

echo ""

case $2 in
	[Mm]ake)
	echo "Creando directorios..."
	echo ""
	i=0
	while read line
	do
		if [ -d $line ]
		then
			echo "El directorio $line ya existe"
		else
			echo "Creando directorio: $line"
			mkdir $line
		fi 
	done < $1
	;;
	[Dd]elete)
	echo "Borrando directorios..."
	echo ""
	i=0 
        while read line 
        do 
                if [ -d $line ] 
                then 
			echo "Borrando directorio: $line"
                        rm -d $line
                else 
                        echo "El directorio $line no existe o es un archivo regular"
                fi 
        done < $1
        ;;
	*)
	echo "Debes escribir make o delete"
	;;
esac
