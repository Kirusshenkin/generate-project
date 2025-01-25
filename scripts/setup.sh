#!/bin/bash

PROJECT_NAME=$1
echo "Добро пожаловать в настройку проекта '$PROJECT_NAME'!"

# Выбор архитектуры
echo "Выберите архитектуру проекта:"
echo "1. Монолит (Monolith)"
echo "2. MVC (Model-View-Controller)"
read -p "Введите номер архитектуры [1-2]: " ARCHITECTURE

case $ARCHITECTURE in
  1)
    echo "Выбрана архитектура: Монолит"
    bash scripts/setup_monolith.sh $PROJECT_NAME
    ;;
  2)
    echo "Выбрана архитектура: MVC"
    bash scripts/setup_mvc.sh $PROJECT_NAME
    ;;
  *)
    echo "Ошибка: Неверный выбор архитектуры."
    exit 1
    ;;
esac

# Выбор пакетов
echo "Какие пакеты вы хотите установить?"
echo "1. gin-gonic/gin (HTTP)"
echo "2. gorilla/mux (HTTP)"
echo "3. gorm.io/gorm (ORM)"
echo "4. golang-migrate/migrate (Миграции)"
echo "5. sirupsen/logrus (Логирование)"
echo "6. uber-go/zap (Логирование)"
echo "7. Все вышеперечисленные"
read -p "Введите номера через запятую: " PACKAGES

bash scripts/setup_packages.sh "$PACKAGES"

# Выбор инструментов
echo "Хотите добавить следующие инструменты? (y/n)"
read -p "Redis (Кэширование): " REDIS
read -p "Docker Compose (y/n): " DOCKER_COMPOSE

bash scripts/setup_docker.sh "$REDIS" "$DOCKER_COMPOSE"
bash scripts/setup_linter.sh

echo "Проект '$PROJECT_NAME' успешно настроен!" 