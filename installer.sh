#!/bin/bash

# Defaults
REPO_OWNER="flathead"
REPO_NAME="shadowsocks-installer"
APP_DIR="/opt/shadowsocks-vpn"
SCRIPT_DIR="/usr/local/bin"
SCRIPT_PATH="${SCRIPT_DIR}/vpn"
DEFAULT_LANGUAGE="en"

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
# Проверка аргументов
if [ "$#" -eq 0 ]; then
    LANGUAGE="$DEFAULT_LANGUAGE"
else
    LANGUAGE="$1"
fi

# Запуск установки
install "$LANGUAGE"
