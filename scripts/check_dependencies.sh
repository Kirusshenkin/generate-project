#!/bin/bash

# Минимальная требуемая версия Go
REQUIRED_GO_VERSION="1.21"

# Функция для сравнения версий
version_compare() {
    echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

check_and_install_go() {
    if [ "$LANGUAGE" == "2" ]; then
        echo "🔍 Проверка версии Go..."
    else
        echo "🔍 Checking Go version..."
    fi

    # Проверяем, установлен ли Go
    if ! command -v go >/dev/null 2>&1; then
        if [ "$LANGUAGE" == "2" ]; then
            echo "⚠️  Go не установлен. Установка Go $REQUIRED_GO_VERSION..."
        else
            echo "⚠️  Go is not installed. Installing Go $REQUIRED_GO_VERSION..."
        fi

        # Определяем операционную систему
        OS="$(uname -s)"
        ARCH="$(uname -m)"

        case "$OS" in
            "Darwin")
                # macOS
                if command -v brew >/dev/null 2>&1; then
                    echo "🍺 Установка через Homebrew..."
                    brew install go
                else
                    if [ "$LANGUAGE" == "2" ]; then
                        echo "❌ Homebrew не установлен. Установите Homebrew для продолжения:"
                        echo '🔧 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
                    else
                        echo "❌ Homebrew is not installed. Please install Homebrew first:"
                        echo '🔧 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
                    fi
                    exit 1
                fi
                ;;
            "Linux")
                # Linux
                if command -v apt-get >/dev/null 2>&1; then
                    # Debian/Ubuntu
                    echo "🐧 Установка через apt-get..."
                    sudo apt-get update
                    sudo apt-get install -y golang
                elif command -v yum >/dev/null 2>&1; then
                    # CentOS/RHEL
                    echo "🐧 Установка через yum..."
                    sudo yum install -y golang
                else
                    if [ "$LANGUAGE" == "2" ]; then
                        echo "❌ Не удалось определить пакетный менеджер. Установите Go вручную."
                    else
                        echo "❌ Could not determine package manager. Please install Go manually."
                    fi
                    exit 1
                fi
                ;;
            *)
                if [ "$LANGUAGE" == "2" ]; then
                    echo "❌ Неподдерживаемая операционная система: $OS"
                else
                    echo "❌ Unsupported operating system: $OS"
                fi
                exit 1
                ;;
        esac
    fi

    # Проверяем версию Go
    CURRENT_GO_VERSION=$(go version | awk '{print $3}' | sed 's/go//')
    if [ $(version_compare "$CURRENT_GO_VERSION") -lt $(version_compare "$REQUIRED_GO_VERSION") ]; then
        if [ "$LANGUAGE" == "2" ]; then
            echo "⚠️  Обнаружена устаревшая версия Go ($CURRENT_GO_VERSION). Требуется версия $REQUIRED_GO_VERSION или выше."
            echo "🔄 Пожалуйста, обновите Go до актуальной версии."
        else
            echo "⚠️  Outdated Go version detected ($CURRENT_GO_VERSION). Version $REQUIRED_GO_VERSION or higher is required."
            echo "🔄 Please upgrade Go to a newer version."
        fi
        exit 1
    fi

    if [ "$LANGUAGE" == "2" ]; then
        echo "✅ Go версии $CURRENT_GO_VERSION успешно установлен!"
    else
        echo "✅ Go version $CURRENT_GO_VERSION is successfully installed!"
    fi
}

# Запускаем проверку
check_and_install_go 