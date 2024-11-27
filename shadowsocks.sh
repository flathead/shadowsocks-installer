#!/bin/bash

# Color codes for formatting
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# Defaults
IMAGE="shadowsocks/shadowsocks-libev"
PORT="8388"
METHOD="aes-256-gcm"
TZ="UTC+3"
CONTAINER_NAME="shadowsocks"
LANGUAGE="en"
LANG_FILE="languages.json"

# Generate a random password
random_password() {
  tr -dc A-Za-z0-9 </dev/urandom | head -c 12
}

# Load messages from JSON file
load_messages() {
  if ! [ -f "$LANG_FILE" ]; then
    echo -e "${RED}Language file not found: $LANG_FILE${RESET}"
    exit 1
  fi

  MSG_USAGE=$(jq -r ".$LANGUAGE.MSG_USAGE" $LANG_FILE)
  MSG_COMMANDS=$(jq -r ".$LANGUAGE.MSG_COMMANDS" $LANG_FILE)
  MSG_SETUP=$(jq -r ".$LANGUAGE.MSG_SETUP" $LANG_FILE)
  MSG_START=$(jq -r ".$LANGUAGE.MSG_START" $LANG_FILE)
  MSG_STOP=$(jq -r ".$LANGUAGE.MSG_STOP" $LANG_FILE)
  MSG_RESTART=$(jq -r ".$LANGUAGE.MSG_RESTART" $LANG_FILE)
  MSG_UNINSTALL=$(jq -r ".$LANGUAGE.MSG_UNINSTALL" $LANG_FILE)
  MSG_HELP=$(jq -r ".$LANGUAGE.MSG_HELP" $LANG_FILE)
  MSG_DOCKER_NOT_INSTALLED=$(jq -r ".$LANGUAGE.MSG_DOCKER_NOT_INSTALLED" $LANG_FILE)
  MSG_UNSUPPORTED_PM=$(jq -r ".$LANGUAGE.MSG_UNSUPPORTED_PM" $LANG_FILE)
  MSG_DOCKER_INSTALLED=$(jq -r ".$LANGUAGE.MSG_DOCKER_INSTALLED" $LANG_FILE)
  MSG_GENERATED_PASSWORD=$(jq -r ".$LANGUAGE.MSG_GENERATED_PASSWORD" $LANG_FILE)
  MSG_PULL_IMAGE=$(jq -r ".$LANGUAGE.MSG_PULL_IMAGE" $LANG_FILE)
  MSG_START_CONTAINER=$(jq -r ".$LANGUAGE.MSG_START_CONTAINER" $LANG_FILE)
  MSG_SETUP_SUCCESS=$(jq -r ".$LANGUAGE.MSG_SETUP_SUCCESS" $LANG_FILE)
  MSG_REMOVING_CONTAINER=$(jq -r ".$LANGUAGE.MSG_REMOVING_CONTAINER" $LANG_FILE)
  MSG_CONTAINER_REMOVED=$(jq -r ".$LANGUAGE.MSG_CONTAINER_REMOVED" $LANG_FILE)
}

# Print usage
print_help() {
  echo -e "${YELLOW}$MSG_USAGE${RESET}"
  echo -e "\n$MSG_COMMANDS"
  echo -e "  ${BLUE}setup${RESET}    $MSG_SETUP"
  echo -e "  ${BLUE}start${RESET}    $MSG_START"
  echo -e "  ${BLUE}stop${RESET}     $MSG_STOP"
  echo -e "  ${BLUE}restart${RESET}  $MSG_RESTART"
  echo -e "  ${BLUE}uninstall${RESET} $MSG_UNINSTALL"
  echo -e "  ${BLUE}--help|-h${RESET} $MSG_HELP"
}

# Check if Docker is installed and install if necessary
check_docker() {
  if ! command -v docker &>/dev/null; then
    echo -e "${RED}$MSG_DOCKER_NOT_INSTALLED${RESET}"
    if command -v apt &>/dev/null; then
      sudo apt update
      sudo apt install -y docker.io
    elif command -v yum &>/dev/null; then
      sudo yum install -y docker
    else
      echo -e "${RED}$MSG_UNSUPPORTED_PM${RESET}"
      exit 1
    fi
  fi

  echo -e "${GREEN}$MSG_DOCKER_INSTALLED${RESET}"
  sudo systemctl start docker
  sudo systemctl enable docker
}

# Setup Shadowsocks container
setup() {
  # Check jq installation
  if ! command -v jq &>/dev/null; then
    echo -e "${RED}$MSG_JQ_NOT_INSTALLED${RESET}"
    if command -v apt &>/dev/null; then
      sudo apt update
      sudo apt install -y jq
    elif command -v yum &>/dev/null; then
      sudo yum install -y jq
    else
      echo -e "${RED}$MSG_JQ_PLEASE_INSTALL_MANUALLY${RESET}"
      exit 1
    fi
  fi

  # Generate strong password
  read -p "$MSG_GENERATED_PASSWORD " PASSWORD
  if [ -z "$PASSWORD" ]; then
    PASSWORD=$(random_password)
    echo -e "${YELLOW}$MSG_GENERATED_PASSWORD${RESET} $PASSWORD"
  fi

  check_docker

  echo -e "${GREEN}$MSG_PULL_IMAGE${RESET}"
  docker pull $IMAGE

  echo -e "${GREEN}$MSG_START_CONTAINER${RESET}"
  docker run -e PASSWORD=$PASSWORD -e TZ=$TZ -p $PORT:$PORT -p $PORT:$PORT/udp -d --restart always --name $CONTAINER_NAME $IMAGE

  IP=$(curl -s ifconfig.me)
  echo -e "\n${GREEN}$MSG_SETUP_SUCCESS${RESET}"
  echo -e "${BLUE}=======================================${RESET}"
  echo -e "${YELLOW}Server IP:      ${RESET}$IP"
  echo -e "${YELLOW}Server Port:    ${RESET}$PORT"
  echo -e "${YELLOW}Password:       ${RESET}$PASSWORD"
  echo -e "${YELLOW}Encryption:     ${RESET}$METHOD"
  echo -e "${YELLOW}Timezone:       ${RESET}$TZ"
  echo -e "${BLUE}=======================================${RESET}"
}

# Start the container
start() {
  echo -e "${GREEN}$MSG_START_CONTAINER${RESET}"
  docker start $CONTAINER_NAME
}

# Stop the container
stop() {
  echo -e "${YELLOW}$MSG_STOP_CONTAINER${RESET}"
  docker stop $CONTAINER_NAME
}

# Restart the container
restart() {
  echo -e "${GREEN}$MSG_RESTART_CONTAINER${RESET}"
  docker restart $CONTAINER_NAME
}

# Uninstall Shadowsocks
uninstall() {
  echo -e "${RED}$MSG_REMOVING_CONTAINER${RESET}"
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME

  echo -e "${RED}$MSG_REMOVING_IMAGE${RESET}"
  docker rmi $IMAGE

  echo -e "${GREEN}$MSG_CONTAINER_REMOVED${RESET}"
  echo -e "${GREEN}$MSG_IMAGE_REMOVED${RESET}"
}

# Main script logic
LANGUAGE=${2:-en}
load_messages

case "$1" in
  setup)
    setup
    ;;
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  uninstall)
    uninstall
    ;;
  --help|-h|*)
    print_help
    ;;
esac
