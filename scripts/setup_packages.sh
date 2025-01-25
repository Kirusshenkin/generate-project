#!/bin/bash

PACKAGES=$1
CURRENT_DIR="$2"
PROJECT_NAME=$(basename "$CURRENT_DIR")

echo "📦 Инициализация Go модуля..."

if [ ! -f "go.mod" ]; then
    MODULE_PATH="$(basename "$(pwd)")"
    
    if [[ ! "$MODULE_PATH" =~ ^[a-zA-Z][-a-zA-Z0-9]*$ ]]; then
        MODULE_PATH="go-project"
    fi
    
    echo "🔧 Создание go.mod для модуля: $MODULE_PATH"
    go mod init "$MODULE_PATH"
else
    echo "📝 Файл go.mod уже существует, обновляем..."
    OLD_MODULE=$(grep "^module" go.mod | cut -d' ' -f2)
    if [ "$OLD_MODULE" != "$PROJECT_NAME" ]; then
        echo "🔄 Обновление имени модуля с $OLD_MODULE на $PROJECT_NAME"
        sed -i '' "s|module $OLD_MODULE|module $PROJECT_NAME|" go.mod
    fi
fi

echo "📦 Установка пакетов..."

install_package() {
    echo "⬇️  Установка $1..."
    go get -u "$1"
}

IFS=',' read -ra SELECTED_PACKAGES <<< "$PACKAGES"
for pkg in "${SELECTED_PACKAGES[@]}"; do
    case $pkg in
        1|7)
            install_package "github.com/gin-gonic/gin"
            ;;
        2|7)
            install_package "github.com/gorilla/mux"
            ;;
        3|7)
            install_package "gorm.io/gorm"
            install_package "gorm.io/driver/postgres"
            ;;
        4|7)
            go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
            ;;
        5|7)
            install_package "github.com/sirupsen/logrus"
            ;;
        6|7)
            install_package "go.uber.org/zap"
            ;;
    esac
done

echo "🔄 Обновление зависимостей..."
go mod tidy

echo "✨ Пакеты успешно установлены!" 