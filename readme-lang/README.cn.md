# Shadowsocks 简易安装程序
[![en](https://img.shields.io/badge/lang-en_English-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/README.md)
[![ru](https://img.shields.io/badge/lang-ru_Русский-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md)
[![vn](https://img.shields.io/badge/lang-vn_Tiếng_Việt-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.vn.md)
[![ir](https://img.shields.io/badge/lang-ir_فارسی-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md)
[![tr](https://img.shields.io/badge/lang-tr_Türkçe-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md)

自动 Shadowsocks 部署脚本。

本仓库提供使用 Docker 管理 **Shadowsocks** 服务器的工具。包括：
- **管理脚本**：设置管理脚本及其依赖；使用诸如安装、启动、停止、重启和卸载等命令控制 Shadowsocks 容器。

### 特别感谢：
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## 功能特点

- **符号链接**：确保脚本全局可访问为 `vpn`。
- **密码管理**：自动生成强密码或允许您指定密码。
- **Docker 处理**：如果未安装，自动安装并设置 Docker。
- **完全清理**：卸载期间删除容器、镜像和关联文件。
- **多语言支持**：包含 7 种不同语言的消息。

---

## 安装步骤

### 1. 下载并运行安装程序

```bash
hash -r && curl -fsSL https://raw.githubusercontent.com/flathead/shadowsocks-installer/refs/heads/master/installer.sh -o /tmp/installer.sh && bash /tmp/installer.sh cn
```

### 2. 验证安装

脚本安装在 `/opt/shadowsocks-vpn/shadowsocks.sh`，并在 `/usr/local/bin/vpn` 创建符号链接。

运行以下命令验证：
```bash
vpn --help
```

---

## 使用方法

脚本支持以下命令：

- **`setup [语言]`**  
  配置并启动 Shadowsocks 容器。  
  **示例**：`vpn setup cn`（中文），`vpn setup en`（英文）。

- **`start`**  
  启动现有容器。  
  **示例**：`vpn start`

- **`stop`**  
  停止容器。  
  **示例**：`vpn stop`

- **`restart`**  
  重启容器。  
  **示例**：`vpn restart`

- **`uninstall`**  
  完全删除容器、镜像和所有关联文件。  
  **示例**：`vpn uninstall`

- **`--help | -h`**  
  显示使用帮助信息。  
  **示例**：`vpn --help`

---

## 输出示例

### 安装
```bash
vpn setup cn
```

**输出：**
```
[信息] Docker 安装成功！
[信息] 正在下载 Docker 镜像...
[信息] 正在启动 Shadowsocks 容器...

Shadowsocks 配置成功！
=======================================
服务器 IP：       203.0.113.42
服务器端口：     8388
密码：           随机密码123
加密方式：       aes-256-gcm
时区：           UTC+3
=======================================
```

### 卸载
```bash
vpn uninstall
```

**输出：**
```
[信息] 正在停止 Shadowsocks 容器...
[信息] 正在删除 Shadowsocks 容器...
[信息] 正在删除 Docker 镜像...
[成功] Shadowsocks 容器和镜像已成功删除。
```

---

## 文件结构

安装后：
- **`/opt/shadowsocks-installer`**：包含主脚本和依赖项的持久性文件夹。
- **`/usr/local/bin/vpn`**：用于全局访问的符号链接。

---

## 依赖项

- **Docker**：如果缺失，将自动安装。
- **jq**：用于 JSON 解析。使用以下命令安装：
  ```bash
  sudo apt install jq
  ```

---

## 许可证

基于 **MIT 许可证**。欢迎贡献和分支。