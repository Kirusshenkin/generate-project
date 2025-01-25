#!/bin/bash

# Установка языка / Language selection
echo "🌍 Choose language / Выберите язык:"
echo "1. 🇬🇧 English"
echo "2. 🇷🇺 Русский"
read -p "Enter your choice / Введите ваш выбор [1-2]: " LANGUAGE

if [ "$LANGUAGE" == "2" ]; then
    # Russian language strings
    TEXT_WELCOME="👋 Добро пожаловать в настройку проекта на Go!"
    TEXT_PROJECT_NAME="📝 Введите имя вашего проекта (по умолчанию: my-app): "
    TEXT_ARCHITECTURE="🏗️  Выберите архитектуру проекта:"
    TEXT_MONOLITH="1. 🏰 Монолит (Monolith)"
    TEXT_MVC="2. 🎯 MVC (Model-View-Controller)"
    TEXT_PACKAGES="📦 Какие пакеты вы хотите установить?"
    TEXT_PACKAGES_HTTP="🌐 HTTP фреймворки:"
    TEXT_PACKAGES_DB="💾 Работа с базой данных:"
    TEXT_PACKAGES_LOGGING="📝 Логирование:"
    TEXT_TOOLS="🛠️  Хотите добавить следующие инструменты? (y/n)"
    TEXT_REDIS="📊 Redis (Кэширование): "
    TEXT_DOCKER="🐳 Docker и Docker Compose: "
    TEXT_FINISH="✨ Проект успешно настроен!"
    TEXT_ERROR_ARCH="❌ Ошибка: Неверный выбор архитектуры."
    TEXT_CHECKING_DEPS="🔍 Проверка зависимостей..."
else
    # English language strings
    TEXT_WELCOME="👋 Welcome to the Go project setup!"
    TEXT_PROJECT_NAME="📝 Enter your project name (default: my-app): "
    TEXT_ARCHITECTURE="🏗️  Choose project architecture:"
    TEXT_MONOLITH="1. 🏰 Monolith"
    TEXT_MVC="2. 🎯 MVC (Model-View-Controller)"
    TEXT_PACKAGES="📦 Which packages would you like to install?"
    TEXT_PACKAGES_HTTP="🌐 HTTP frameworks:"
    TEXT_PACKAGES_DB="💾 Database tools:"
    TEXT_PACKAGES_LOGGING="📝 Logging:"
    TEXT_TOOLS="🛠️  Do you want to add the following tools? (y/n)"
    TEXT_REDIS="📊 Redis (Caching): "
    TEXT_DOCKER="🐳 Docker and Docker Compose: "
    TEXT_FINISH="✨ Project successfully configured!"
    TEXT_ERROR_ARCH="❌ Error: Invalid architecture choice."
    TEXT_CHECKING_DEPS="🔍 Checking dependencies..."
fi

echo "$TEXT_WELCOME"

# Проверка зависимостей
echo "$TEXT_CHECKING_DEPS"
source scripts/check_dependencies.sh

# Project name input
read -p "$TEXT_PROJECT_NAME" PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-my-app}

# Architecture selection
echo "$TEXT_ARCHITECTURE"
echo "$TEXT_MONOLITH"
echo "$TEXT_MVC"
read -p "Enter your choice [1-2]: " ARCHITECTURE

# Package selection
echo "$TEXT_PACKAGES"
echo "$TEXT_PACKAGES_HTTP"
echo "1. 🚀 gin-gonic/gin"
echo "2. 🛣️  gorilla/mux"
echo "$TEXT_PACKAGES_DB"
echo "3. 🗄️  gorm.io/gorm (ORM)"
echo "4. 🔄 golang-migrate/migrate (Migrations)"
echo "$TEXT_PACKAGES_LOGGING"
echo "5. 📋 sirupsen/logrus"
echo "6. ⚡ uber-go/zap"
echo "7. 🎁 All of the above"
read -p "Enter numbers (comma-separated): " PACKAGES

# Tools selection
echo "$TEXT_TOOLS"
read -p "$TEXT_REDIS" REDIS
read -p "$TEXT_DOCKER" DOCKER

# Project generation
echo "🚀 Setting up project '$PROJECT_NAME'..."

case $ARCHITECTURE in
    1)
        bash scripts/setup_monolith.sh "$PROJECT_NAME"
        ;;
    2)
        bash scripts/setup_mvc.sh "$PROJECT_NAME"
        ;;
    *)
        echo "$TEXT_ERROR_ARCH"
        exit 1
        ;;
esac

# Install selected packages
bash scripts/setup_packages.sh "$PACKAGES"

# Setup Docker if selected
bash scripts/setup_docker.sh "$REDIS" "$DOCKER"

# Setup linter
bash scripts/setup_linter.sh

echo "$TEXT_FINISH"