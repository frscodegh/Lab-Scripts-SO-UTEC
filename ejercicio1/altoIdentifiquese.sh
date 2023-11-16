#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Debe usar el script de la siguiente manera: $0 ruta"
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "La ruta especificada no existe."
    exit 1
fi

RUTA="$1"

if [ -f "$RUTA" ]; then
    if [ -x "$RUTA" ]; then
        echo "El archivo es ejecutable. Ejecutando..."
        "$RUTA"
    else
        echo "El archivo no es ejecutable."
    fi
elif [ -d "$RUTA" ]; then
    echo "La ruta es un directorio."
else
    echo "La ruta no es válida o no existe."
fi


