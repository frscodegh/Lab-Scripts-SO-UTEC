#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Debe usar el script de la siguiente manera: $0 numero"
    exit 1
fi

N=$1  
CSV="usuarios.csv"
IMAGES_DIR="imagenes_Random_Users"

mkdir -p "/home/frs/Laboratorio/ejercicio2/$IMAGES_DIR"
allUsers=$(curl -s "https://randomuser.me/api/?results=$N")
for i in $(seq 0 $(("$N"-1))); 
do
    user=$(echo "$allUsers" | jq .results[$i])   
    GENERO=$(echo "$user" | jq -r .gender)
    NOMBRE=$(echo "$user" | jq -r .name.first)
    APELLIDO=$(echo "$user" | jq -r .name.last)
    CIUDAD=$(echo "$user" | jq -r .location.city)
    USERNAME=$(echo "$user" | jq -r .login.username)
    PASSWORD=$(echo "$user" | jq -r .login.password)
    EMAIL=$(echo "$user" | jq -r .email)
    IMAGEN=$(echo "$user" | jq -r .picture.large)
    
    echo "\"$GENERO\",\"$NOMBRE\",\"$APELLIDO\",\"$EMAIL\",\"$CIUDAD\",\"$USERNAME\",\"$PASSWORD\"" >> "/home/frs/Laboratorio/ejercicio2/$CSV"

    curl -s -o "/home/frs/Laboratorio/ejercicio2/$IMAGES_DIR/$NOMBRE-$APELLIDO.jpg" "$IMAGEN"
done

if [ $N -ne 0 ]; then
    echo "Datos y foto de usuario guardadas correctamente."
    exit 1
fi