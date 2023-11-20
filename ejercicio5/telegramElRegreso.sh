#!/bin/bash

if [ "$#" -ne 2 ] || [ -z "$1" ] || [ -z "$2" ]; then
    echo "Debe usar el script de la siguiente manera: $0 usuario contraseña"
    exit 1
fi

USUARIO=$1
CONTRASENA=$2
CSV="../ejercicio2/usuarios.csv"
IMAGES_DIR="../ejercicio2/imagenes_Random_Users"

credenciales_validas=false
while IFS=, read -r GENERO NOMBRE APELLIDO EMAIL CIUDAD USERNAME PASSWORD; do
    USERNAME=$(echo "$USERNAME" | tr -d '"')
    PASSWORD=$(echo "$PASSWORD" | tr -d '"')

    if [ "$USERNAME" == "$USUARIO" ] && [ "$PASSWORD" == "$CONTRASENA" ]; then
        credenciales_validas=true
        break
    fi
done < "$CSV"


if [ "$credenciales_validas" = true ]; then
    NAME=$(echo "$NOMBRE" | tr -d '"')
    LASTNAME=$(echo "$APELLIDO" | tr -d '"')
    
    IMAGEN="$IMAGES_DIR/$NAME-$LASTNAME.jpg"

    TELEGRAM_BOT_TOKEN="6449893333:AAETxliYNE93OjiBQH6gZo-HaaNaGaWZvx8"
    TELEGRAM_CHAT_ID="-4079704711"
    MENSAJE="El usuario $USUARIO ha iniciado sesión."


    TELEGRAM_API_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendPhoto"

    curl -s -X POST "$TELEGRAM_API_URL" \
        -F "chat_id=$TELEGRAM_CHAT_ID" \
        -F "caption=$MENSAJE" \
        -F "photo=@$IMAGEN" >/dev/null 2>&1

else
    echo "Credenciales incorrectas."
fi

if [ $credenciales_validas = true ]; then
    echo "Mensaje y foto enviadas correctamente."
    exit 1
fi