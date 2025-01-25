#!/bin/bash

echo "Добро пожаловать в настройку вашего проекта на Go!"
read -p "Введите имя вашего проекта (по умолчанию: my-app): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-my-app}

# Выбор архитектуры
echo "Выберите архитектуру проекта:"
echo "1. Монолит (Monolith)"
echo "2. MVC (Model-View-Controller)"
read -p "Введите номер архитектуры [1-2]: " ARCHITECTURE

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

# Выбор инструментов
echo "Хотите добавить следующие инструменты? (y/n)"
read -p "Redis (Кэширование): " REDIS
read -p "Docker Compose (y/n): " DOCKER_COMPOSE

# Генерация структуры
echo "Создаю проект '$PROJECT_NAME'..."
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

case $ARCHITECTURE in
  1)
    echo "Выбрана архитектура: Монолит"
    bash ../scripts/setup_monolith.sh
    ;;
  2)
    echo "Выбрана архитектура: MVC"
    bash ../scripts/setup_mvc.sh
    ;;
  *)
    echo "Ошибка: Неверный выбор архитектуры."
    exit 1
    ;;
esac

bash ../scripts/setup_packages.sh "$PACKAGES"
bash ../scripts/setup_docker.sh "$REDIS" "$DOCKER_COMPOSE"
bash ../scripts/setup_linter.sh "$ARCHITECTURE"

echo "Проект '$PROJECT_NAME' успешно настроен!"