#!/bin/bash

#crear usuarios y sus entornos de trabajo mediante fichero que sube el  propio usuario a una carpeta compartida por ejemplo
#creara un fichero llamado con su nombre de usuario y dentro de el las carpetas que desea para 
#trabajar. Con crontab podriamos hacer que este script se ejecute cada 5 minutos por ejemplo
 
#---> RECORDAR A CADA USUARIO CAMBIAR LA CONTRASEÑA AL INCIAR SESION  <----

#cogemos los usuarios
user=$(ls /shared)

for x in ${user[@]}
do
	uname=$(cat /etc/passwd | grep $x)
	if [ $uname ]
	then
		echo "El usuario $x ya existe"
	else
		echo "Creando el usuario $x..."
		useradd -m $x
		#mensaje de bienvenida cuando inicie sesion
		echo "echo Hola $x! Bienvenido!" >> /home/$x/.bashrc
	fi
	
	dirs=$(cat /shared/$x)
	#log que guarda las carptetas que creamos
	#echo $dirs >> /var/logs/userDirs_'date +%D'.log
	#recorremos todos los directorios y los creamos
		for dir in ${dirs[@]}
		do
			mkdir /home/$x/$dir
		done
		#si ha creado todos los directorios y el usuario borrara su fichero
		if [ $? -eq 0 ]
		then
			rm -f /shared/$x
		fi
done
