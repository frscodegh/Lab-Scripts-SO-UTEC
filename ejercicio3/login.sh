#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Debe usar el script de la siguiente manera: $0 usuario contraseña"
    exit 1
fi

usuario="$1"
contrasena="$2"

if grep -q "$usuario\",\"$contrasena\"" ../ejercicio2/usuarios.csv; then
    echo "Credenciales Correctas"
else
    echo "Credenciales Incorrectas"
fi
