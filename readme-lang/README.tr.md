# Shadowsocks Kolay Yükleyici
[![en](https://img.shields.io/badge/lang-en_English-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/README.md)
[![ru](https://img.shields.io/badge/lang-ru_Русский-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ru.md)
[![cn](https://img.shields.io/badge/lang-cn_中国人-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.cn.md)
[![vn](https://img.shields.io/badge/lang-vn_Tiếng_Việt-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.vn.md)
[![ir](https://img.shields.io/badge/lang-ir_فارسی-green.svg)](https://github.com/flathead/shadowsocks-installer/blob/master/readme-lang/README.ir.md)

Bu depo, Docker kullanarak bir **Shadowsocks** sunucusunu yönetmek için araçlar sağlar. İçerir:
- **Yönetim Komut Dosyası**: Yönetim komut dosyasını ve bağımlılıklarını kurar; Kurulum, başlatma, durdurma, yeniden başlatma ve kaldırma gibi komutlarla Shadowsocks konteynerini kontrol eder.

### Özel teşekkürler:
[![repo](https://img.shields.io/badge/repo-shadowsocks--libev-red.svg)](https://github.com/shadowsocks/shadowsocks-libev)

---

## Özellikler

- **Sembolik Bağlantı**: Komut dosyasının `vpn` olarak küresel olarak erişilebilir olmasını sağlar.
- **Şifre Yönetimi**: Otomatik olarak güçlü bir şifre oluşturur veya kendi şifrenizi belirleyebilirsiniz.
- **Docker İşleme**: Zaten kurulu değilse Docker'ı otomatik olarak yükler ve ayarlar.
- **Tam Temizleme**: Kaldırma sırasında konteyneri, imgeyi ve ilişkili dosyaları kaldırır.
- **Çok Dilli Destek**: 7 farklı dilde mesaj içerir.

---

## Kurulum

### 1. Yükleyiciyi İndirin ve Çalıştırın

```bash
hash -r && curl -fsSL https://raw.githubusercontent.com/flathead/shadowsocks-installer/refs/heads/master/installer.sh -o /tmp/installer.sh && bash /tmp/installer.sh tr
```

### 2. Kurulumu Doğrulayın

Komut dosyası `/opt/shadowsocks-vpn/shadowsocks.sh` konumuna yüklenir ve `/usr/local/bin/vpn` konumunda bir sembolik bağlantı oluşturulur.

Doğrulamak için şunu çalıştırın:
```bash
vpn --help
```

---

## Kullanım

Komut dosyası aşağıdaki komutları destekler:

- **`setup [dil]`**  
  Bir Shadowsocks konteynerini yapılandırır ve başlatır.  
  **Örnek**: `vpn setup tr` (Türkçe), `vpn setup ru` (Rusça).

- **`start`**  
  Mevcut konteyneri başlatır.  
  **Örnek**: `vpn start`

- **`stop`**  
  Konteyneri durdurur.  
  **Örnek**: `vpn stop`

- **`restart`**  
  Konteyneri yeniden başlatır.  
  **Örnek**: `vpn restart`

- **`uninstall`**  
  Konteyneri, imgesini ve tüm ilişkili dosyaları tamamen kaldırır.  
  **Örnek**: `vpn uninstall`

- **`--help | -h`**  
  Kullanım bilgilerini görüntüler.  
  **Örnek**: `vpn --help`

---

## Örnek Çıktı

### Kurulum
```bash
vpn setup tr
```

**Çıktı:**
```
[BİLGİ] Docker başarıyla kuruldu!
[BİLGİ] Docker imgesini çekiliyor...
[BİLGİ] Shadowsocks konteynerini başlatılıyor...

Shadowsocks başarıyla yapılandırıldı!
=======================================
Sunucu IP:       203.0.113.42
Sunucu Bağlantı Noktası:     8388
Şifre:        randompassword123
Şifreleme:      aes-256-gcm
Saat Dilimi:        UTC+3
=======================================
```

### Kaldırma
```bash
vpn uninstall
```

**Çıktı:**
```
[BİLGİ] Shadowsocks konteynerini durduruluyor...
[BİLGİ] Shadowsocks konteynerini kaldırılıyor...
[BİLGİ] Docker imgesini kaldırılıyor...
[BAŞARILI] Shadowsocks konteynerı ve imgesi başarıyla kaldırıldı.
```

---

## Dosya Yapısı

Kurulumdan sonra:
- **`/opt/shadowsocks-installer`**: Ana komut dosyasını ve bağımlılıkları içeren kalıcı klasör.
- **`/usr/local/bin/vpn`**: Genel erişim için sembolik bağlantı.

---

## Bağımlılıklar

- **Docker**: Eksik ise otomatik olarak kurulur.
- **jq**: JSON ayrıştırma için kullanılır. Şunu kullanarak yükleyin:
  ```bash
  sudo apt install jq
  ```

---

## Lisans

**MIT Lisansı** altında lisanslanmıştır. Katkılar ve çatallamalar hoş karşılanır!