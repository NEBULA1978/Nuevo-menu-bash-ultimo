#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio actual:|ls"
    "Buscar archivos por nombre:|find / -name '*.txt'"
    "Encontrar archivos de usuario:|find / -user user1"
    "Buscar archivos con extensión .bin en /home/user1:|find /home/user1 -name '*.bin'"
    "Buscar archivos binarios no usados en los últimos 100 días:|find /usr/bin -type f -atime +100"
    "Buscar archivos creados o cambiados en los últimos 10 días:|find /usr/bin -type f -mtime -10"
    "Cambiar permisos de archivos con extensión .rpm a 755:|find / -name '*.rpm' -exec chmod 755 '{}' \;"
    "Cambiar permisos recursivamente a todos los archivos bajo el directorio actual:|find . -type f -exec chmod 644 '{}' +"
    "Buscar archivos con extensión .rpm ignorando dispositivos removibles:|find / -xdev -name '*.rpm'"
    "Redimensionar imágenes y crear miniaturas:|find . -maxdepth 1 -name '*.jpg' -exec convert '{}' -resize 80x60 'thumbs/{}' \;"
    "Renombrar archivos con caracteres extraños por guiones bajos:|find /tmp/dir1 -depth -regextype posix-extended -regex '.*(\\s+|:+|\\\\+|>+|<+|\"+|\\*+|\\?+|\\|+).*' -execdir rename 's/(\\s+|:+|\\\\+|>+|<+|”+|\\*+|\\?+|\\|+)/_/g' '{}' \;"
    "Buscar archivos con extensión .ps usando locate (requiere updatedb):|locate '*.ps'"
    "Mostrar ubicación de un fichero binario, de ayuda o fuente:|whereis "
    "Mostrar ruta completa a un comando:|which "
    "Salir:|exit 0"
)

while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read opcion

    # Validamos que la opción ingresada sea un número válido dentro del rango de opciones.
    if [[ $opcion =~ ^[0-9]+$ ]] && [ $opcion -ge 0 ] && [ $opcion -lt ${#opciones[@]} ]; then
        clear
        comando="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$comando"                   # Ejecutamos el comando.
        echo ""
        echo "Presione Enter para continuar..."
        read
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read
    fi

done
