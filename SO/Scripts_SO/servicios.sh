#!/bin/bash
source ./comunes.sh

listarServicios() {
    echo "Servicios activos: "
    echo
    ## systemctl list-units lista las unidades onda servicios y eso gestionadas por el systemd
    ## --type=service filtra para mostrar solo servicios onda no los sockets, timers, etc
    ## --state=running filtra para mostrar solo los que están corriendo actualmente
    ## --no-pager evita que la salida se abra en un paginador tipo "less", la pone directo en pantalla
    systemctl list-units --type=service --state=running --no-pager
}

verEstadoServicio() {
    local servicio
    read -rp "Ingrese el nombre del servicio: " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El nombre no puede estar vacío"
        return 1
    fi

    systemctl status "$servicio" --no-pager
}

iniciarServicio() {
    requiereRoot || return
    local servicio
    read -rp "Ingrese el nombre del servicio a iniciar: " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El nombre no puede estar vacío"
        return 1
    fi

    if systemctl start "$servicio"; then
        mensajeBien "Servicio $servicio iniciado correctamente"
    else
        mensajeError "No se pudo iniciar el servicio $servicio"
        return 1
    fi
}

detenerServicio() {
    requiereRoot || return
    local servicio
    read -rp "Ingrese el nombre del servicio a detener: " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El nombre no puede estar vacío"
        return 1
    fi

    if systemctl stop "$servicio"; then
        mensajeBien "Servicio $servicio detenido correctamente"
    else
        mensajeError "No se pudo detener el servicio $servicio"
        return 1
    fi
}

reiniciarServicio() {
    requiereRoot || return
    local servicio
    read -rp "Ingrese el nombre del servicio a reiniciar: " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El nombre no puede estar vacío"
        return 1
    fi

    if systemctl restart "$servicio"; then
        mensajeBien "Servicio $servicio reiniciado correctamente"
    else
        mensajeError "No se pudo reiniciar el servicio $servicio"
        return 1
    fi
}

habilitarDeshabilitarServicio() {
    requiereRoot || return
    local accion=$1 servicio opcionSystemctl

    if [[ $accion == "habilitado" ]]; then
        opcionSystemctl="enable"
    elif [[ $accion == "deshabilitado" ]]; then
        opcionSystemctl="disable"
    else
        mensajeError "Acción inválida"
        return 1
    fi

    read -rp "Ingrese el nombre del servicio: " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El nombre no puede estar vacío"
        return 1
    fi

    if systemctl "$opcionSystemctl" "$servicio"; then
        mensajeBien "El servicio $servicio ha sido $accion con éxito"
    else
        mensajeError "El servicio $servicio NO se ha $accion"
        return 1
    fi
}

menuServicios() {
    local opcion=""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE SERVICIOS ]"
    echo "1. Listar servicios activos."
    echo "2. Ver estado de un servicio."
    echo "3. Iniciar servicio."
    echo "4. Detener servicio."
    echo "5. Reiniciar servicio."
    echo "6. Habilitar servicio al inicio."
    echo "7. Deshabilitar servicio al inicio."
    echo "0. Volver"
    echo

    read -rp "Seleccione acción: " opcion

    case $opcion in
        1) listarServicios ; pausa;;
        2) verEstadoServicio ; pausa;;
        3) iniciarServicio ; pausa;;
        4) detenerServicio ; pausa;;
        5) reiniciarServicio ; pausa;;
        6) habilitarDeshabilitarServicio habilitado ; pausa;;
        7) habilitarDeshabilitarServicio deshabilitado ; pausa;;
        0) return;;
        *) mensajeError "No es una opción válida" ; pausa;;
    esac
    done
}