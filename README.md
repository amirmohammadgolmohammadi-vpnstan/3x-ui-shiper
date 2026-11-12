# 3x-ui Sanaei — Shiper

این نسخه برای Deploy با Dockerfile روی Shiper آماده شده است.

## Deploy

1. این پوشه را در ریشه یک GitHub repository قرار دهید.
2. در Shiper روی **Add Project** بزنید.
3. روش Deploy را **Dockerfile** انتخاب کنید.
4. در Advanced Settings:
   - Dockerfile: `Dockerfile`
   - Base path: ریشه repository
5. Deploy را بزنید.
6. اگر Shiper پورت برنامه را درخواست کرد، `2053` را به عنوان Target/HTTP Port قرار دهید.
7. بعد از Deploy، برای پروژه Domain ایجاد کنید.

## نسخه پنل

نسخه پیش‌فرض:

`XUI_VERSION=v3.9.0`

در صورت نیاز می‌توانید `XUI_VERSION` را در Build Arguments به نسخه دیگری از Releaseهای رسمی 3x-ui تغییر دهید.

## نگهداری اطلاعات

برای جلوگیری از از دست رفتن دیتابیس و تنظیمات هنگام recreate شدن کانتینر، در محیطی که Shiper اجازه Volume/Persistent Storage می‌دهد، مسیر زیر را به‌صورت persistent mount کنید:

`/etc/x-ui`

همچنین لاگ‌ها در:

`/var/log/x-ui`

قرار می‌گیرند.

## ساختار

```text
.
├── Dockerfile
└── README.md
```

این پروژه سورس کامل 3x-ui را داخل GitHub کپی نمی‌کند؛ Dockerfile در زمان Build، Release انتخاب‌شده را از GitHub رسمی mhsanaei/3x-ui دریافت می‌کند.
