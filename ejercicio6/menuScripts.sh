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
    TEMP_FILE=$(mktemp)
    /home/frs/Laboratorio/ejercicio1/altoIdentifiquese.sh "$RUTA" > "$TEMP_FILE" 2>&1
    dialog --title "Resultado" --msgbox "$(cat $TEMP_FILE)" 10 40
    rm -f "$TEMP_FILE"
}


noNames() {
    N=$(dialog --inputbox "Ingrese un número:" 8 40 2>&1 >/dev/tty)
    TEMP_FILE=$(mktemp)
    ../ejercicio2/noNames.sh "$N" > "$TEMP_FILE" 2>&1
    dialog --title "Resultado" --msgbox "$(cat $TEMP_FILE)" 10 40
    rm -f "$TEMP_FILE"
}


login() {
    USUARIO=$(dialog --inputbox "Ingrese el usuario:" 8 40 2>&1 >/dev/tty)
    CONTRASENA=$(dialog --inputbox "Ingrese la contraseña:" 8 40 2>&1 >/dev/tty)
    TEMP_FILE=$(mktemp)
    ../ejercicio3/login.sh "$USUARIO" "$CONTRASENA" > "$TEMP_FILE" 2>&1
    dialog --title "Resultado" --msgbox "$(cat $TEMP_FILE)" 10 40
    rm -f "$TEMP_FILE"
}
elLoboEsta() {
    URL=$(dialog --inputbox "Ingrese la ruta:" 8 40 2>&1 >/dev/tty)
    TOKEN=$(dialog --inputbox "Ingrese la cadena a buscar:" 8 40 2>&1 >/dev/tty)
    TEMP_FILE=$(mktemp)
    ../ejercicio4/elLoboEsta.sh "$URL" "$TOKEN" > "$TEMP_FILE" 2>&1
    dialog --title "Resultado" --msgbox "$(cat $TEMP_FILE)" 10 40
    rm -f "$TEMP_FILE"
}

telegramElRegreso() {
    USER=$(dialog --inputbox "Ingrese el usuario:" 8 40 2>&1 >/dev/tty)
    PASS=$(dialog --inputbox "Ingrese la contraseña:" 8 40 2>&1 >/dev/tty)
    TEMP_FILE=$(mktemp)
    /home/frs/Laboratorio/ejercicio5/telegramElRegreso.sh "$USER" "$PASS" > "$TEMP_FILE" 2>&1
    dialog --title "Resultado" --msgbox "$(cat $TEMP_FILE)" 10 40
    rm -f "$TEMP_FILE"
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

done
