#!/bin/bash
source ./comunes.sh
# getent busca en databases de rutas predefinidas y sirve para buscar usuarios o grupos
# con el echo $? sirve para saber si se ejecuto correctamente el comando anterior true si =0 sino !=0
# con > /dev/null mandamos la devolucion por pantalla de la línea a un archivo que se autoelimina (para no ver nada por pantalla)
usuarioExiste() {
    getent passwd $1 > /dev/null
}

grupoExiste() {
    getent group $1 > /dev/null
}

crearUsuario() {
    requiereRoot || return
     
    local usuario
    read -rp "Nombre del nuevo usuario: " usuario

    if [[ -z $usuario ]]; then
        mensajeError "El nombre no puede estar vacío"
    elif usuarioExiste $usuario; then
        mensajeError "El usuario ya existe"
        return 1
    else
        useradd -d /home/carpetaDe_$usuario -m -s /bin/bash $usuario

        if [[ $? -eq 0 ]]; then
            mensajeBien "Usuario creado correctamente"
            passwd $usuario
        else
            mensajeError "No se pudo crear el usuario"
        fi
    fi
}

eliminarUsuario() {
    requiereRoot || return

    local usuario respuesta
    read -rp "Ingrese el usuario que desea eliminar: " usuario
     if [[ -z $usuario ]]; then
        mensajeError "El nombre no puede estar vacío"
    elif ! usuarioExiste $usuario; then
        mensajeError "El usuario no existe"
        return 1
    else
        read -rp "¿Desea eliminar también su directorio personal? [s/N]: " respuesta
        if [[ $respuesta == "s" || $respuesta == "S" ]]; then
            userdel -r $usuario
        else
            userdel $usuario
        fi
        if [[ $? -eq 0 ]]; then
            mensajeBien "Usuario se elimino correctamente"
        else
            mensajeError "No se pudo eliminar el usuario"
        fi
    fi
}

cambiarPassword() {
    requiereRoot || return 
    local usuario
    read -rp "Ingrese a qué usuario desea cambiar su contraseña: " usuario

    if usuarioExiste $usuario; then
        passwd $usuario
    else
        mensajeError "El usuario no existe"
    fi
}

listarUsuarios() {
    local usuario pass uid guid comment home shell
    echo "Usuarios con UID mayor o igual a 1000: "
    echo
## "IFS=:" es un separador, guarda en cada variable lo que capta read en cada campo delimitado por los ":" 
    while IFS=: read -r usuario pass uid guid comment home shell; do
        if [[ $uid -ge 1000 && $usuario != "nobody" ]]; then
            echo "Usuario: $usuario"
            echo "UID:     $uid"
            echo "Home:    $home"
            echo "Shell:   $shell"
            echo "-----------------------------------"
        fi
    done < /etc/passwd
}

# crearGrupo() {
#     requiereRoot || return
    
#     local grupo
#     read -rp "Nombre del nuevo grupo: " grupo

#     if [[ -z $grupo ]]; then
#         mensajeError "El nombre no puede estar vacío"
#     elif grupoExiste $grupo; then
#         mensajeError "El grupo ya existe"
#     else
#         groupadd $grupo

#         if [[ $? -eq 0 ]]; then
#             mensajeBien "Grupo creado correctamente"
#         else
#             mensajeError "No se pudo crear el grupo"
#         fi
#     fi
# }

# eliminarGrupo() {
#     requiereRoot || return

#     local grupo respuesta
#     read -rp "Ingrese el grupo que desea eliminar: " grupo
#      if [[ -z $grupo ]]; then
#         mensajeError "El nombre no puede estar vacío"
#     elif ! grupoExiste $grupo; then
#         mensajeError "El grupo no existe"
#     else
#         groupdel $grupo

#         if [[ $? -eq 0 ]]; then
#             mensajeBien "El grupo se elimino correctamente"
#         else
#             mensajeError "No se pudo eliminar el grupo"
#         fi
#     fi
# }

crearEliminarGrupo() {
    requiereRoot || return
    local accion=$1 grupo opcion

    if [[ $accion == "crear" ]]; then
        opcion="add"
    elif [[ $accion == "eliminar" ]]; then
        opcion="del"
    else 
        mensajeError "Acción inválida"
        return 1 
    fi

    read -rp "Ingrese nombre del grupo: " grupo
## Verifica que los campos NO esten vacíos
    if [[ -z $grupo ]]; then
        mensajeError "El campo no puede estar vacío"
        return 1
    fi
## Verifica que existan los parametros grupo y usuario
    if  [[ $accion == "crear" ]]; then
        if grupoExiste $grupo ; then
            mensajeError "El grupo ya existe"
            return 1
        fi 
    fi
## La parte final que ejecuta la funcion
    if group$opcion $grupo &> /dev/null; then
        if [[ $opcion == "add" ]]; then
            mensajeBien "Grupo $grupo creado correctamente"
        else
            mensajeBien "Grupo $grupo eliminado correctamente"
        fi
    else
        mensajeError "No se pudo $accion el grupo"
        return 1
    fi
}

gestionGrupoSecundario() {
    requiereRoot || return
    local accion=$1 usuario grupo opcionGpasswd

    if [[ $accion == "agregar" ]]; then
        opcionGpasswd="-a"
    elif [[ $accion == "eliminar" ]]; then
        opcionGpasswd="-d"
    else 
        mensajeError "Acción inválida"
        return 1 
    fi

    read -rp "Ingrese nombre del usuario: " usuario
    read -rp "Ingrese nombre del grupo secundario: " grupo
## Verifica que los campos NO esten vacíos
    if [[ -z $usuario || -z $grupo ]]; then
        mensajeError "Los campos no pueden estar vacíos"
        return 1
    fi
## Verifica que existan los parametros grupo y usuario
    if ! usuarioExiste $usuario ; then
        mensajeError "El usuario no existe"
        return 1 
    elif ! grupoExiste $grupo ; then
        mensajeError "El grupo no existe"
        return 1 
    fi
## La parte final que ejecuta la funcion
    if gpasswd $opcionGpasswd $usuario $grupo &> /dev/null; then
        if [[ $opcionGpasswd == "-a" ]]; then
            mensajeBien "Usuario $usuario añadido correctamente al grupo $grupo"
        else
            mensajeBien "Usuario $usuario eliminado correctamente del grupo $grupo"
        fi
    else
        mensajeError "No se pudo $accion el usuario al grupo secundario"
        return 1
    fi
}

verGruposUsuario() {
    local usuario
    read -rp "Ingrese el usuario: " usuario

    if usuarioExiste $usuario ; then
        groups $usuario
    else
        mensajeError "El usuario no existe"
        return 1
    fi
}

## grupo principal con usermod -g $grupo $usuario

##posible bloquearUsuario() ---> usermod -L
##posible desbloquearUsuario() ---> usermod -U

bloquearDesbloquearUser() {
    requiereRoot || return
    local accion=$1 usuario opcionUsermod

    if [[ $accion == "bloqueado" ]]; then
        opcionUsermod="-L"
    elif [[ $accion == "desbloqueado" ]]; then
        opcionUsermod="-U"
    else
        mensajeError "Acción inválida"
        return 1
    fi

    read -rp "Ingrese el usuario: " usuario

    if [[ -z $usuario ]]; then
        mensajeError "El campo no puede estar vacío"
        return 1
    else
        if usuarioExiste $usuario ; then
             if usermod $opcionUsermod  $usuario ; then
                mensajeBien "El usuario ha sido $accion con éxito"
            else
                mensajeError "El usuario NO se ha $accion"
                return 1
            fi
        else
            mensajeError "El usuario no existe"
            return 1
        fi
    fi
}

menuUsuarios() {
    local opcion = ""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE USUARIOS/GRUPOS ]"
    echo "1.  Crear usuario."
    echo "2.  Eliminar usuario."
    echo "3.  Cambiar password."
    echo "4.  Listar usuarios."
    echo "5.  Crear grupo."
    echo "6.  Eliminar grupo."
    echo "7.  Agregar grupo secundario."
    echo "8.  Quitar grupo secundario."
    echo "9.  Ver grupos de un usuario."
    echo "10. Bloquear sesión de usuario."
    echo "11. Desbloquear sesión de usuario."
    echo "0. Volver"
    echo
    
    read -rp "Seleccione acción: "  opcion
    
    case $opcion in
        1) crearUsuario ; pausa;;
        2) eliminarUsuario ; pausa;;
        3) cambiarPassword ; pausa;;
        4) listarUsuarios ; pausa;;
        5) crearEliminarGrupo crear; pausa;;
        6) crearEliminarGrupo eliminar ; pausa;;
        7) gestionGrupoSecundario agregar ; pausa;;
        8) gestionGrupoSecundario eliminar ; pausa;;
        9) verGruposUsuario ; pausa;;
        10) bloquearDesbloquearUser bloqueado ; pausa;; 
        11) bloquearDesbloquearUser desbloqueado ; pausa;;
        0) return;;
        *)mensajeError "No es una opción válida";;
    esac
    done
}