#!/bin/bash
source ./comunes.sh
source ./usuarios.sh
#comand1 ; comand2 ejecuta una detras de otra
#comand1 && comand2 ejecuta como un AND lógico donde solo si el primero ejecuta, ejecuta el segundo
#comand1 || comand2 ejecuta el segundo solo si el primero no se ejecuta
requiereRoot || exit 1
opcion = "";
## Si se seleccionael numero 0 se termina la ejecución del menu
while [[ $opcion != "0" ]]; do
    titulo "     [ PANEL DE ADMINISTRACIÓN DEL SERVIDOR ]"
    echo "1. Usuarios/Grupos."
    echo "2. Respaldos."
    echo "3. Servicios."
    echo "4. Firewall."
    echo "5. Logs."
    echo "0. Salir"
    echo
    read -rp "Seleccione acción: "  opcion
    
    case $opcion in
        1) menuUsuarios;;
        2);;
        3);;
        4);;
        5);;
        0);;
        *) mensajeError "No es una opción válida" ; pausa;;
    esac
done