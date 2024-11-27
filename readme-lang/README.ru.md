# Простой установщик Shadowsocks
[![en](https://img.shields.io/badge/lang-en_English-red.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/README.md)
[![cn](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md)
[![ir](https://img.shields.io/badge/lang-ir_فارسی-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md)
[![tr](https://img.shields.io/badge/lang-tr_Türkçe-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md)
[![vn](https://img.shields.io/badge/lang-vn_Tiếng_Việt-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.vn.md)

Этот репозиторий предоставляет инструменты для управления сервером **Shadowsocks** с использованием Docker. Он включает:
- **Скрипт управления**: Устанавливает скрипт управления и его зависимости; Управляет контейнером Shadowsocks с помощью команд: установка, запуск, остановка, перезапуск и удаление.

### Особая благодарность:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## Возможности

- **Символическая ссылка**: Обеспечивает глобальный доступ к скрипту как `vpn`.
- **Управление паролями**: Автоматически генерирует надежный пароль или позволяет указать свой.
- **Работа с Docker**: Автоматически устанавливает и настраивает Docker, если он не установлен.
- **Полная очистка**: Удаляет контейнер, образ и связанные файлы при деинсталляции.
- **Многоязычная поддержка**: Включает сообщения на 7 разных языках.

---

## Установка

### 1. Загрузка и запуск установщика

```bash
hash -r && curl -fsSL https://raw.githubusercontent.com/flathead/shadowsocks-installer/refs/heads/master/installer.sh -o /tmp/installer.sh && bash /tmp/installer.sh ru
```

### 2. Проверка установки

Скрипт устанавливается по пути `/opt/shadowsocks-vpn/shadowsocks.sh` с символической ссылкой в `/usr/local/bin/vpn`.

Выполните для проверки:
```bash
vpn --help
```

---

## Использование

Скрипт поддерживает следующие команды:

- **`setup [lang]`**  
  Настройка и запуск контейнера Shadowsocks.  
  **Пример**: `vpn setup ru` (Русский), `vpn setup en` (Английский).

- **`start`**  
  Запускает существующий контейнер.  
  **Пример**: `vpn start`

- **`stop`**  
  Останавливает контейнер.  
  **Пример**: `vpn stop`

- **`restart`**  
  Перезапускает контейнер.  
  **Пример**: `vpn restart`

- **`uninstall`**  
  Полностью удаляет контейнер, его образ и все связанные файлы.  
  **Пример**: `vpn uninstall`

- **`--help | -h`**  
  Отображает информацию об использовании.  
  **Пример**: `vpn --help`

---

## Пример вывода

### Установка
```bash
vpn setup ru
```

**Вывод:**
```
[ИНФОРМАЦИЯ] Docker успешно установлен!
[ИНФОРМАЦИЯ] Загрузка образа Docker...
[ИНФОРМАЦИЯ] Запуск контейнера Shadowsocks...

Shadowsocks успешно настроен!
=======================================
IP сервера:       203.0.113.42
Порт сервера:     8388
Пароль:           randompassword123
Шифрование:       aes-256-gcm
Часовой пояс:     UTC+3
=======================================
```

### Деинсталляция
```bash
vpn uninstall
```

**Вывод:**
```
[ИНФОРМАЦИЯ] Остановка контейнера Shadowsocks...
[ИНФОРМАЦИЯ] Удаление контейнера Shadowsocks...
[ИНФОРМАЦИЯ] Удаление образа Docker...
[УСПЕХ] Контейнер и образ Shadowsocks удалены успешно.
```

---

## Структура файлов

После установки:
- **`/opt/shadowsocks-installer`**: Постоянная папка, содержащая основной скрипт и зависимости.
- **`/usr/local/bin/vpn`**: Символическая ссылка для глобального доступа.

---

## Зависимости

- **Docker**: Автоматически устанавливается при отсутствии.
- **jq**: Используется для парсинга JSON. Установите с помощью:
  ```bash
  sudo apt install jq
  ```

---

## Лицензия

Лицензировано под **Лицензией MIT**. Приветствуются вклады и форки.