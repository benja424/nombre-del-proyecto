#!/bin/bash
source ./comunes.sh
## había visto que el profe uso esto para las rutas que se iban a usar seguido en una clase
## pense que me iba a servir cuando vi que la iba a usar bastante
DIR_RESPALDOS="/root/respaldos"

crearRespaldo() {
    requiereRoot || return
    local carpeta nombreArchivo fechaHoy

    read -rp "Ingrese la ruta de la carpeta a respaldar: " carpeta

    if [[ -z $carpeta ]]; then
        mensajeError "La ruta no puede estar vacía"
        return 1
    fi

    if [[ ! -d $carpeta ]]; then
        mensajeError "La carpeta $carpeta no existe"
        return 1
    fi

    ## mkdir -p crea la carpeta de respaldos si todavía no existe
    ## -p evita que tire error si ya existe, y además crea carpetas padre intermedias si hicieran falta
    mkdir -p "$DIR_RESPALDOS"

    ## date +formato devuelve la fecha/hora actual con el formato que le pidamos como vimos en clase
    ## %d = día (2 dígitos), %m = mes (2 dígitos), %Y = año (4 dígitos) 
    ## %H = hora 24hs, %M = minutos, %S = segundos y así en cada una que cree
    ## quedaría algo así: 31_08_2026_23:33:10
    fechaHoy=$(date +%d_%m_%Y_%H:%M:%S)
    nombreArchivo="respaldo_$(basename "$carpeta")_$fechaHoy.tar.gz"

    ## tar arma el archivo de respaldo comprimido como lo había mencionado el profe
    ## -c crea un archivo nuevo, -z lo comprime con gzip, -f indica el nombre del archivo a generar
    ## -C "$(dirname "$carpeta")" hace que tar se posicione en la carpeta PADRE antes de comprimir (beri importante)
    ## así el .tar.gz guarda rutas relativas como "midocumentos/..." y no la ruta absoluta completa
    ## "$(basename "$carpeta")" es lo que efectivamente se agrega al archivo q sería solo el nombre de la carpeta a respaldar
    if tar -czf "$DIR_RESPALDOS/$nombreArchivo" -C "$(dirname "$carpeta")" "$(basename "$carpeta")" 2>/dev/null; then
        mensajeBien "Respaldo creado correctamente: $DIR_RESPALDOS/$nombreArchivo"
    else
        mensajeError "No se pudo crear el respaldo"
        return 1
    fi
}

listarRespaldos() {
    ## Esta condición chequea dos cosas con un OR de doble pipe q vi en el video del profe
    ## 1- [[ ! -d $DIR_RESPALDOS ]] -> la carpeta de respaldos no existe todavía
    ## 2- [[ -z $(ls -A ...) ]] -> "ls -A" lista el contenido de la carpeta (incluso archivos ocultos);
    ## si esa salida está vacía (-z), significa que la carpeta existe pero no tiene respaldos adentro
    ## si se cumple cualquiera de las dos, no hay nada para mostrar y tira error
    if [[ ! -d $DIR_RESPALDOS ]] || [[ -z $(ls -A "$DIR_RESPALDOS" 2>/dev/null) ]]; then
        mensajeError "No hay respaldos disponibles"
        return 1
    fi

    echo "Respaldos disponibles en $DIR_RESPALDOS: "
    echo
    ## ls -lh lista el contenido de la carpeta en formato detallado
    ## -l muestra una línea por archivo con permisos, dueño, tamaño y fecha de modificación
    ## -h muestra el tamaño en formato legible onda en vez de poner mil digitos lo pone sencillo tipo 4M y así
    ls -lh "$DIR_RESPALDOS"
}

restaurarRespaldo() {
    requiereRoot || return
    local archivo destino

    listarRespaldos || return 1
    echo

    read -rp "Ingrese el nombre del archivo a restaurar: " archivo

    if [[ ! -f "$DIR_RESPALDOS/$archivo" ]]; then
        mensajeError "El archivo no existe en $DIR_RESPALDOS"
        return 1
    fi

    read -rp "Ingrese el directorio destino de la restauración: " destino

    if [[ -z $destino ]]; then
        mensajeError "El destino no puede estar vacío"
        return 1
    fi

    mkdir -p "$destino"

    ## tar acá hace lo inverso a la creación tipo extrae el contenido del respaldo
    ## -x extrae archivos (en vez de crear), -z descomprime con gzip, -f indica el archivo de origen
    ## -C "$destino" hace que el contenido se descomprima DENTRO de esa carpeta destino,
    ## en vez de extraerse en la carpeta donde estamos parados al ejecutar el script y eso es fundamental
    if tar -xzf "$DIR_RESPALDOS/$archivo" -C "$destino"; then
        mensajeBien "Respaldo restaurado correctamente en $destino"
    else
        mensajeError "No se pudo restaurar el respaldo"
        return 1
    fi
}

eliminarRespaldo() {
    requiereRoot || return
    local archivo

    listarRespaldos || return 1
    echo

    read -rp "Ingrese el nombre del archivo a eliminar: " archivo

    if [[ ! -f "$DIR_RESPALDOS/$archivo" ]]; then
        mensajeError "El archivo no existe en $DIR_RESPALDOS"
        return 1
    fi

    if rm "$DIR_RESPALDOS/$archivo"; then
        mensajeBien "Respaldo eliminado correctamente"
    else
        mensajeError "No se pudo eliminar el respaldo"
        return 1
    fi
}

menuRespaldos() {
    local opcion=""

    while [[ $opcion != "0" ]]; do
    titulo "   [ GESTIÓN DE RESPALDOS ]"
    echo "1. Crear respaldo."
    echo "2. Listar respaldos."
    echo "3. Restaurar respaldo."
    echo "4. Eliminar respaldo."
    echo "0. Volver"
    echo

    read -rp "Seleccione acción: " opcion

    case $opcion in
        1) crearRespaldo ; pausa;;
        2) listarRespaldos ; pausa;;
        3) restaurarRespaldo ; pausa;;
        4) eliminarRespaldo ; pausa;;
        0) return;;
        *) mensajeError "No es una opción válida" ; pausa;;
    esac
    done
}