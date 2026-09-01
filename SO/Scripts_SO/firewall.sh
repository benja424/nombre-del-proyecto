#!/bin/bash
source ./comunes.sh

verEstadoFirewall() {
    echo "Estado del firewall: "
    firewall-cmd --state
}

listarReglas() {
    echo "Reglas activas en la zona por defecto:"
    echo
    firewall-cmd --list-all
}

abrirPuerto() {
    requiereRoot || return
    local puerto protocolo

    read -rp "Ingrese el puerto a abrir: " puerto
    read -rp "Ingrese el protocolo (tcp/udp): " protocolo

    if [[ -z $puerto || -z $protocolo ]]; then
        mensajeError "Los campos no pueden estar vacíos"
        return 1
    fi

    if firewall-cmd --permanent --add-port="$puerto/$protocolo" &> /dev/null; then
        firewall-cmd --reload &> /dev/null
        mensajeBien "Puerto $puerto/$protocolo abierto correctamente"
    else
        mensajeError "No se pudo abrir el puerto $puerto/$protocolo"
        return 1
    fi
}

cerrarPuerto() {
    requiereRoot || return
    local puerto protocolo

    read -rp "Ingrese el puerto a cerrar: " puerto
    read -rp "Ingrese el protocolo (tcp/udp): " protocolo

    if [[ -z $puerto || -z $protocolo ]]; then
        mensajeError "Los campos no pueden estar vacíos"
        return 1
    fi

    if firewall-cmd --permanent --remove-port="$puerto/$protocolo" &> /dev/null; then
        firewall-cmd --reload &> /dev/null
        mensajeBien "Puerto $puerto/$protocolo cerrado correctamente"
    else
        mensajeError "No se pudo cerrar el puerto $puerto/$protocolo"
        return 1
    fi
}

gestionarServicioFirewall() {
    requiereRoot || return
    local accion=$1 servicio

    read -rp "Ingrese el nombre del servicio (ej: ssh, http): " servicio

    if [[ -z $servicio ]]; then
        mensajeError "El campo no puede estar vacío"
        return 1
    fi

    if [[ $accion == "agregado" ]]; then
        if firewall-cmd --permanent --add-service="$servicio" &> /dev/null; then
            firewall-cmd --reload &> /dev/null
            mensajeBien "Servicio $servicio $accion correctamente a las reglas permitidas"
        else
            mensajeError "No se pudo agregar el servicio $servicio"
            return 1
        fi
    elif [[ $accion == "eliminado" ]]; then
        if firewall-cmd --permanent --remove-service="$servicio" &> /dev/null; then
            firewall-cmd --reload &> /dev/null
            mensajeBien "Servicio $servicio $accion correctamente de las reglas permitidas"
        else
            mensajeError "No se pudo eliminar el servicio $servicio"
            return 1
        fi
    else
        mensajeError "Acción inválida"
        return 1
    fi
}

recargarFirewall() {
    requiereRoot || return

    if firewall-cmd --reload &> /dev/null; then
        mensajeBien "Firewall recargado correctamente"
    else
        mensajeError "No se pudo recargar el firewall"
        return 1
    fi
}

menuFirewall() {
    local opcion=""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE FIREWALL (firewalld) ]"
    echo "1. Ver estado del firewall."
    echo "2. Listar reglas activas."
    echo "3. Abrir puerto."
    echo "4. Cerrar puerto."
    echo "5. Agregar servicio permitido."
    echo "6. Quitar servicio permitido."
    echo "7. Recargar firewall."
    echo "0. Volver"
    echo

    read -rp "Seleccione acción: " opcion

    case $opcion in
        1) verEstadoFirewall ; pausa;;
        2) listarReglas ; pausa;;
        3) abrirPuerto ; pausa;;
        4) cerrarPuerto ; pausa;;
        5) gestionarServicioFirewall agregado ; pausa;;
        6) gestionarServicioFirewall eliminado ; pausa;;
        7) recargarFirewall ; pausa;;
        0) return;;
        *) mensajeError "No es una opción válida" ; pausa;;
    esac
    done
}