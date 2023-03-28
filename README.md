# Nuevo-menu-bash-ultimo

Dar permisos:
chmod +x *.sh
Poner el nombre:
./Encontar-Archivos.sh

El código es un script en Bash que define un menú interactivo en el cual el usuario puede seleccionar opciones y ejecutar 
comandos asociados a esas opciones.

El menú está definido en el array llamado "opciones". Cada elemento de este array es una cadena con dos partes separadas por
el carácter '|': el nombre de la opción y el comando correspondiente.

El script entra en un bucle infinito mientras el usuario no seleccione la opción de "Salir". En cada iteración del bucle, se 
limpia la pantalla y se muestra el menú con las opciones numeradas. El usuario ingresa el número de la opción deseada y se valida 
que sea un número válido dentro del rango de opciones.

Si la opción es válida, se obtiene el comando correspondiente a esa opción y se ejecuta con el comando "eval". Luego se muestra
un mensaje para que el usuario presione Enter para continuar y se espera a que lo haga antes de continuar con la siguiente iteración del bucle.

Si la opción ingresada no es válida, se muestra un mensaje de error y se espera a que el usuario presione Enter para continuar.
