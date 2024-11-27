# Shadowsocks easy installer

## README in different languages
| Language | Description | Link |
|----------|-------------|------|
| 🇷🇺 Русский| README на русском языке тут -> | [✨ README.ru.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md) |
| 🇬🇧 English| README in English is here -> | [✨ README.en.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.gb.md) |
| 🇨🇳 中国人| 中国人 README 位于这里 -> | [✨ README.cn.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md) |
| 🇮🇷 فارسی| README این به زبان فارسی است -> | [✨ README.ir.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md) |
| 🇹🇷 Türkçe| Türkçe README burada -> | [✨ README.tr.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md) |
| 🇻🇳 Tiếng Việt| README tiếng Việt tại đây -> | [✨ README.vn.md](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.vn.md) |

This repository provides tools for managing a **Shadowsocks** server using Docker. It includes:
- **Management Script**: Sets up the management script and its dependencies; Controls the Shadowsocks container with commands like setup, start, stop, restart, and uninstall.

### Special thanks:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## Features

- **Symbolic Link**: Ensures the script is globally accessible as `vpn`.
- **Password Management**: Automatically generates a strong password or lets you specify one.
- **Docker Handling**: Installs and sets up Docker automatically if not already installed.
- **Full Cleanup**: Removes the container, image, and associated files during uninstallation.
- **Multilingual Support**: Includes 7 different language messages.

---

## Installation

### 1. Download and Run the Installer

```bash
mkdir -p /opt/shadowsocks-vpn && curl -fsSL https://github.com/flathead/shadowsocks-installer/raw/main/shadowsocks.sh -o /opt/shadowsocks-vpn/shadowsocks.sh && sudo ln -s /opt/shadowsocks-vpn/shadowsocks.sh /usr/local/bin/vpn && chmod -x /opt/shadowsocks-vpn/shadowsocks.sh && vpn setup en
```

### 2. Verify Installation

The script is installed at `/opt/shadowsocks-vpn/shadowsocks.sh` with a symbolic link created at `/usr/local/bin/vpn`.

Run the following to verify:
```bash
vpn --help
```

---

## Usage

The script supports the following commands:

- **`setup [lang]`**  
  Configures and starts a Shadowsocks container.  
  **Example**: `vpn setup en` (English), `vpn setup ru` (Russian).

- **`start`**  
  Starts the existing container.  
  **Example**: `vpn start`

- **`stop`**  
  Stops the container.  
  **Example**: `vpn stop`

- **`restart`**  
  Restarts the container.  
  **Example**: `vpn restart`

- **`uninstall`**  
  Completely removes the container, its image, and all associated files.  
  **Example**: `vpn uninstall`

- **`--help | -h`**  
  Displays usage information.  
  **Example**: `vpn --help`

---

## Example Output

### Setup
```bash
vpn setup en
```

**Output:**
```
[INFO] Docker installed successfully!
[INFO] Pulling Docker image...
[INFO] Starting Shadowsocks container...

Shadowsocks successfully configured!
=======================================
Server IP:       203.0.113.42
Server Port:     8388
Password:        randompassword123
Encryption:      aes-256-gcm
Timezone:        UTC+3
=======================================
```

### Uninstall
```bash
vpn uninstall
```

**Output:**
```
[INFO] Stopping Shadowsocks container...
[INFO] Removing Shadowsocks container...
[INFO] Removing Docker image...
[SUCCESS] Shadowsocks container and image removed successfully.
```

---

## File Structure

After installation:
- **`/opt/shadowsocks-installer`**: Persistent folder containing the main script and dependencies.
- **`/usr/local/bin/vpn`**: Symbolic link for global access.

---

## Dependencies

- **Docker**: Automatically installed if missing.
- **jq**: Used for JSON parsing. Install it with:
  ```bash
  sudo apt install jq
  ```

---

## License

Licensed under the **MIT License**. Contributions and forks are welcome!