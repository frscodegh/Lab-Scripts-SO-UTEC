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

altoIdentifiquese.sh() {
    ruta=$(dialog --inputbox "Ingrese la ruta:" 8 40 2>&1 >/dev/tty)
    ./altoIdentifiquese.sh "$ruta"
}

# Puedes definir funciones similares para los demás scripts...

# Ciclo principal del menú
while true; do
    seleccion=$(mostrarMenu)

    case $seleccion in
        1) altoIdentifiquese ;;
        2) echo "Seleccionaste Script 2";;  # Reemplaza con la llamada al segundo script
        3) echo "Seleccionaste Script 3";;  # Reemplaza con la llamada al tercer script
        4) echo "Seleccionaste Script 4";;  # Reemplaza con la llamada al cuarto script
        5) echo "Seleccionaste Script 5";;  # Reemplaza con la llamada al quinto script
        *) break ;;  # Salir del bucle si se selecciona "Cancelar" o se cierra la ventana
    esac
done
