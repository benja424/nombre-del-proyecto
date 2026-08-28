#!/bin/bash
## Este script es de manejo de firewall
source ./comunes.sh

estadoFirewall() {
    requiereRoot || return
    local activo
    activo=$(firewall-cmd --state)
    
    if activo -eq "running" ; then
        mensajeBien "Firewall ACTIVO"
    else
        mensajeError "Firewall APAGADO"
    fi

}


menuFirewall() {
    local opcion = ""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE FIREWALL ]"
    echo "1. Comprobar "
    echo "2.  "
    echo "3.  "
    echo "4.  "
    echo "5.  "
    echo "6.  "
    echo "7.  "
    echo "8.  "
    echo "9.  "
    echo "10. "
    echo "11. "
    echo "0. Volver"
    echo
    
    read -rp "Seleccione acción: "  opcion
    
    case $opcion in
        1) estadoFirewall ; pausa;;
        2)   pausa;;
        3)   pausa;;
        4)   pausa;;
        5)   pausa;;
        6)   pausa;;
        7)   pausa;;
        8)   pausa;;
        9)   pausa;;
        10)   pausa;; 
        11)   pausa;;
        0) return;;
        *)mensajeError "No es una opción válida";;
    esac
    done
}