#!/bin/bash

# Defaults
REPO_OWNER="flathead"
REPO_NAME="shadowsocks-installer"
APP_DIR="/opt/shadowsocks-vpn"
SCRIPT_DIR="/usr/local/bin"
SCRIPT_PATH="${SCRIPT_DIR}/vpn"
ENV_FILE="${APP_DIR}/.env"
DEFAULT_LANGUAGE="en"

# Create .env file if it doesn't exist and set the language
create_env_file() {
    # Убедитесь, что папка APP_DIR существует
    sudo mkdir -p "$APP_DIR"
    if [ ! -f "$ENV_FILE" ]; then
        # Создаём .env файл, если он отсутствует
        echo "LANG=$1" | sudo tee "$ENV_FILE" > /dev/null
        echo -e ".env file is created, current language: $1"
    else
        # Читаем текущий язык из .env
        CURRENT_LANG=$(grep -E '^LANG=' "$ENV_FILE" | cut -d'=' -f2)
        if [ "$CURRENT_LANG" != "$1" ]; then
            # Обновляем LANG, если он отличается от переданного
            sudo sed -i "s/^LANG=.*/LANG=$1/" "$ENV_FILE"
            echo -e "Updated LANG in .env from $CURRENT_LANG to $1"
        else
            echo -e "File .env already exists. Current language: $CURRENT_LANG (no changes made)."
        fi
    fi
}

# Prepare the environment and run setup
install() {
    # Создание директории и загрузка файлов
    sudo mkdir -p "$APP_DIR"
    curl -fsSL "https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/master/shadowsocks.sh" -o "${APP_DIR}/shadowsocks.sh"
    curl -fsSL "https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/master/languages.json" -o "${APP_DIR}/languages.json"

    # Создание ссылки на исполняемый скрипт
    sudo ln -sf "${APP_DIR}/shadowsocks.sh" "${SCRIPT_PATH}" && sudo chmod +x "${APP_DIR}/shadowsocks.sh"

    # Запуск настройки с выбранным языком
    "${SCRIPT_PATH}" setup "$1"
}

# Main script logic
# Check if a language is provided as an argument
if [ "$#" -eq 0 ]; then
    LANGUAGE="$DEFAULT_LANGUAGE"
else
    LANGUAGE="$1"
fi

# Create .env file if it doesn't exist
create_env_file "$LANGUAGE"
install "$LANGUAGE"
