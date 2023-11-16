#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Debe usar el script de la siguiente manera: $0 ruta token"
    exit 1
fi

wget -q -O /home/frs/Laboratorio/ejercicio4/pagina_descargada.html "$1"



if [ $? -ne 0 ]; then
    echo "Error al descargar la página, revise el URL."
    exit 1
fi


if grep -q " $2 " /home/frs/Laboratorio/ejercicio4/pagina_descargada.html; then
    echo "El token fue encontrado, se eliminara lo descargado de la URL"
    rm /home/frs/Laboratorio/ejercicio4/pagina_descargada.html
else
    echo "El token no fue encontrado en la página."
fi


# https://es.wikipedia.org/wiki/Universidad_Tecnol%C3%B3gica