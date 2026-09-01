#!/bin/bash
source ./comunes.sh

## Rutas de logs típicas en CentOS. (Sisi te digo a vos kato) 
declare -A LOGS=(
    [1]="/var/log/secure"
    [2]="/var/log/messages"
    [3]="/var/log/cron"
    [4]="/var/log/maillog"
)

seleccionarLog() {
    echo "1. Autenticación (secure)"
    echo "2. Sistema (messages)"
    echo "3. Cron"
    echo "4. Correo (maillog)"
    echo
    read -rp "Seleccione el log: " opcionLog

    if [[ -z ${LOGS[$opcionLog]} ]]; then
        mensajeError "Opción de log inválida"
        return 1
    fi

    if [[ ! -f ${LOGS[$opcionLog]} ]]; then
        mensajeError "El archivo ${LOGS[$opcionLog]} no existe en este sistema"
        return 1
    fi

    echo "${LOGS[$opcionLog]}"
}

verUltimasLineas() {
    requiereRoot || return
    local archivoLog cantidad

    archivoLog=$(seleccionarLog) || return 1

    read -rp "¿Cuántas líneas desea ver? [50]: " cantidad
    cantidad=${cantidad:-50}

    echo
    tail -n "$cantidad" "$archivoLog"
}

buscarEnLog() {
    requiereRoot || return
    local archivoLog palabra

    archivoLog=$(seleccionarLog) || return 1

    read -rp "Ingrese la palabra clave a buscar: " palabra

    if [[ -z $palabra ]]; then
        mensajeError "La palabra clave no puede estar vacía"
        return 1
    fi

    echo
    ## grep busca "$palabra" dentro de "$archivoLog" y muestra cada línea donde aparece
    ## -i ignora mayúsculas/minúsculas (busca "Error", "error" y "ERROR" por igual)
    ## --color=auto resalta en color la parte de la línea que coincide con la búsqueda
    ## grep devuelve 0 (éxito) si encontró al menos una coincidencia, y 1 si no encontró nada
    ## por eso el "if ! grep ..." entra al bloque de error cuando NO hubo coincidencias // de nada kato ;D
    if ! grep -i --color=auto "$palabra" "$archivoLog"; then
        mensajeError "No se encontraron coincidencias para '$palabra'"
        return 1
    fi
}

menuLogs() {
    local opcion=""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE LOGS ]"
    echo "1. Ver últimas líneas de un log."
    echo "2. Buscar palabra clave en un log."
    echo "0. Volver"
    echo

    read -rp "Seleccione acción: " opcion

    case $opcion in
        1) verUltimasLineas ; pausa;;
        2) buscarEnLog ; pausa;;
        0) return;;
        *) mensajeError "No es una opción válida" ; pausa;;
    esac
    done
}