#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Debe usar el script de la siguiente manera: $0 URL_pagina token"
    exit 1
fi

wget -q -O pagina_descargada.html "$1"



if [ $? -ne 0 ]; then
    echo "Error al descargar la página, revise el URL."
    exit 1
fi


if grep -q "$2" pagina_descargada.html; then
    echo "El token fue encontrado, se eliminara lo descargado de la URL"
    rm pagina_descargada.html
else
    echo "El token no fue encontrado en la página."
fi
