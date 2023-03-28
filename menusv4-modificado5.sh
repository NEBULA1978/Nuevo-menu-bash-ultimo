#!/bin/bash

function controlC(){
    # Parametro -epara que me aplique los saltos de linea
    echo -e "\n\n[!] Saliendo...\n"
  # Codigo de estado no exitoso
    exit 1  
}

# controlC
# Para capturr el atajo de teclado que acabo de escribir y redirijirlo a la funcion controlC
trap controlC INT

# Si no ccomento se ejecuta despues de 10 segundos
# sleep 10

#///////////////////////////////////////////
#///////////////////////////////////////////

function helpPanel(){
  echo -e "\n[!] Por favor, introduzca una cantidad de dinero y una técnica de apuestas válida. Las técnicas disponibles son martingala, d'Alembert y Paroli.\n"
}

while true; do
  echo "Menú:"
  echo "1. martingala"
  echo "2. d'Alembert"
  echo "3. Paroli"
  echo "4. Salir"
  read -p "Seleccione una técnica de apuestas (1-4): " technique_choice

  if [ $technique_choice -eq 4 ]; then
    echo -e "\n\n[!] Saliendo...\n"
    exit 0
  elif [ $technique_choice -ge 1 ] && [ $technique_choice -le 3 ]; then
    read -p "Introduzca la cantidad de dinero: " money

    if [ $money ]; then
      case $technique_choice in
        1) technique="martingala";;
        2) technique="d'Alembert";;
        3) technique="Paroli";;
      esac
      echo "Voy a jugar con $money dinero usando la tecnica $technique"
      # Ejecutar técnica aquí
      sleep 10
    else
      helpPanel
    fi
  else
    helpPanel
  fi
done

# Ahora, después de que el usuario elige una técnica y introduce una cantidad de dinero, el script esperará 10 segundos (simulando la ejecución de la técnica) antes de mostrar el menú de nuevo. Si el usuario selecciona la opción 4, el script se cerrará. Si el usuario no introduce una cantidad de dinero válida, se mostrará el panel de ayuda.