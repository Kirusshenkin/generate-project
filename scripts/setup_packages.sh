#!/bin/bash

PACKAGES=$1
echo "Устанавливаем пакеты..."

install_package() {
    echo "Устанавливаем $1..."
    go get -u $1
}

# Разбираем выбранные пакеты
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

# Инициализация go.mod если его нет
if [ ! -f "go.mod" ]; then
    go mod init project
fi

# Обновление зависимостей
go mod tidy

echo "Пакеты успешно установлены!" 