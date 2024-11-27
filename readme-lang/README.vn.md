# Trình cài đặt dễ dàng Shadowsocks
[![en](https://img.shields.io/badge/lang-en_English-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/README.md)
[![ru](https://img.shields.io/badge/lang-ru_Русский-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md)
[![cn](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md)
[![ir](https://img.shields.io/badge/lang-ir_فارسی-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md)
[![tr](https://img.shields.io/badge/lang-tr_Türkçe-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md)

Kho lưu trữ này cung cấp các công cụ để quản lý máy chủ **Shadowsocks** bằng Docker. Nó bao gồm:
- **Script quản lý**: Thiết lập script quản lý và các phụ thuộc của nó; điều khiển container Shadowsocks với các lệnh như setup, start, stop, restart, và uninstall.

### Lời cảm ơn đặc biệt:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## Tính năng

- **Liên kết biểu tượng**: Đảm bảo script có thể được truy cập toàn cầu dưới dạng `vpn`.
- **Quản lý mật khẩu**: Tự động tạo mật khẩu mạnh hoặc cho phép bạn chỉ định mật khẩu.
- **Xử lý Docker**: Tự động cài đặt và thiết lập Docker nếu chưa được cài đặt.
- **Dọn dẹp hoàn toàn**: Xóa container, image và các tệp liên quan khi gỡ cài đặt.
- **Hỗ trợ đa ngôn ngữ**: Bao gồm thông điệp bằng 7 ngôn ngữ khác nhau.

---

## Cài đặt

### 1. Tải xuống và chạy trình cài đặt

```bash
hash -r && curl -fsSL https://raw.githubusercontent.com/flathead/shadowsocks-installer/refs/heads/master/installer.sh -o /tmp/installer.sh && bash /tmp/installer.sh vn
```

### 2. Kiểm tra cài đặt

Script được cài đặt tại `/opt/shadowsocks-vpn/shadowsocks.sh` với một liên kết biểu tượng được tạo tại `/usr/local/bin/vpn`.

Chạy lệnh sau để kiểm tra:
```bash
vpn --help
```

---

## Cách sử dụng

Script hỗ trợ các lệnh sau:

- **`setup [lang]`**  
  Cấu hình và khởi động container Shadowsocks.  
  **Ví dụ**: `vpn setup vn` (Tiếng Việt), `vpn setup en` (Tiếng Anh).

- **`start`**  
  Khởi động container đã tồn tại.  
  **Ví dụ**: `vpn start`

- **`stop`**  
  Dừng container.  
  **Ví dụ**: `vpn stop`

- **`restart`**  
  Khởi động lại container.  
  **Ví dụ**: `vpn restart`

- **`uninstall`**  
  Gỡ bỏ hoàn toàn container, image và tất cả các tệp liên quan.  
  **Ví dụ**: `vpn uninstall`

- **`--help | -h`**  
  Hiển thị thông tin hướng dẫn sử dụng.  
  **Ví dụ**: `vpn --help`

---

## Ví dụ đầu ra

### Setup
```bash
vpn setup vn
```

**Đầu ra:**
```
[INFO] Docker được cài đặt thành công!
[INFO] Đang tải xuống image Docker...
[INFO] Đang khởi động container Shadowsocks...

Shadowsocks đã được cấu hình thành công!
=======================================
IP máy chủ:       203.0.113.42
Cổng máy chủ:     8388
Mật khẩu:         randompassword123
Mã hóa:           aes-256-gcm
Múi giờ:          UTC+3
=======================================
```

### Uninstall
```bash
vpn uninstall
```

**Đầu ra:**
```
[INFO] Đang dừng container Shadowsocks...
[INFO] Đang xóa container Shadowsocks...
[INFO] Đang xóa image Docker...
[SUCCESS] Container và image Shadowsocks đã được xóa thành công.
```

---

## Cấu trúc tệp

Sau khi cài đặt:
- **`/opt/shadowsocks-installer`**: Thư mục lưu trữ chứa script chính và các phụ thuộc.
- **`/usr/local/bin/vpn`**: Liên kết biểu tượng để truy cập toàn cầu.

---

## Các phụ thuộc

- **Docker**: Tự động cài đặt nếu thiếu.
- **jq**: Được sử dụng để phân tích JSON. Cài đặt bằng lệnh:
  ```bash
  sudo apt install jq
  ```

---

## Giấy phép

Được cấp phép theo **MIT License**. Chào mừng các đóng góp và nhánh phát triển!