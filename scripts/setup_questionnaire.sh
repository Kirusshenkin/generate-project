#!/bin/bash

# Функция для мультивыбора
multiselect() {
    local prompt="$1"
    shift
    local options=("$@")
    local selected=()
    
    echo "$prompt"
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done
    
    read -p "Введите номера через запятую (например: 1,3,4): " choices
    
    IFS=',' read -ra ADDR <<< "$choices"
    for i in "${ADDR[@]}"; do
        if [[ "$i" =~ ^[0-9]+$ ]] && [ "$i" -ge 1 ] && [ "$i" -le "${#options[@]}" ]; then
            selected+=("${options[$i-1]}")
        fi
    done
    
    echo "Выбрано: ${selected[*]}"
    export SELECTED="${selected[*]}"
}

# Функция для одиночного выбора
select_one() {
    local prompt="$1"
    shift
    local options=("$@")
    
    echo "$prompt"
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done
    
    while true; do
        read -p "Введите номер: " choice
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#options[@]}" ]; then
            export SELECTED="${options[$choice-1]}"
            break
        else
            echo "❌ Неверный выбор. Попробуйте снова."
        fi
    done
}

# Выбор шаблона проекта
PROJECT_TEMPLATES=(
    "🌐 REST API"
    "🎯 GraphQL API"
    "🖥️  CLI приложение"
    "🤖 Telegram бот"
    "🎮 gRPC сервис"
)
select_one "📚 Выберите шаблон проекта:" "${PROJECT_TEMPLATES[@]}"
PROJECT_TEMPLATE="$SELECTED"

# Выбор архитектуры
ARCHITECTURES=(
    "🏰 Монолит (Monolith)"
    "🎯 MVC (Model-View-Controller)"
    "🔄 Clean Architecture"
    "🎨 Hexagonal Architecture"
)
select_one "🏗️  Выберите архитектуру:" "${ARCHITECTURES[@]}"
ARCHITECTURE="$SELECTED"

# Выбор базы данных
DATABASES=(
    "🐘 PostgreSQL"
    "🗄️  MongoDB"
    "🔍 Elasticsearch"
    "🔄 Redis"
    "📊 ClickHouse"
)
multiselect "💾 Выберите базы данных:" "${DATABASES[@]}"
DATABASES_SELECTED="$SELECTED"

# Выбор инструментов для тестирования
TEST_TOOLS=(
    "🎯 testify"
    "🔄 gomock"
    "🌐 httptest"
    "🧰 ginkgo"
    "✨ Все вышеперечисленное"
)
multiselect "🧪 Выберите инструменты для тестирования:" "${TEST_TOOLS[@]}"
TEST_TOOLS_SELECTED="$SELECTED"

# Выбор CI/CD
CICD_TOOLS=(
    "🐙 GitHub Actions"
    "🦊 GitLab CI"
    "🔄 Jenkins"
    "🚫 Не нужно"
)
select_one "🔄 Настроить CI/CD?" "${CICD_TOOLS[@]}"
CICD_SELECTED="$SELECTED"

# Выбор мониторинга
MONITORING_TOOLS=(
    "📈 Prometheus + Grafana"
    "🔍 Jaeger (трейсинг)"
    "📝 ELK Stack"
    "✨ Все вышеперечисленное"
    "🚫 Не нужно"
)
multiselect "📊 Добавить мониторинг?" "${MONITORING_TOOLS[@]}"
MONITORING_SELECTED="$SELECTED"

# Выбор документации
DOC_TOOLS=(
    "🌐 Swagger/OpenAPI"
    "📝 GoDoc"
    "📘 Markdown"
    "✨ Все вышеперечисленное"
)
multiselect "📚 Генерация документации:" "${DOC_TOOLS[@]}"
DOC_TOOLS_SELECTED="$SELECTED"

# Настройки безопасности
SECURITY_TOOLS=(
    "🔑 JWT аутентификация"
    "🔐 OAuth2"
    "🛡️  CORS"
    "🔒 Rate Limiting"
    "✨ Все вышеперечисленное"
)
multiselect "🔒 Настройки безопасности:" "${SECURITY_TOOLS[@]}"
SECURITY_SELECTED="$SELECTED"

# Конфигурация приложения
CONFIG_TOOLS=(
    "📄 YAML"
    "🔧 ENV файлы"
    "🗄️  etcd"
    "⚡ Consul"
)
select_one "⚙️  Конфигурация приложения:" "${CONFIG_TOOLS[@]}"
CONFIG_SELECTED="$SELECTED"

# Вывод выбранных опций
echo "\n✨ Выбранные настройки:"
echo "📚 Шаблон проекта: $PROJECT_TEMPLATE"
echo "🏗️  Архитектура: $ARCHITECTURE"
echo "💾 Базы данных: $DATABASES_SELECTED"
echo "🧪 Инструменты тестирования: $TEST_TOOLS_SELECTED"
echo "🔄 CI/CD: $CICD_SELECTED"
echo "📊 Мониторинг: $MONITORING_SELECTED"
echo "📚 Документация: $DOC_TOOLS_SELECTED"
echo "🔒 Безопасность: $SECURITY_SELECTED"
echo "⚙️  Конфигурация: $CONFIG_SELECTED"

# Экспорт переменных для использования в других скриптах
export PROJECT_TEMPLATE ARCHITECTURE DATABASES_SELECTED TEST_TOOLS_SELECTED \
       CICD_SELECTED MONITORING_SELECTED DOC_TOOLS_SELECTED SECURITY_SELECTED \
       CONFIG_SELECTED 