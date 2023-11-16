#!/bin/bash

mostrarMenu() {
    dialog --clear --backtitle "Menú de Scripts" \
        --title "Selecciona un script" \
        --menu "Elige una opción:" 15 40 5 \
        1 "Script 1 - altoIdentifiquese.sh" \
        2 "Script 2 - noNames.sh" \
        3 "Script 3 - login.sh" \
        4 "Script 4 - elLoboEsta.sh" \
        5 "Script 5 - telegramElRegreso.sh" \
        2>&1 >/dev/tty
}

altoIdentifiquese() {
    RUTA=$(dialog --inputbox "Ingrese la ruta:" 8 40 2>&1 >/dev/tty)

    /home/frs/Laboratorio/ejercicio1/altoIdentifiquese.sh "$RUTA"
}

noNames() {
    N=$(dialog --inputbox "Ingrese un numero:" 8 40 2>&1 >/dev/tty)
    ../ejercicio2/noNames.sh "$N"
}

login() {
    USUARIO=$(dialog --inputbox "Ingrese el usuario:" 8 40 2>&1 >/dev/tty)
    CONTRASENA=$(dialog --inputbox "Ingrese la contraseña:" 8 40 2>&1 >/dev/tty)
    ../ejercicio3/login.sh "$USUARIO" "$CONTRASENA"
}
elLoboEsta() {
    URL=$(dialog --inputbox "Ingrese la ruta:" 8 40 2>&1 >/dev/tty)
    TOKEN=$(dialog --inputbox "Ingrese la cadena a buscar:" 8 40 2>&1 >/dev/tty)
    ../ejercicio4/elLoboEsta.sh "$URL" "$TOKEN"
}
telegramElRegreso() {
    USER=$(dialog --inputbox "Ingrese el usuario:" 8 40 2>&1 >/dev/tty)
    PASS=$(dialog --inputbox "Ingrese la contraseña:" 8 40 2>&1 >/dev/tty)
    ../ejercicio5/telegramElRegreso.sh "$USER" "$PASS"
}



while true; do
    seleccion=$(mostrarMenu)

    case $seleccion in
        1) altoIdentifiquese ;;
        2) noNames ;;
        3) login ;;
        4) elLoboEsta ;;
        5) telegramElRegreso ;;
        *) break ;;
        
    esac
    read -p "Presiona Enter para salir..."

done
