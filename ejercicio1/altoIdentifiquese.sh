#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <RUTA>"
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "La ruta especificada no existe."
    exit 1
fi

if [ -f "$1" ]; then
    if [ -x "$1" ]; then
        echo "El archivo es ejecutable. Ejecutando..."
        ./"$1"
    else
        echo "El archivo no es ejecutable."
    fi
elif [ -d "$1" ]; then
    echo "La ruta es un directorio."
fi
