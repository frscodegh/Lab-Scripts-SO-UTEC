#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Debe ingresar: $0 usuario contraseña"
    exit 1
fi

usuario="$1"
contrasenia="$2"

if grep -q "$usuario\",\"$contrasenia\"" ../ejercicio2/usuarios.csv; then
    echo "Credenciales Correctas"
else
    echo "Credenciales Incorrectas"
fi
