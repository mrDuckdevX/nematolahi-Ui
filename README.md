<div align="center">

# 🌌 پنل نعمت‌الهی | Nematolahi Panel

**قدرتمندترین پنل مدیریت پروتکل‌های VPN با تم دارک فضایی**

*Advanced Xray-core Control Panel — Cosmic Dark Edition*

[![Release](https://img.shields.io/github/v/release/mrDuckdevX/nematolahi-Ui?style=for-the-badge&color=a855f7)](https://github.com/mrDuckdevX/nematolahi-Ui/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/mrDuckdevX/nematolahi-Ui/release.yml?style=for-the-badge&color=06b6d4)](https://github.com/mrDuckdevX/nematolahi-Ui/actions)
[![Go Version](https://img.shields.io/badge/Go-1.24+-00ADD8?style=for-the-badge&logo=go&labelColor=0a0a12)](https://go.dev)
[![License](https://img.shields.io/badge/License-GPL--v3-red?style=for-the-badge&labelColor=0a0a12)](LICENSE)
[![Telegram](https://img.shields.io/badge/Telegram-Channel-2CA5E0?style=for-the-badge&logo=telegram&labelColor=0a0a12)](https://t.me/NematolahiPanel)

**فارسی** • [English](#english) • [中文](#chinese) • [Русский](#russian) • [Türkçe](#turkish) • [العربية](#arabic)

</div>

---

## ✨ ویژگی‌های منحصربه‌فرد این نسخه

<table>
<tr>
<td width="33%">

### 🌌 تم دارک فضایی
پوسته‌ای کاملاً بازطراحی‌شده با:
- پس‌زمینه کهکشانی گرادیانی
- رنگ اصلی بنفش فضایی `#8b5cf6`
- اکسنت‌های آبی فیروزه‌ای و قرمز نئونی
- انیمیشن‌های نرم و مدرن

</td>
<td width="33%">

### 🔐 سیستم لایسنس یکپارچه
امنیت سازمانی برای پنل شما:
- امضای دیجیتال HMAC-SHA256
- اعتبارسنجی HWID سرور
- تاریخ انقضای خودکار
- محافظت در برابر کپی غیرمجاز

</td>
<td width="33%">

### 📡 سابسکریپشن فیکس‌شده
بدون هیچ ایرادی کار می‌کند:
- پشتیبانی از تمام سرورها (IP/Domain)
- سازگار با Reverse Proxy
- پورت‌های دلخواه و Path سفارشی
- خروجی Clash / v2ray / Sing-box

</td>
</tr>
</table>

## 🚀 نصب سریع

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

یا از طریق Docker:

```bash
docker run -d \
  --name nematolahi-ui \
  --restart unless-stopped \
  --network host \
  -v nematolahi_db:/etc/nematolahi/db \
  ghcr.io/mrduckdevx/nematolahi-ui:latest
```

## 🎯 امکانات کلی پنل

| دسته‌بندی | امکانات |
|-----------|---------|
| **پروتکل‌ها** | VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, TUIC v5, MTProto |
| **ترانسپورت‌ها** | TCP, mKCP, WebSocket, gRPC, HTTPUpgrade, XHTTP + TLS/REALITY |
| **مدیریت کاربر** | محدودیت حجم، تاریخ انقضا، HWID، IP Limit، وضعیت آنلاین لحظه‌ای |
| **آمار ترافیک** | نمودارهای Real-time، گزارش روزانه، Export به CSV |
| **ربات‌ها** | Telegram Bot کامل، Discord Webhook، اعلان‌های هوشمند |
| **API** | RESTful با Token scoped، Swagger Docs داخلی |
| **ذخیره‌سازی** | SQLite (پیش‌فرض) یا PostgreSQL |
| **زبان‌ها** | ۱۳ زبان زنده دنیا با RTL کامل فارسی |

## 🛠️ دستورات مدیریت

```bash
nematolahi              # منوی اصلی مدیریت
nematolahi start        # اجرای پنل
nematolahi stop         # توقف پنل
nematolahi restart      # راه‌اندازی مجدد
nematolahi status       # بررسی وضعیت سرویس
nematolahi update       # آپدیت به آخرین نسخه
nematolahi uninstall    # حذف کامل
```

## 📸 گالری تصاویر

<details>
<summary>🖼️ نمایش اسکرین‌شات‌ها (تم فضایی)</summary>

| داشبورد | لیست اینباند | ساخت کانفیگ |
|:---:|:---:|:---:|
| ![Dashboard](media/cosmic-dashboard.png) | ![Inbounds](media/cosmic-inbounds.png) | ![Config](media/cosmic-config.png) |

| سابسکریپشن | تنظیمات پنل | لاگ ترافیک |
|:---:|:---:|:---:|
| ![Sub](media/cosmic-subscription.png) | ![Settings](media/cosmic-settings.png) | ![Logs](media/cosmic-logs.png) |

</details>

## 🔧 پیش‌نیازهای سیستم

- **سیستم‌عامل:** Ubuntu 20.04+ / Debian 11+ / CentOS 8+ / Alpine
- **رم:** حداقل ۵۱۲ مگابایت (توصیه: ۱ گیگابایت)
- **حافظه:** ۱ گیگابایت فضای خالی
- **دسترسی:** Root یا Sudo

## 📋 چک‌لیست نصب موفق

- [ ] پورت پیش‌فرض `2053` باز باشد (قابل تغییر)
- [ ] مسیر `/etc/nematolahi/` دسترسی نوشتن داشته باشد
- [ ] SSL Certificate معتبر برای دامنه تنظیم شده باشد
- [ ] نام کاربری و رمز عبور پیش‌فرض (`admin/admin`) عوض شود

## 🤝 مشارکت

ما همیشه از مشارکت توسعه‌دهندگان استقبال می‌کنیم! برای شروع:

1. این ریپو را Fork کنید
2. Branch جدید بسازید: `git checkout -b feature/CosmicEnhancement`
3. Commit کنید: `git commit -m '✨ Add amazing feature'`
4. Push کنید: `git push origin feature/CosmicEnhancement`
5. Pull Request باز کنید

## ⚖️ مجوز استفاده

این پروژه تحت مجوز **GPL v3** منتشر شده است. استفاده شخصی آزاد است، اما برای مقاصد تجاری باید لایسنس معتبر دریافت کنید.

## 🙏 تشکر ویژه

با احترام به تمام توسعه‌دهندگان جامعه متن‌باز که این مسیر را هموار کردند.

---

<a id="english"></a>

## 🌍 English Documentation

### Overview

**Nematolahi Panel** is a revolutionary fork of the original panel, completely redesigned with a stunning cosmic dark theme. It offers enterprise-grade features for managing VPN protocols with unprecedented elegance and performance.

### Key Highlights

- **Cosmic Dark UI**: Deep space aesthetics with purple (#8b5cf6), cyan (#22d3ee), and neon red accents
- **Integrated License System**: HMAC-SHA256 digital signatures with HWID validation
- **Fixed Subscription Engine**: Works flawlessly on any server configuration—IP, domain, reverse proxy, custom ports
- **Zero Core Changes**: All original functionality preserved; only the interface transformed

### Installation

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### Features Matrix

| Category | Capabilities |
|----------|--------------|
| Protocols | VLESS, VMess, Trojan, SS, WireGuard, Hysteria2, TUIC v5, MTProto |
| Transports | TCP, KCP, WS, gRPC, HTTPUpgrade, XHTTP with TLS/REALITY |
| User Management | Quotas, expiry dates, HWID limits, IP restrictions, live status |
| Analytics | Real-time charts, daily reports, CSV export |
| Bots | Full Telegram bot, Discord webhooks, smart notifications |
| API | RESTful with scoped tokens, built-in Swagger docs |

### System Requirements

- OS: Ubuntu 20.04+ / Debian 11+ / CentOS 8+
- RAM: 512MB minimum (1GB recommended)
- Storage: 1GB free space
- Access: Root or sudo privileges

### Support & Community

Join our Telegram channel for updates and support: [@NematolahiPanel](https://t.me/NematolahiPanel)

---

<a id="chinese"></a>

## 🇨🇳 中文说明

### 项目简介

**Nematolahi Panel** 是一款采用宇宙暗黑主题重新设计的强大面板，为VPN协议管理带来前所未有的视觉体验。

### 核心特性

- 🌌 **太空暗黑界面**：紫色、青色和霓虹红的渐变背景
- 🔐 **内置许可证系统**：HMAC-SHA256签名验证与硬件ID绑定
- 📡 **完美订阅引擎**：支持所有服务器配置（IP/域名/反向代理）
- ⚡ **零核心改动**：保留原有功能，仅优化界面

### 快速安装

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### 支持的协议

VLESS · VMess · Trojan · Shadowsocks · WireGuard · Hysteria2 · TUIC v5 · MTProto

### 联系方式

Telegram群组：[@NematolahiPanel](https://t.me/NematolahiPanel)

---

<a id="russian"></a>

## 🇷🇺 Документация на русском

### Описание

**Панель Nematolahi** — это революционный форк с космической тёмной темой, переработанный для максимального удобства и эстетики.

### Ключевые особенности

- 🌌 **Космический дизайн**: Градиенты фиолетового (#8b5cf6), бирюзового (#22d3ee) и неонового красного
- 🔐 **Система лицензий**: Цифровая подпись HMAC-SHA256 с привязкой к оборудованию
- 📡 **Исправленный субскрипшен**: Работает на любом сервере без исключений
- ⚡ **Сохранение ядра**: Все оригинальные функции работают как прежде

### Установка

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### Требования

ОС: Ubuntu 20.04+ / Debian 11+, ОЗУ: от 512 МБ, Доступ: root/sudo

---

<a id="turkish"></a>

## 🇹🇷 Türkçe Açıklama

### Genel Bakış

**Nematolahi Panel**, kozmik karanlık tema ile tamamen yeniden tasarlanmış gelişmiş bir yönetim panelidir.

### Öne Çıkan Özellikler

- 🌌 **Kozmik Karanlık Arayüz**: Mor (#8b5cf6), camgöbeği (#22d3ee) ve neon kırmızı vurgular
- 🔐 **Entegre Lisans Sistemi**: HMAC-SHA256 dijital imza ve HWID doğrulaması
- 📡 **Düzeltilmiş Abonelik Motoru**: Her sunucu yapılandırmasında sorunsuz çalışır
- ⚡ **Çekirdek Korundu**: Tüm orijinal işlevler bozulmadan kaldı

### Kurulum

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### Sistem Gereksinimleri

İşletim Sistemi: Ubuntu 20.04+ / Debian 11+, RAM: En az 512MB, Erişim: Root/Sudo

---

<a id="arabic"></a>

## 🇸🇦 الوثيقة العربية

### نظرة عامة

**لوحة نعمت اللهی** هي لوحة تحكم متقدمة معاد تصميمها بالكامل بثيم كوني داكن مذهل لإدارة بروتوكولات VPN بأناقة غير مسبوقة.

### الميزات الرئيسية

- 🌌 **ثيم كوني داكن**: خلفية مجرية بتدرجات البنفسجي (#8b5cf6) والأزرق السماوي (#22d3ee) والأحمر النيون
- 🔐 **نظام الترخيص المدمج**: توقيع رقمي HMAC-SHA256 مع التحقق من معرف الأجهزة
- 📡 **محرك الاشتراك المُصلح**: يعمل بسلاسة على أي خادم (IP/دومين/عكسي الوكيل)
- ⚡ **النواة الأصلية محفوظة**: جميع الوظائف تعمل دون تغيير

### التثبيت السريع

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### البروتوكولات المدعومة

VLESS · VMess · Trojan · Shadowsocks · WireGuard · Hysteria2 · TUIC v5 · MTProto

---

<div align="center">

**Made with 💜 by Nematolahi Team**

© 2026 Nematolahi Panel — GPL v3 Licensed

[Report Bug](https://github.com/mrDuckdevX/nematolahi-Ui/issues) · [Request Feature](https://github.com/mrDuckdevX/nematolahi-Ui/issues/new) · [Telegram Channel](https://t.me/NematolahiPanel)

</div>
