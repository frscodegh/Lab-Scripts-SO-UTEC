enviarMensajeTelegram() {
    local TELEGRAM_BOT_TOKEN="6449893333:AAETxliYNE93OjiBQH6gZo-HaaNaGaWZvx8"
    local TELEGRAM_CHAT_ID="-4079704711"
    local MENSAJE="Hola desde Bash Script"

    local TELEGRAM_API_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

    curl -s -X POST "$TELEGRAM_API_URL" \
        -F "chat_id=$TELEGRAM_CHAT_ID" \
        -F "text=$MENSAJE"
}


#enviarMensajeTelegram

enviarFotoTelegram() {
    local TELEGRAM_BOT_TOKEN="6449893333:AAETxliYNE93OjiBQH6gZo-HaaNaGaWZvx8"
    local TELEGRAM_CHAT_ID="-4079704711"
    local RUTA_DE_LA_IMAGEN="../ejercicio2/imagenes_Random_Users/Cody-Boyd.jpg"

    local MENSAJE="Foto desde Bash Script"

    local TELEGRAM_API_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendPhoto"

    curl -s -X POST "$TELEGRAM_API_URL" \
        -F "chat_id=$TELEGRAM_CHAT_ID" \
        -F "caption=$MENSAJE" \
        -F "photo=@$RUTA_DE_LA_IMAGEN"
}

enviarFotoTelegram
