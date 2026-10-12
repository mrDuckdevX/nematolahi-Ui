<div align="center">

# 🌌 پنل نعمت‌الهی | Nematolahi Panel

**پنل حرفه‌ای مدیریت پروتکل‌های VPN — نسخه دارک فضایی**

*Advanced Xray-core Control Panel — Cosmic Dark Edition*

[![Release](https://img.shields.io/github/v/release/mrDuckdevX/nematolahi-Ui?style=for-the-badge&color=a855f7)](https://github.com/mrDuckdevX/nematolahi-Ui/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/mrDuckdevX/nematolahi-Ui/release.yml?style=for-the-badge&color=06b6d4)](https://github.com/mrDuckdevX/nematolahi-Ui/actions)
[![Go Version](https://img.shields.io/badge/Go-1.24+-00ADD8?style=for-the-badge&logo=go&labelColor=0a0a12)](https://go.dev)
[![React](https://img.shields.io/badge/React-19-61dafb?style=for-the-badge&logo=react&labelColor=0a0a12)](https://react.dev)
[![Xray-core](https://img.shields.io/badge/Xray--core-Latest-red?style=for-the-badge&labelColor=0a0a12)](https://github.com/XTLS/Xray-core)
[![License](https://img.shields.io/badge/License-GPL--v3-red?style=for-the-badge&labelColor=0a0a12)](LICENSE)
[![Telegram](https://img.shields.io/badge/Telegram-Channel-2CA5E0?style=for-the-badge&logo=telegram&labelColor=0a0a12)](https://t.me/NematolahiPanel)

**فارسی** • [English](#-english-documentation) • [中文](#-中文文档) • [Русский](#--русская-документация) • [Türkçe](#-türkçe-dokümantasyon) • [العربية](#-الوثيقة-العربية)

</div>

---

<details open>
<summary>📑 <b>فهرست مطالب / Table of Contents</b></summary>

- [معرفی پنل نعمت‌الهی](#-معرفی-پنل-نعمتالهی)
- [معماری فنی سیستم](#-معماری-فنی-سیستم)
- [پروتکل‌ها و قابلیت‌های ترافیک](#-پروتکلها-و-قابلیتهای-ترافیک)
- [تم دارک فضایی (UI/UX)](#-تم-دارک-فضایی-uiux)
- [سیستم لایسنس](#-سیستم-لایسنس)
- [موتور سابسکریپشن](#-موتور-سابسکریپشن)
- [نصب سریع](#-نصب-سریع)
- [راهنمای پیکربندی پیشرفته](#-راهنمای-پیکربندی-پیشرفته)
- [دستورات مدیریت CLI](#-دستورات-مدیریت-cli)
- [بهینه‌سازی سرور و Kernel Tuning](#-بهینهسازی-سرور-و-kernel-tuning)
- [عیب‌یابی](#-عیبیابی)
- [مشارکت](#-مشارکت)

</details>

---

## 🌌 معرفی پنل نعمت‌الهی

**پنل نعمت‌الهی** یک کنترل‌پنل تمام‌عیار، امن و مدرن برای مدیریت زیرساخت‌های VPN مبتنی بر هسته **Xray-core** است. این نسخه با بازطراحی کامل رابط کاربری، تم **دارک فضایی** (بنفش/آبی/قرمز نئونی)، **سیستم لایسنس یکپارچه** و **موتور سابسکریپشن اصلاح‌شده** ارائه می‌شود که روی هر نوع سروری (IP مستقیم، دامنه، Reverse Proxy، CDN) بدون هیچ ایرادی کار می‌کند.

### چرا پنل نعمت‌الهی؟

| ویژگی | توضیح تخصصی |
|---|---|
| 🎨 **رابط کاربری نسل جدید** | React 19 + Ant Design + TypeScript با پوسته کاملاً اختصاصی دارک فضایی — بدون هیچ اثری از پنل‌های قبلی |
| 🔐 **امنیت چندلایه** | احراز هویت دو مرحله‌ای (TOTP)، کوکی‌های HttpOnly + Secure، محافظت CSRF، محدودسازی نرخ ورودی (Rate Limiting) |
| ⚡ **عملکرد بالا** | Backend گو (Gin) + SQLite WAL؛ مدیریت هم‌زمان هزاران کاربر با مصرف RAM زیر ۱۵۰ مگابایت |
| 📡 **سابسکریپشن جهانی** | تولید لینک اشتراک سازگار با V2RayNG، Streisand، Happ، Shadowrocket، Clash.Meta و Sing-box روی هر سرور/پورت/مسیر |
| 🧾 **لاگ‌های تفکیکی** | ثبت ترافیک هر inbound و هر client به‌صورت مستقل با نمودارهای Real-time |
| 🌍 **چندزبانه** | فارسی، انگلیسی، چینی، روسی، ترکی، عربی و ... با RTL کامل برای فارسی |
| 🔑 **سیستم لایسنس** | امضای HMAC-SHA256 + قفل روی HWID سرور + تاریخ انقضا — مناسب سرویس‌دهندگان تجاری |

---

## 🏗️ معماری فنی سیستم

```
┌─────────────────────────────────────────────────────────────┐
│                     Nematolahi Panel                        │
├──────────────────┬──────────────────┬───────────────────────┤
│   Frontend SPA   │    Web Server    │      Core Engine      │
│  React 19 + TS   │   Go 1.24 (Gin)  │     Xray-core         │
│  Ant Design      │  JWT + TOTP Auth │  (API gRPC inbounds)  │
│  Cosmic Dark UI  │  Rate Limiter    │  Multiplexing / TLS   │
├──────────────────┴──────────────────┴───────────────────────┤
│        SQLite (WAL mode)  ·  Goroutine Scheduler            │
│        Config Manager     ·  Traffic Counter                │
│        License Verifier   ·  Subscription Renderer          │
└─────────────────────────────────────────────────────────────┘
```

| لایه | فناوری | نقش |
|---|---|---|
| **Presentation** | React 19, TypeScript, Ant Design, Vite | رندر UI دارک فضایی، Chart زنده، Command Palette |
| **Application** | Go + Gin Framework | REST API، احراز هویت، مدیریت کاربران و اینباوندها |
| **Domain** | Xray-core (gRPC Handler) | ایجاد/ویرایش/حذف داینامیک inbound و client بدون ری‌استارت |
| **Persistence** | SQLite (WAL) | ذخیره تنظیمات، کاربران، لاگ ترافیک و وضعیت لایسنس |
| **Security** | HMAC-SHA256, TOTP/RFC-6238, bcrypt | لایسنس، 2FA، هش پسورد |

---

## 📶 پروتکل‌ها و قابلیت‌های ترافیک

### پروتکل‌های پشتیبانی‌شده

| پروتکل | Transport | TLS | امنیت افزوده |
|---|---|---|---|
| **VLESS** | TCP / WS / gRPC / H2 / HTTPUpgrade | REALITY ✅ / TLS | Flow Control (xtls-rprx-vision) |
| **VMess** | TCP / WS / gRPC / H2 | TLS | Aead Signature |
| **Trojan** | TCP / WS / gRPC / H2 | TLS / REALITY | Native obfs |
| **WireGuard** | UDP | Noise Protocol | Kernel & Userspace Mode |
| **Hysteria2** | QUIC/UDP | TLS 1.3 | Bandwidth Control |
| **TUIC v5** | TCP/UDP | TLS 1.3 | Multiplexing |
| **ShadowSocks** | TCP/UDP | TLS | 2023 Batch Mode |
| **AnyTLS** | TCP | TLS | OpenVPN-compatible |

### قابلیت‌های ترافیکی
- 🔄 **Balance & Failover**: چند outbound با اولویت و Health Check خودکار
- 🧩 **فرگمنتیشن (Fragment)**: تکه‌تکه کردن پکت‌ها برای عبور از DPI
- 🕳️ **Mux & Reality**: جعل handshake برای شناسایی‌ناپذیری کامل
- 📊 **Limit User**: سقف ترافیک روزانه/هفتگی/ماهانه + IP Limit + Expires
- 🌐 **DNS هوشمند**: Route per-domain با Box/Dns configs

---

## 🎨 تم دارک فضایی (UI/UX)

رابط کاربری این نسخه **کاملاً بازطراحی** شده و هیچ شباهتی به پوسته‌های رایج ندارد:

```css
/* پالت رنگ رسمی پنل نعمت‌الهی */
--primary:   #8b5cf6;  /* بنفش فضایی */
--accent:    #ef4444;  /* قرمز نئونی */
--info:      #22d3ee;  /* آبی فیروزه‌ای */
--success:   #10b981;  /* سبز کهکشانی */
--bg-base:   #07070f;  /* مشکی عمیق */
--bg-ultra:  #020207;  /* سیاه کیهانی */
--surface:   #0e0e1d;  /* سطح کارت‌ها */
```

- 🌠 پس‌زمینه گرادیان رادیالی سه‌لایه (کهکشانی) روی تمام صفحات
- ✨ انیمیشن‌های نرم hover/transition و Micro-interactions
- 🧭 Sidebar مدرن با Active State بنفش و Command Palette (`Ctrl+K`)
- 📱 Fully Responsive — تجربه یکسان در موبایل و دسکتاپ
- 🌙 حالت Ultra-Dark برای مصرف بهینه OLED

---

## 🔐 سیستم لایسنس

پنل نعمت‌الهی دارای موتور لایسنس بومی است:

```
LicenseKey = Base64( payload || HMAC-SHA256(payload, SECRET) )
payload    = { owner, hwid, expires_at, tier }
```

| مرحله | توضیح |
|---|---|
| 1️⃣ صدور | ادمین Superadmin، HWID سرور را از پنل می‌گیرد و کلید صادر می‌کند |
| 2️⃣ فعال‌سازی | کلید در تنظیمات وارد → امضا و HWID و تاریخ انقضا اعتبارسنجی می‌شود |
| 3️⃣ نگهداری | بررسی دوره‌ای معتبر بودن لایسنس در Runtime |
| 4️⃣ انقضا | اعلان در UI + مسدودسازی قابلیت‌های Tier بالاتر (هسته پنل همچنان کار می‌کند) |

✅ رمزنگاری HMAC-SHA256 — ❌ بدون Contact با سرور خارجی — کاملاً Offline

---

## 📡 موتور سابسکریپشن

بخش سابسکریپشن **کاملاً فیکس و بازنویسی** شده تا روی هر توپولوژی سروری بدون خطا کار کند:

| سناریو | پشتیبانی |
|---|---|
| IP مستقیم + پورت دلخواه | ✅ `http://IP:PORT/sub?token=...` |
| دامنه + TLS | ✅ `https://domain.com/sub?token=...` |
| Reverse Proxy (Nginx/Caddy/Traefik) | ✅ تشخیص خودکار `X-Forwarded-*` |
| Cloudflare CDN | ✅ سازگار با Path-based routing |
| SubPath سفارشی | ✅ قابل تغییر از تنظیمات پنل |

**خروجی‌ها:** لینک‌های VLESS/VMess/Trojan/SS/WG/Hy2 + صفحه اشتراک HTML سفارشی + QR Code + آپدیت خودکار اپ‌ها (Streisand/V2RayNG/Happ) + Template شخصی‌سازی‌شده Clash.Meta و Sing-box.

---

## 🚀 نصب سریع

### روش ۱ — اسکریپت رسمی (توصیه می‌شود)

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

### روش ۲ — Docker Compose

```yaml
services:
  nematolahi:
    image: ghcr.io/mrduckdevx/nematolahi:latest
    container_name: nematolahi-panel
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/nematolahi:/var/lib/nematolahi
```

```bash
docker compose up -d
```

### روش ۳ — بیلد دستی (بر توسعه‌دهنده‌ها)

```bash
git clone https://github.com/mrDuckdevX/nematolahi-Ui && cd nematolahi-Ui
cd sub && npm ci && npm run build && cd ..       # موتور سابسکریپشن
cd internal/web && npm ci && npm run build && cd ../../..  # فرانت‌اند پنل
CGO_ENABLED=1 go build -ldflags="-w -s" -o nematolahi main.go
sudo ./nematolahi
```

> 🔒 بعد از اولین اجرا، حتماً از مسیر `/login` وارد شوید و نام کاربری/رمز عبور پیش‌فرض را عوض کنید.

---

## 🛠️ راهنمای پیکربندی پیشرفته

### 1. HTTPS واقعی با Reverse Proxy (Caddy نمونه)

```caddyfile
panel.example.com {
    reverse_proxy localhost:2053
}
```

### 2. فعال‌سازی REALITY (پیشرفته)

در صفحه **Inbounds → Add → VLESS → Security: reality**:
- `public_key` را از خروجی `xray x25519` وارد کنید
- Handshake را روی یک سایت معتبر واقعی تنظیم کنید (Handshake SNI)
- Flow را روی `xtls-rprx-vision` قرار دهید

### 3. تنظیمات بهینه در `config.json`

```json
{
  "api": { "tag": "nematolahi-api" },
  "policy": { "levels": { "0": { "handshake": 4, "connIdle": 300 } } },
  "stats": {},
  "routing": { "domainStrategy": "AsIs" }
}
```

---

## 💻 دستورات مدیریت CLI

پس از نصب، دستور `nematolahi` در دسترس است:

```
nematolahi              ← منوی اصلی مدیریتی
nematolahi start        ← اجرای پنل
nematolahi stop         ← توقف
nematolahi restart      ← راه‌اندازی مجدد
nematolahi status       ← وضعیت سرویس systemd
nematolahi log          ← مشاهده لاگ زنده
nematolahi setting      ← تغییر پورت / مسیر وب / محدودسازی IP
nematolahi bbr          ← فعال‌سازی BBR + Kernel Tuning
nematolahi update       ← بروزرسانی پنل
nematolahi uninstall    ← حذف کامل
```

---

## ⚙️ بهینه‌سازی سرور و Kernel Tuning

برای عملکرد حداکثری روی سرورهای VIP/VPS:

```bash
cat <<'EOF' >> /etc/sysctl.conf
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
net.core.rmem_max=26214400
net.core.wmem_max=26214400
net.ipv4.tcp_rmem=4096 87380 67108864
net.ipv4.tcp_wmem=4096 65536 67108864
net.ipv4.tcp_fastopen=3
net.core.somaxconn=4096
fs.file-max=2097152
EOF
sysctl -p
ulimit -n 1048576
```

| پارامتر | مقدار توصیه‌شده | دلیل |
|---|---|---|
| CPU | 2 Core+ | پردازش TLS و Multiplexing |
| RAM | 1 GB+ | هر 1000 کانکشن ≈ 80MB |
| Network | 1 Gbps+ | Throughput بالای QUIC/gRPC |
| OS | Ubuntu 22/24, Debian 12, Alma 9 | پشتیبانی رسمی |

---

## 🩺 عیب‌یابی

| مشکل | راه‌حل تخصصی |
|---|---|
| لینک سابسکریپشن باز نمی‌شود | مسیر Sub را با `nematolahi setting` بررسی کنید؛ در Reverse Proxy، `proxy_set_header Host $host;` الزامی است |
| QR در اپ خوانده نمی‌شود | طول URL بیشتر از حد مجاز QR است → از Sub Page استفاده کنید یا تعداد لینک را کم کنید |
| پنل باز نمی‌شود | `nematolahi log` را ببینید؛ پورت با `ss -ltnp` چک شود؛ SELinux/AppArmor را بررسی کنید |
| ترافیک شمرده نمی‌شود | در تنظیمات پنل «Statistics Collection» را روشن کنید |
| خطای REALITY handshake | نسخه Xray را آپدیت کنید؛ SNI باید TLS1.3 + H2 ساپورت کند |
| HWID لایسنس عوض شد | روی VPS اسلات‌محور ممکن است MAC عوض شود → لایسنس را مجدداً فعال کنید |

---

## 🤝 مشارکت

PRها پذیرفته می‌شوند! برای تغییرات بزرگ، ابتدا Issue باز کنید.

```bash
git checkout -b feature/amazing-feature
npm run lint && go vet ./...
git commit -m 'feat: add amazing feature'
git push origin feature/amazing-feature
```

---

## ⚖️ مجوز استفاده

این پروژه تحت مجوز **GPL-3.0** منتشر شده است. استفاده تجاری با حفظ لایسنس آزاد است؛ فروش پنل قفل‌شده با لایسنس داخلی پنل انجام می‌شود.

## 🙏 سپاس

از جامعه متن‌باز ایران و جهان برای توسعه زیرساخت‌های آزادی اینترنت متشکریم.

<div align="center">

**Made with 💜 by Nematolahi Team**

[Telegram](https://t.me/NematolahiPanel) • [Report Bug](https://github.com/mrDuckdevX/nematolahi-Ui/issues) • [Request Feature](https://github.com/mrDuckdevX/nematolahi-Ui/issues/new)

</div>

---
---

# 🇬🇧 English Documentation

## Overview

**Nematolahi Panel** is a fully-rebranded, production-grade control panel for Xray-core based VPN infrastructure. This edition ships with an exclusive **Cosmic Dark UI**, a native **License System**, and a **rewritten Subscription Engine** that works flawlessly on any server topology — direct IP, domain, reverse proxy, or CDN.

## Technical Architecture

| Layer | Technology | Responsibility |
|---|---|---|
| Presentation | React 19 · TypeScript · Ant Design · Vite | Cosmic dark theme, live charts, command palette |
| Application | Go 1.24 · Gin | REST API, JWT + TOTP auth, rate limiting |
| Domain | Xray-core (gRPC handlers) | Hot-add/remove inbounds & clients without restart |
| Persistence | SQLite (WAL mode) | Settings, users, traffic logs, license state |
| Security | HMAC-SHA256 · RFC-6238 · bcrypt | Licensing, 2FA, password hashing |

## Supported Protocols

**VLESS** (TCP/WS/gRPC/H2/HTTPUpgrade + **REALITY** + xtls-rprx-vision) · **VMess** · **Trojan** · **WireGuard** · **Hysteria2** · **TUIC v5** · **ShadowSocks (2023 batch)** · **AnyTLS** — with Fragment, Mux, Balance/Failover health-checks, DNS routing and per-user traffic/IP/expiry limits.

## Cosmic Dark Theme

```css
--primary: #8b5cf6; --accent: #ef4444; --info: #22d3ee;
--bg-base: #07070f; --bg-ultra: #020207; --surface: #0e0e1d;
```

Tri-layer galactic radial gradient background across all pages, neon purple/cyan/red accents, smooth micro-interactions, OLED-friendly ultra-dark mode, full RTL support, `Ctrl+K` command palette.

## License System

`LicenseKey = Base64(payload ‖ HMAC-SHA256(payload, SECRET))` where payload carries `owner`, `hwid`, `expires_at`, `tier`. Fully offline verification: signature check → HWID binding → expiry window. No external calls.

## Subscription Engine (Fixed)

Auto-detects the correct public URL from `X-Forwarded-Host/Proto` behind Nginx/Caddy/Traefik, honors custom SubPath and non-standard ports, and renders outputs compatible with **V2RayNG, Streisand, Happ, Shadowrocket, Clash.Meta, Sing-box** plus HTML subscription page with QR codes and auto-update headers.

## Installation

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

Docker:

```bash
docker run -d --name nematolahi --network host --restart unless-stopped \
  -v /etc/nematolahi:/var/lib/nematolahi ghcr.io/mrduckdevx/nematolahi:latest
```

Requirements: Ubuntu 22+/Debian 12+/Alma 9, 1 vCPU, 1GB RAM, SELinux disabled or configured.

## Troubleshooting Highlights

- Subscription link broken behind proxy → ensure `proxy_set_header Host $host;`
- Panel unreachable → `nematolahi log`, verify port via `ss -ltnp`
- REALITY handshake error → upgrade Xray, target site must support TLS1.3+H2

## License

Released under **GPL-3.0**. Made with 💜 by the Nematolahi Team.

---
---

# 🇨🇳 中文文档

## 项目简介

**Nematolahi Panel（尼马塔拉希面板）** 是基于 Xray-core 的新一代企业级 VPN 管理面板，采用全新设计的 **宇宙深色主题**（紫/青/红霓虹配色），内置 **本地化许可证系统** 与 **重写后的订阅引擎**，可在任意服务器拓扑（直连 IP、域名、反向代理、CDN）下无故障运行。

## 技术架构

| 层级 | 技术栈 | 职责 |
|---|---|---|
| 表现层 | React 19 · TypeScript · Ant Design | 深色宇宙 UI、实时流量图表 |
| 应用层 | Go 1.24 · Gin | REST API、JWT + TOTP 双因素认证 |
| 领域层 | Xray-core gRPC | 热增删入站与用户，无需重启 |
| 持久层 | SQLite (WAL) | 配置、用户、流量日志、许可证状态 |

## 支持的协议

VLESS（含 **REALITY** 与 xtls-rprx-vision）、VMess、Trojan、WireGuard、Hysteria2、TUIC v5、ShadowSocks 2023、AnyTLS；支持碎片化（Fragment）、多路复用、负载均衡与健康检查、按用户限速/限流量/限到期。

## 快速安装

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

系统要求：Ubuntu 22+ / Debian 12+ / Alma 9，内存 ≥1GB。许可证采用 HMAC-SHA256 离线验签并绑定服务器 HWID，无需外联。

## 许可协议

本项目基于 **GPL-3.0** 开源发布。

---
---

# 🇷🇺 Русская Документация

## Обзор

**Nematolahi Panel** — профессиональная панель управления на базе Xray-core с полностью переработанным **космическим тёмным интерфейсом** (фиолетовый/циан/красный), встроенной **системой лицензирования** и **исправленным подписным движком**, который корректно работает на любом сервере: прямой IP, домен, reverse-proxy, CDN.

## Архитектура

| Слой | Технология | Назначение |
|---|---|---|
| UI | React 19 · TypeScript · Ant Design | Тёмная космическая тема, live-графики |
| API | Go 1.24 · Gin | JWT + TOTP, rate-limiting |
| Ядро | Xray-core (gRPC) | Горячее добавление инбаундов без перезапуска |
| Хранилище | SQLite (WAL) | Настройки, логи трафика, лицензии |

## Протоколы

VLESS (**REALITY**, xtls-rprx-vision), VMess, Trojan, WireGuard, Hysteria2, TUIC v5, ShadowSocks 2023, AnyTLS — фрагментация, мультиплексирование, балансировка и health-check выходов.

## Установка

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

Требования: Ubuntu 22+/Debian 12+, ОЗУ от 1 ГБ. Лицензии проверяются офлайн через HMAC-SHA256 + привязка к HWID сервера.

## Подписка (исправлено)

Автоматическое определение публичного URL через `X-Forwarded-Host/Proto`, поддержка нестандартных портов и SubPath, вывод для V2RayNG, Streisand, Happ, Clash.Meta, Sing-box.

## Лицензия

Проект распространяется под **GPL-3.0**.

---
---

# 🇹🇷 Türkçe Dokümantasyon

## Genel Bakış

**Nematolahi Panel**, Xray-core tabanlı VPN altyapıları için tamamen yeniden tasarlanmış **kozmik koyu arayüz** (mor/camgöbeği/kırmızı neon), yerleşik **lisans sistemi** ve her sunucu topolojisinde (direkt IP, alan adı, reverse proxy, CDN) sorunsuz çalışan **yeniden yazılmış abonelik motoru** ile sunulan kurumsal seviyede bir yönetim panelidir.

## Teknik Mimari

| Katman | Teknoloji | Görev |
|---|---|---|
| Arayüz | React 19 · TypeScript · Ant Design | Kozmik koyu tema, canlı grafikler |
| Uygulama | Go 1.24 · Gin | JWT + TOTP doğrulama, hız sınırlama |
| Çekirdek | Xray-core (gRPC) | Kesintisiz inbound/client yönetimi |
| Depolama | SQLite (WAL) | Ayarlar, trafik günlükleri, lisans durumu |

## Desteklenen Protokoller

VLESS (**REALITY** + xtls-rprx-vision), VMess, Trojan, WireGuard, Hysteria2, TUIC v5, ShadowSocks 2023, AnyTLS — Fragment, Mux, yük dengeleme ve sağlık kontrolleri.

## Kurulum

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

Gereksinimler: Ubuntu 22+/Debian 12+, en az 1 GB RAM. Lisans doğrulaması tamamen çevrimdışıdır: HMAC-SHA256 imza + sunucu HWID kilidi + son kullanma tarihi.

## Abonelik Motoru (Düzeltildi)

`X-Forwarded-Host/Proto` üzerinden otomatik public URL algılama, özel SubPath ve port desteği; V2RayNG, Streisand, Happ, Clash.Meta ve Sing-box uyumlu çıktı.

## Lisans

Bu proje **GPL-3.0** altında yayınlanmıştır.

---
---

# 🇸🇦 الوثيقة العربية

## نظرة عامة

**لوحة نعمت‌الإلهي (Nematolahi Panel)** هي لوحة تحكم احترافية لإدارة بنية VPN قائمة على نواة Xray-core، بتصميم **داكن كوني** جديد كليًا (ألوان بنفسجي/سماوي/أحمر نيون)، مع **نظام تراخيص مدمج** و**محرك اشتراكات مُعاد كتابته** يعمل بسلاسة على أي طوبولوجيا للخادم: IP مباشر، دومين، Reverse Proxy أو CDN.

## البنية التقنية

| الطبقة | التقنية | الوظيفة |
|---|---|---|
| الواجهة | React 19 · TypeScript · Ant Design | الثيم الكوني الداكن ورسوم بيانية حية |
| التطبيق | Go 1.24 · Gin | مصادقة JWT + TOTP وتحديد المعدل |
| النواة | Xray-core (gRPC) | إضافة وإزالة المنافذ دون إعادة تشغيل |
| التخزين | SQLite (WAL) | الإعدادات وسجلات المرور وحالة الترخيص |

## البروتوكولات المدعومة

VLESS (بما فيها **REALITY** و xtls-rprx-vision) · VMess · Trojan · WireGuard · Hysteria2 · TUIC v5 · ShadowSocks 2023 · AnyTLS — مع دعم Fragment وMux وتوزيع الأحمال وفحص الصحة.

## التثبيت السريع

```bash
bash <(curl -L https://raw.githubusercontent.com/mrDuckdevX/nematolahi-Ui/main/nematolahi-ui.sh)
```

المتطلبات: Ubuntu 22+ / Debian 12+ وذاكرة لا تقل عن 1 جيجابايت. التحقق من الترخيص يتم دون اتصال خارجي عبر HMAC-SHA256 وربط بمعرّف العتاد (HWID).

## محرك الاشتراكات (تم إصلاحه)

كشف تلقائي للرابط العام عبر ترويسات `X-Forwarded-Host/Proto`، ودعم المسارات والمنافذ المخصصة، ومخرجات متوافقة مع V2RayNG وStreisand وHapp وClash.Meta وSing-box.

## الرخصة

هذا المشروع منشور تحت رخصة **GPL-3.0**.
