#!/bin/bash
## En este script comunes puse cosas para utilizar funciones o bloques de codigo que se repiten en varios scripts

mensajeError() {
    echo "[X] $1 [X]"
}

mensajeBien() {
    echo "[OK] $1 [OK]"
}

titulo() {
    clear
    echo "><><><><><><><><><><><><><><><><><><><><><><><><><><"
    echo "$1"
    echo "><><><><><><><><><><><><><><><><><><><><><><><><><><"
    echo 
}

requiereRoot() {
    if [[ $EUID -ne 0 ]]; then
    mensajeError "Esta operación requiere permisos de administrador"
    return 1
    fi
}
## -r en read toma literales las contrabarras 
pausa() {
    echo 
    read -rp "Presione ENTER para seguir"
}


