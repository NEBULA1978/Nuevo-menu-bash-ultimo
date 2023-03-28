#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"
    "Ir al directorio personal:|cd"
    "Cambiar al directorio “/home”:|cd /home"
    "Retroceder un nivel:|cd .."
    "Retroceder 2 niveles:|cd ../.."
    "Ir al directorio user1:|cd ~user1"
    "Ir (regresar) al directorio anterior:|cd -"
    "Mostrar el camino del directorio actual:|pwd"
    "Listar el contenido de un directorio:|ls"
    "Listar el contenido de un directorio (distinguiendo los directorios con una barra):|ls -F"
    "Listar el contenido de un directorio, mostrando los detalles:|ls -l"
    "Listar el contenido de un directorio, mostrando los detalles (y el tamaño en un formato “humanizado”):|ls -lh"
    "Listar el contenido de un directorio, incluyendo los ficheros ocultos:|ls -a"
    "Listar los ficheros y carpetas que contienen números:|ls [0-9]"
    "Listar recursivamente el contenido del directorio actual y todos los subdirectorios y archivos, incluyendo los ocultos, separados por página:|ls -laR | less"
    "Mostrar los ficheros y carpetas en forma de árbol comenzando por la raíz:|tree"
    "Mostrar los ficheros y carpetas en forma de árbol comenzando por la raíz:|lstree"
    "Crear un directorio de nombre 'dir1':|mkdir dir1"
    "Crear dos directorios a la vez (en la ubicación actual):|mkdir dir1 dir2"
    "Crear una estructura de directorios, si no existe:|mkdir -p /tmp/dir1/dir2"
    "Eliminar el archivo 'file1':|rm file1"
    "Eliminar el archivo 'file1' en modo forzado:|rm -f file1"
    "Borrar el directorio 'dir1':|rmdir dir1"
    "Eliminar recursivamente y en modo forzado el directorio 'dir1' con todo lo que contenga:|rm -rf dir1"
    "Borrar dos directorios con su contenido de forma recursiva:|rm -rf dir1 dir2"
    "Renombrar o mover un fichero o carpeta (directorio):|mv dir1 new_dir"
    "Copiar un fichero al destino elegido:|cp file1 destino/"
    "Copiar a la vez dos ficheros a un mismo directorio:|cp file1 file2 destino/"
    "Copiar file1 en file2:|cp file1 file2"
    "Copiar todos los ficheros de un directorio dentro del directorio de trabajo actual:|cp dir/ ."
    "Copiar un directorio dentro del directorio actual de trabajo:|cp -a /tmp/dir1 ."
    "Copiar un directorio:|cp -a dir1"
    "Copiar dos directorios al unísono:|cp -a dir1 dir2"
    "Crear un enlace simbólico al fichero o directorio:|ln -s file1 lnk1"
    "Actualizar la fecha de modificación de file1, o crearlo si no existe:|touch file1"
    "Modificar el tiempo real (tiempo de creación) de un fichero o directorio:|touch -t 0712250000 file1"
    "Mostrar el tipo mime de un fichero texto:|file file1"
    "Listar los cifrados conocidos:|iconv -l"
    "Crear una nueva forma del fichero de entrada asumiendo que está codificado en fromEncoding y convirtiéndolo a To:|iconv -f fromEncoding -t toEncoding inputFile > outputFile"
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
