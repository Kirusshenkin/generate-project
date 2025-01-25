#!/bin/bash

# Определяем текущую оболочку
CURRENT_SHELL=$(basename "$SHELL")
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Функция для добавления alias'а
add_alias() {
    local shell_rc="$1"
    local alias_name="gogen"  # go generate project

    # Проверяем, существует ли уже alias
    if grep -q "alias $alias_name=" "$shell_rc" 2>/dev/null; then
        echo "🔄 Обновляем существующий alias..."
        sed -i '' "/alias $alias_name=/d" "$shell_rc"
    fi

    # Добавляем alias
    echo "alias $alias_name='$PARENT_DIR/setup.sh'" >> "$shell_rc"
    
    echo "✨ Alias '$alias_name' успешно добавлен!"
    echo "📝 Использование: $alias_name"
    echo "🔄 Чтобы применить изменения, выполните: source $shell_rc"
}

echo "🚀 Установка alias'а для генератора проектов..."

case "$CURRENT_SHELL" in
    "bash")
        if [ -f "$HOME/.bashrc" ]; then
            add_alias "$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
            add_alias "$HOME/.bash_profile"
        else
            echo "❌ Не найден файл .bashrc или .bash_profile"
            exit 1
        fi
        ;;
    "zsh")
        if [ -f "$HOME/.zshrc" ]; then
            add_alias "$HOME/.zshrc"
        else
            echo "❌ Не найден файл .zshrc"
            exit 1
        fi
        ;;
    *)
        echo "❌ Неподдерживаемая оболочка: $CURRENT_SHELL"
        echo "📝 Поддерживаются: bash и zsh"
        exit 1
        ;;
esac

# Добавляем автодополнение (опционально)
COMPLETION_DIR="$HOME/.gogen-completion"
mkdir -p "$COMPLETION_DIR"

# Создаем файл автодополнения
cat > "$COMPLETION_DIR/gogen-completion.bash" << 'EOF'
_gogen_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Список возможных опций
    opts="--template --arch --db --test --cicd --monitoring --docs --security --config"
    
    # Автодополнение опций
    case "${prev}" in
        --template)
            local templates="rest-api graphql-api cli-app telegram-bot grpc-service"
            COMPREPLY=( $(compgen -W "${templates}" -- ${cur}) )
            return 0
            ;;
        --arch)
            local archs="monolith mvc clean-arch hexagonal"
            COMPREPLY=( $(compgen -W "${archs}" -- ${cur}) )
            return 0
            ;;
        --db)
            local dbs="postgres mongodb elasticsearch redis clickhouse"
            COMPREPLY=( $(compgen -W "${dbs}" -- ${cur}) )
            return 0
            ;;
        *)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
    esac
}

complete -F _gogen_completion gogen
EOF

# Добавляем источник автодополнения в rc файл
case "$CURRENT_SHELL" in
    "bash")
        echo "source $COMPLETION_DIR/gogen-completion.bash" >> "$HOME/.bashrc"
        ;;
    "zsh")
        echo "source $COMPLETION_DIR/gogen-completion.bash" >> "$HOME/.zshrc"
        ;;
esac

echo "✨ Установка завершена!"
echo "🎯 Теперь вы можете использовать команду 'gogen' в любой директории"
echo "💡 Автодополнение доступно через Tab" 