#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

show_help() {
    echo "🚀 Go Project Generator"
    echo
    echo "Использование:"
    echo "  gogen [options]"
    echo
    echo "Опции:"
    echo "  --help, -h          Показать эту справку"
    echo "  --template          Шаблон проекта (rest-api, graphql-api, cli-app, telegram-bot, grpc-service)"
    echo "  --arch              Архитектура (monolith, mvc, clean-arch, hexagonal)"
    echo "  --db                База данных (postgres, mongodb, elasticsearch, redis, clickhouse)"
    echo "  --test              Инструменты тестирования (testify, gomock, httptest, ginkgo)"
    echo "  --cicd              CI/CD (github-actions, gitlab-ci, jenkins)"
    echo "  --monitoring        Мониторинг (prometheus, jaeger, elk)"
    echo "  --docs              Документация (swagger, godoc, markdown)"
    echo "  --security          Безопасность (jwt, oauth2, cors, rate-limit)"
    echo "  --config            Конфигурация (yaml, env, etcd, consul)"
    echo
    echo "Примеры:"
    echo "  gogen                                    # Интерактивный режим"
    echo "  gogen --template rest-api --arch mvc     # Быстрая настройка REST API с MVC"
    echo "  gogen --help                            # Показать справку"
}

while [[ $# -gt 0 ]]; do
    case $1 in
        --help|-h)
            show_help
            exit 0
            ;;
        --template)
            TEMPLATE="$2"
            shift 2
            ;;
        --arch)
            ARCH="$2"
            shift 2
            ;;
        --db)
            DB="$2"
            shift 2
            ;;
        --test)
            TEST="$2"
            shift 2
            ;;
        --cicd)
            CICD="$2"
            shift 2
            ;;
        --monitoring)
            MONITORING="$2"
            shift 2
            ;;
        --docs)
            DOCS="$2"
            shift 2
            ;;
        --security)
            SECURITY="$2"
            shift 2
            ;;
        --config)
            CONFIG="$2"
            shift 2
            ;;
        *)
            echo "❌ Неизвестная опция: $1"
            show_help
            exit 1
            ;;
    esac
done

if [ -z "$TEMPLATE" ] && [ -z "$ARCH" ] && [ -z "$DB" ] && [ -z "$TEST" ] && \
   [ -z "$CICD" ] && [ -z "$MONITORING" ] && [ -z "$DOCS" ] && [ -z "$SECURITY" ] && \
   [ -z "$CONFIG" ]; then
    source "$SCRIPT_DIR/scripts/setup_questionnaire.sh"
else
    PROJECT_TEMPLATE="$TEMPLATE"
    ARCHITECTURE="$ARCH"
    DATABASES_SELECTED="$DB"
    TEST_TOOLS_SELECTED="$TEST"
    CICD_SELECTED="$CICD"
    MONITORING_SELECTED="$MONITORING"
    DOC_TOOLS_SELECTED="$DOCS"
    SECURITY_SELECTED="$SECURITY"
    CONFIG_SELECTED="$CONFIG"
fi

CURRENT_DIR="$(pwd)"

echo "🚀 Генерация проекта..."
echo "📂 Директория: $CURRENT_DIR"
echo "📝 Шаблон: $PROJECT_TEMPLATE"
echo "🏗️  Архитектура: $ARCHITECTURE"

case "$ARCHITECTURE" in
    *"Монолит"*|*"Monolith"*)
        bash "$SCRIPT_DIR/scripts/setup_monolith.sh" "$CURRENT_DIR"
        ;;
    *"MVC"*)
        bash "$SCRIPT_DIR/scripts/setup_mvc.sh" "$CURRENT_DIR"
        ;;
    *"Clean"*)
        bash "$SCRIPT_DIR/scripts/setup_clean_arch.sh" "$CURRENT_DIR"
        ;;
    *"Hexagonal"*)
        bash "$SCRIPT_DIR/scripts/setup_hexagonal.sh" "$CURRENT_DIR"
        ;;
    *)
        echo "❌ Неподдерживаемая архитектура: $ARCHITECTURE"
        exit 1
        ;;
esac

bash "$SCRIPT_DIR/scripts/setup_packages.sh" "$CURRENT_DIR"

if [[ "$MONITORING_SELECTED" == *"Prometheus"* ]] || [[ "$DATABASES_SELECTED" == *"Redis"* ]]; then
    bash "$SCRIPT_DIR/scripts/setup_docker.sh" "y" "y"
fi

bash "$SCRIPT_DIR/scripts/setup_linter.sh"

echo "✨ Проект успешно создан в директории: $CURRENT_DIR"