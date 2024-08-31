#!/bin/bash

  # Obtener el valor del dólar en pesos mexicanos de la API
  USD_MXN=$(curl -s "https://api.exchangerate-api.com/v4/latest/USD" | jq -r '.rates.MXN')

  # Mostrar el valor del dólar en pesos mexicanos con texto verde
  echo ""
  figlet -f big "Consulta" | lolcat
  echo ""
  echo -e '               \e[1;33mAutor: \e[1;32mCharly\e[1;37mDev\e[1;31m777'
  echo -e '               \e[1;33mGithub: \e[1;36mhttps://github.com/charlydev777'
  echo ""
  echo -e "	\033[1;31m1 dolar = \033[1;32m$USD_MXN pesos mexicanos\033[0m"

  # Esperar 1 segundo antes de actualizar el valor
  sleep 1
  echo -e ""
  read -p '	Deseas realizar una conversion?  '
    case $REPLY in
		y|Y|yes)
		      figlet -f big "Conversor" | lolcat
		echo ""
		echo ""
		      echo -e "	\033[33mCuantos dolares deseas convertir? "
		      echo ""
		      read CANTIDAD
		      CONVERSION=$(echo "$USD_MXN * $CANTIDAD"| bc)
		      echo -e "	\033[35m$CANTIDAD \033[0mdolares equivale a \033[32m$CONVERSION \033[0mpesos mexicanos"
		      ;;
		n|N|no)
		      echo -e "\033[36mOk, gracias por usar la herramienta"
		      ;;
		*)
		      echo -e "\033[1;31mError opcion invalida"
		      ;;
    esac
