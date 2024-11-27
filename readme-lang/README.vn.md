# Trình Cài Đặt Shadowsocks Dễ Dàng
[![en](https://img.shields.io/badge/lang-en_English-red.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.gb.md)
[![ru](https://img.shields.io/badge/lang-ru_Русский-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md)
[![cn](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md)
[![ir](https://img.shields.io/badge/lang-ir_فارسی-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md)
[![tr](https://img.shields.io/badge/lang-tr_Türkçe-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md)

Kho này cung cấp các công cụ quản lý máy chủ **Shadowsocks** bằng Docker. Bao gồm:
- **Tập Lệnh Quản Lý**: Thiết lập tập lệnh quản lý và các phụ thuộc của nó; Điều khiển vùng chứa Shadowsocks với các lệnh như cài đặt, khởi động, dừng, khởi động lại và gỡ cài đặt.

### Lời cảm ơn đặc biệt:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## Các Tính Năng

- **Liên Kết Tượng Trưng**: Đảm bảo tập lệnh có thể truy cập toàn cầu như `vpn`.
- **Quản Lý Mật Khẩu**: Tự động tạo mật khẩu mạnh hoặc cho phép bạn chỉ định một mật khẩu.
- **Xử Lý Docker**: Tự động cài đặt và thiết lập Docker nếu chưa được cài đặt.
- **Dọn Dẹp Hoàn Toàn**: Xóa vùng chứa, hình ảnh và các tệp liên quan trong quá trình gỡ cài đặt.
- **Hỗ Trợ Đa Ngôn Ngữ**: Bao gồm thông báo bằng 7 ngôn ngữ khác nhau.

---

## Cài Đặt

### 1. Tải Và Chạy Trình Cài Đặt

```bash
mkdir -p /opt/shadowsocks-vpn && curl -fsSL https://github.com/flathead/shadowsocks-installer/raw/main/shadowsocks.sh -o /opt/shadowsocks-vpn/shadowsocks.sh && sudo ln -s /opt/shadowsocks-vpn/shadowsocks.sh /usr/local/bin/vpn && chmod -x /opt/shadowsocks-vpn/shadowsocks.sh && vpn setup vn