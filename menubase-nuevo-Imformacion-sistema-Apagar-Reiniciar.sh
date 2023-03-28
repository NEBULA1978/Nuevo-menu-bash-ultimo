#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
       "Mostrar directorio:|ls"
    "Información del sistema:|
    echo 'Arquitectura de la máquina (1):' && arch
    echo 'Arquitectura de la máquina (2):' && uname -m
    echo 'Versión del kernel usado:' && uname -r
    echo 'Información completa:' && uname -a
    echo 'Información completa de la distribución:' && lsb_release -a
    echo 'Nombre de la distribución:' && cat /etc/issue
    echo 'Componentes (hardware) del sistema:' && dmidecode -q
    echo 'Características de un disco duro:' && hdparm -i /dev/hda
    echo 'Prueba de lectura en un disco duro:' && hdparm -tT /dev/sda
    echo 'Información de la CPU:' && cat /proc/cpuinfo
    echo 'Número de procesadores:' && grep -c ^processor /proc/cpuinfo
    echo 'Interrupciones:' && cat /proc/interrupts
    echo 'Uso de memoria:' && cat /proc/meminfo
    echo 'Ficheros swap:' && cat /proc/swaps
    echo 'Versión del kernel:' && cat /proc/version
    echo 'Adaptadores de red y estadísticas:' && cat /proc/net/dev
    echo 'Sistema de ficheros montado:' && cat /proc/mounts
    echo 'Dispositivos PCI:' && lspci -tv
    echo 'Dispositivos USB:' && lsusb -tv
    echo 'Listar el hardware:' && lshw
    echo 'Listar el hardware (alternativo):' && discover
    echo 'Fecha del sistema:' && date
    echo 'Almanaque de 2011:' && cal 2011
    echo 'Almanaque para el mes julio de 2011:' && cal 07 2011
    echo 'Colocar (declarar, ajustar) fecha y hora:' && date 041217002011.00
    echo 'Guardar los cambios de fecha en la BIOS:' && clock -w
    echo 'Información (nombre, etiqueta, UUID, tipo de partición) sobre los dispositivos de bloque (discos rígidos, etc.):' && blkid"
    "Apagar el sistema (1):|shutdown -h now"
    "Apagar el sistema (2):|init 0"
    "Apagar el sistema (3):|telinit 0"
    "Apagar el sistema (4):|halt"
    "Apagar el sistema (5):|poweroff"
    "Apagado planificado del sistema:|shutdown -h hours:minutes &"
    "Cancelar un apagado planificado del sistema:|shutdown -c"
    "Reiniciar (1):|shutdown -r now"
    "Reiniciar (2):|reboot"
    "Cerrar sesión:|logout"
    "Cerrar sesión (2):|skill nombre_de_usuario"
    "Salir del intérprete de comandos (cerrar sesión):|exit"
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

# El script es un menú interactivo en bash que permite realizar operaciones en una instancia de MongoDB que se ejecuta en un contenedor de Docker. El menú presenta varias opciones que incluyen comandos para mostrar información del sistema de archivos, conectarse a la instancia de MongoDB, crear una base de datos, agregar valores a la base de datos, buscar registros, ordenar registros, etc.

# El script utiliza un array para almacenar las opciones del menú, donde cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente. Luego, utiliza un ciclo while para mostrar el menú en pantalla y ejecutar el comando correspondiente a la opción seleccionada por el usuario.

# El script utiliza la función eval para ejecutar los comandos, lo que significa que el usuario debe tener cuidado al seleccionar opciones y no ingresar comandos maliciosos. Además, el script asume que el contenedor de MongoDB ya está instalado y disponible en el sistema.

# Sí, se pueden implementar medidas de seguridad para evitar la inyección de comandos maliciosos. Algunas sugerencias son:

#     Utilizar una lista blanca de comandos permitidos: en lugar de permitir cualquier comando que se ingrese desde el menú, se puede crear una lista blanca de comandos permitidos y validar que el comando seleccionado por el usuario esté en la lista. De esta manera, solo se permitirían comandos específicos que se consideren seguros.

#     Sanitizar la entrada del usuario: se pueden utilizar herramientas como sed o awk para eliminar los caracteres especiales que puedan ser utilizados para inyectar comandos maliciosos. Por ejemplo, se pueden eliminar caracteres de escape, comillas y caracteres especiales como punto y coma (;) que se utilizan para separar comandos.

#     Limitar los permisos de ejecución: se pueden limitar los permisos de ejecución de los comandos que se ejecutan desde el menú, para evitar que se realicen operaciones maliciosas. Por ejemplo, se pueden limitar los permisos de escritura o lectura en archivos importantes del sistema.

#     Utilizar variables en lugar de eval: en lugar de usar eval para ejecutar los comandos, se pueden utilizar variables para almacenar los comandos y luego ejecutarlos. De esta manera, se limitaría la posibilidad de inyección de comandos maliciosos.

#     Validar la entrada del usuario: se pueden validar los datos ingresados por el usuario para asegurarse de que solo se ingresen datos válidos y seguros. Por ejemplo, se pueden utilizar expresiones regulares para validar el formato de los datos, o limitar la cantidad de caracteres que se pueden ingresar.

# Es importante tener en cuenta que ninguna medida de seguridad es completamente efectiva, por lo que es recomendable utilizar varias medidas de seguridad para reducir el riesgo de inyección de comandos maliciosos.
