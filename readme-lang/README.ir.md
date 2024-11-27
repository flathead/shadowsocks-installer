# نصب‌کننده آسان Shadowsocks
[![en](https://img.shields.io/badge/lang-en_English-red.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/README.md)
[![ru](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md)
[![cn](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md)
[![vn](https://img.shields.io/badge/lang-vn_Tiếng_Việt-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.vn.md)
[![tr](https://img.shields.io/badge/lang-vn_Tiếng_Việt-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.tr.md)

این مخزن ابزارهایی برای مدیریت سرور **Shadowsocks** با استفاده از Docker ارائه می‌دهد. شامل:
- **اسکریپت مدیریت**: راه‌اندازی اسکریپت مدیریت و وابستگی‌های آن؛ کنترل کانتینر Shadowsocks با دستوراتی مانند نصب، شروع، توقف، راه‌اندازی مجدد و حذف.

### تقدیر ویژه:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## ویژگی‌ها

- **پیوند نمادین**: اطمینان از دسترسی سراسری اسکریپت به عنوان `vpn`.
- **مدیریت رمز عبور**: تولید خودکار رمز عبور قوی یا اجازه تعیین رمز عبور توسط شما.
- **مدیریت Docker**: نصب و راه‌اندازی خودکار Docker در صورت عدم نصب.
- **پاکسازی کامل**: حذف کانتینر، تصویر و فایل‌های مرتبط در هنگام حذف.
- **پشتیبانی چندزبانه**: شامل پیام‌ها در 7 زبان مختلف.

---

## نصب

### ۱. بارگیری و اجرای نصب‌کننده

```bash
hash -r && curl -fsSL https://raw.githubusercontent.com/flathead/shadowsocks-installer/refs/heads/master/installer.sh -o /tmp/installer.sh && bash /tmp/installer.sh ir
```

### ۲. تأیید نصب

اسکریپت در `/opt/shadowsocks-vpn/shadowsocks.sh` نصب شده و پیوند نمادینی در `/usr/local/bin/vpn` ایجاد شده است.

برای تأیید اجرا کنید:
```bash
vpn --help
```

---

## استفاده

اسکریپت از دستورات زیر پشتیبانی می‌کند:

- **`setup [زبان]`**  
  پیکربندی و راه‌اندازی کانتینر Shadowsocks.  
  **مثال**: `vpn setup ir` (فارسی)، `vpn setup en` (انگلیسی).

- **`start`**  
  راه‌اندازی کانتینر موجود.  
  **مثال**: `vpn start`

- **`stop`**  
  توقف کانتینر.  
  **مثال**: `vpn stop`

- **`restart`**  
  راه‌اندازی مجدد کانتینر.  
  **مثال**: `vpn restart`

- **`uninstall`**  
  حذف کامل کانتینر، تصویر و تمام فایل‌های مرتبط.  
  **مثال**: `vpn uninstall`

- **`--help | -h`**  
  نمایش اطلاعات استفاده.  
  **مثال**: `vpn --help`

---

## نمونه خروجی

### نصب
```bash
vpn setup ir
```

**خروجی:**
```
[اطلاعات] Docker با موفقیت نصب شد!
[اطلاعات] در حال بارگیری تصویر Docker...
[اطلاعات] در حال راه‌اندازی کانتینر Shadowsocks...

Shadowsocks با موفقیت پیکربندی شد!
=======================================
IP سرور:        203.0.113.42
پورت سرور:     8388
رمز عبور:       رمز‌عبور‌تصادفی۱۲۳
رمزنگاری:       aes-256-gcm
منطقه زمانی:    UTC+3
=======================================
```

### حذف
```bash
vpn uninstall
```

**خروجی:**
```
[اطلاعات] در حال توقف کانتینر Shadowsocks...
[اطلاعات] در حال حذف کانتینر Shadowsocks...
[اطلاعات] در حال حذف تصویر Docker...
[موفقیت] کانتینر و تصویر Shadowsocks با موفقیت حذف شد.
```

---

## ساختار فایل

پس از نصب:
- **`/opt/shadowsocks-installer`**: پوشه پایدار شامل اسکریپت اصلی و وابستگی‌ها.
- **`/usr/local/bin/vpn`**: پیوند نمادین برای دسترسی سراسری.

---

## وابستگی‌ها

- **Docker**: در صورت نبود، به طور خودکار نصب می‌شود.
- **jq**: برای تجزیه JSON استفاده می‌شود. با دستور زیر نصب کنید:
  ```bash
  sudo apt install jq
  ```

---

## مجوز

تحت **مجوز MIT** مجوزدهی شده است. مشارکت‌ها و شاخه‌ها歡迎هستند.