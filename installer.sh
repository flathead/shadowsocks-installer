#!/bin/bash

# Defaults
REPO_OWNER="flathead"
REPO_NAME="shadowsocks-installer"
APP_DIR="/opt/shadowsocks-vpn"
SCRIPT_DIR="/usr/local/bin"
SCRIPT_PATH="${SCRIPT_DIR}/vpn"
LANGUAGE="en"

# Prepare the environment and run setup
install() {
    sudo mkdir -p "/opt/shadowsocks-vpn"
    curl -fsSL "https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/master/shadowsocks.sh" -o "${APP_DIR}/shadowsocks.sh"
    curl -fsSl "https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/master/languages.json" -o "${APP_DIR}/languages.json"
    sudo ln -sf "${APP_DIR}/shadowsocks.sh" "${SCRIPT_PATH}" && sudo chmod +x "${APP_DIR}/shadowsocks.sh"
    vpn setup $LANGUAGE
}

# Main script logic
LANGUAGE=${2:-en}
install