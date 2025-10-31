# HTTPS Local Development Setup

Цей проект налаштовано для роботи з HTTPS на локальному домені `test-application`.

## Швидкий запуск

```bash
./bin/rails-https
```

## Ручне налаштування

### 1. Генерація SSL сертифікатів

```bash
mkdir -p config/ssl
openssl req -x509 -newkey rsa:4096 -keyout config/ssl/server.key -out config/ssl/server.crt -days 365 -nodes -subj "/C=UA/ST=Kyiv/L=Kyiv/O=Test/OU=Test/CN=test-application"
```

### 2. Налаштування custom домену

Додайте до `/etc/hosts`:

```bash
sudo sh -c 'echo "127.0.0.1 test-application" >> /etc/hosts'
```

### 3. Запуск з HTTPS

```bash
export HTTPS=true
export PORT=3000
bundle exec rails server
```

## Доступ до додатку

- **HTTPS URL**: https://test-application:3000
- **HTTP URL** (fallback): http://localhost:3000

## Важливі примітки

- При першому відвідуванні браузер покаже попередження про самопідписаний сертифікат
- Натисніть "Advanced" → "Proceed to test-application" для продовження
- Сертифікат дійсний протягом 365 днів

## Структура файлів

```
config/
├── ssl/
│   ├── server.key  # Приватний ключ
│   └── server.crt  # Сертифікат
└── puma.rb         # Конфігурація Puma з HTTPS
```

## Налагодження

Якщо виникають проблеми:

1. Перевірте, чи існують SSL сертифікати: `ls -la config/ssl/`
2. Перевірте `/etc/hosts`: `grep test-application /etc/hosts`
3. Перевірте, чи встановлена змінна `HTTPS=true`
4. Переконайтеся, що порт 3000 не зайнятий: `lsof -i :3000`
