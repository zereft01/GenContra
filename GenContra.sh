#!/bin/bash
#Generador de contraseñas
clear
#Si tienes instalado figlet puedes activar el codigo, quitando el # siguiente....
#figlet -f emboss2 Generador de contrasenas!!  #Esto te mostrara un banner 

green='\033[1;32m'
yellow='\033[1;33m'                                     
blue='\033[1;34m'                                       
magenta='\033[1;35m'                                    
cyan='\033[1;36m'
reset='\033[0m'


sleep 1
printf $green
v=1.0
echo "╔═╝╔═╝╔═ ╔═╝╔═║╔═ ═╔╝╔═║╔═║
║ ║╔═╝║ ║║  ║ ║║ ║ ║ ╔╔╝╔═║
══╝══╝╝ ╝══╝══╝╝ ╝ ╝ ╝ ╝╝ ╝"
echo $v
red='\033[1;31m'              
read -p "Dime los caráteres y/o palabras para tu contraseña. Separados por espacios(Ejem: pastel lima 123) " MATRIX

nada=""
if [ "$MATRIX" == "$nada" ]; 
then
	printf $red
	echo "=================================================================="
	echo "No ingresaste ningún valor para tu cotraseña, intentalo nueva mente" 
	echo "=================================================================="

	printf $reset
else
	printf $green
	read -p "Dime la longitud de la contraseña (ejm: 5). " LENGTH
	
	while [ "${n:=0}" -le "$LENGTH" ]
	do
		PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
		let n+=1
	done
	Passines=$(echo "$PASS" | tr -d '[[:space:]]')
	printf $red
	echo "====================="
	printf $reset
	printf $green
	echo "La contraseña es: $Passines" 
	printf $reset
	printf $red
	echo "====================="
	printf $reset
	sleep 1
	printf $green
	read -p "Deseas almacenar la contraseña en un fichero de texto? [Si/No] " Respuesta

	case $Respuesta in
		 [Ss]i|s)
			printf $green
			read -p "Sitio web o plataforma * (REQUERIDO) " sitio
			SitioSin=$(echo "$sitio" | tr -d '[[:space:]]')
			read -p "Correo (OPCIONAL) " Correo
			read -p "Usuario (OPCIONAL) " Usuario 
			read -p "Donde quieres almacenar el fichero? *(REQUERIDO) Si deseas usar la ruta por defecto presiona ENTER /home/usuario/GenContra. De lo contrario define tu propia ruta " Fichero
			todo="El sitio web es : "$sitio"\nEl correo electrónico es: "$Correo"\nEl usuario es : "$Usuario"\nLa contraseña es: "$Passines 
			if [ -z $Fichero ];
			 	then

			 		usuario=$(whoami)
					echo "Se usará la ruta por defecto /home/$usuario/GenContra/$sitio"
					echo "Creando carpeta.."
					sleep 1.5
					mkdir /home/$usuario/GenContra/
					echo "Creando fichero de texto.."
					sleep 1.5
					touch /home/$usuario/GenContra/$SitioSin.txt 
					echo -e $todo > /home/$usuario/GenContra/$SitioSin.txt
					sleep 1.5
					echo "Tu contraseña esta almacenada en /home/$usuario/GenContra/$SitioSin.txt "

				else
					echo "Creando carpeta en $Fichero "
					sleep 1.5
					mkdir $Fichero
					echo "Carpeta creada..."
					sleep 1.5
					echo "Creando fichero en $Fichero$sitio.txt "
					sleep 1.5
					touch /$Fichero/$SitioSin.txt	
					echo -e $todo > /$Fichero/$SitioSin.txt
					sleep 1.5
					echo "Contraseña almacenada con éxito en $Fichero$SitioSin.txt"
					
			fi
			;;
		[Nn]o|n)
			sleep 1
			echo "Adiós"
			;;
		[Hh]elp|*)
			printf $red
			echo "=============================================================================="
			echo "Este script te ayudará a generear tus contraseñas de manera automatizada"
			echo "Posibles errores y soluciones." 
			echo "Lee el README.md para mayor información"
			echo "=============================================================================="
			printf $reset
	esac


fi
