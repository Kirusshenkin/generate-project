# 🚀 Go Project Generator

[English](#english) | [Русский](#russian)

## English

A powerful and flexible CLI tool for generating Go projects with different architectures and features.

### ✨ Features

- 🎯 Multiple project templates (REST API, GraphQL, CLI, Telegram Bot, gRPC)
- 🏗️ Support for various architectures (Monolithic, MVC, Clean Architecture, Hexagonal)
- 🐳 Docker and Docker Compose integration
- 🔍 Configured linter (golangci-lint)
- 📦 Ready-to-use project structure
- 🛠️ Makefile for task automation
- 💾 Database migrations support
- 📝 Configuration examples
- ⚡ Automatic Go installation and version check
- 🔄 CI/CD templates
- 📊 Monitoring setup
- 🔒 Security features
- 📚 Documentation generation

### 🔧 Requirements

- Go 1.21 or higher (will be installed automatically if not present)
- Docker and Docker Compose
- Make

For automatic Go installation:
- On macOS: Homebrew (will be prompted to install if not present)
- On Linux: apt-get or yum package manager

### 🚀 Quick Start

1. Clone the repository:
```bash
git clone <your-repository-url>
cd <your-project-name>
```

2. Install the global command:
```bash
chmod +x scripts/install_alias.sh
./scripts/install_alias.sh
source ~/.bashrc  # or ~/.zshrc
```

3. Create a new project:

Interactive mode:
```bash
cd ~/my-projects
gogen
```

Quick setup with arguments:
```bash
gogen --template rest-api --arch mvc --db postgres
```

### 🎯 Available Options

```bash
gogen [options]

Options:
  --help, -h          Show help
  --template          Project template (rest-api, graphql-api, cli-app, telegram-bot, grpc-service)
  --arch              Architecture (monolith, mvc, clean-arch, hexagonal)
  --db                Database (postgres, mongodb, elasticsearch, redis, clickhouse)
  --test              Testing tools (testify, gomock, httptest, ginkgo)
  --cicd              CI/CD (github-actions, gitlab-ci, jenkins)
  --monitoring        Monitoring (prometheus, jaeger, elk)
  --docs              Documentation (swagger, godoc, markdown)
  --security          Security (jwt, oauth2, cors, rate-limit)
  --config            Configuration (yaml, env, etcd, consul)
```

### 🛠️ Available Make Commands

- `make build` - Build the application
- `make run` - Run the application
- `make test` - Run tests
- `make lint` - Check code with linter
- `make docker-up` - Start Docker containers
- `make docker-down` - Stop Docker containers

## Russian

Мощный и гибкий инструмент командной строки для генерации проектов на Go с различными архитектурами и функциями.

### ✨ Особенности

- 🎯 Множество шаблонов проектов (REST API, GraphQL, CLI, Telegram Bot, gRPC)
- 🏗️ Поддержка различных архитектур (Монолит, MVC, Clean Architecture, Hexagonal)
- 🐳 Интеграция с Docker и Docker Compose
- 🔍 Настроенный линтер (golangci-lint)
- 📦 Готовая структура проекта
- 🛠️ Makefile для автоматизации задач
- 💾 Поддержка миграций базы данных
- 📝 Примеры конфигурации
- ⚡ Автоматическая установка и проверка версии Go
- 🔄 Шаблоны CI/CD
- 📊 Настройка мониторинга
- 🔒 Функции безопасности
- 📚 Генерация документации

### 🔧 Требования

- Go 1.21 или выше (будет установлен автоматически при отсутствии)
- Docker и Docker Compose
- Make

Для автоматической установки Go:
- На macOS: Homebrew (будет предложено установить при отсутствии)
- На Linux: пакетный менеджер apt-get или yum

### 🚀 Быстрый старт

1. Клонируйте репозиторий:
```bash
git clone <your-repository-url>
cd <your-project-name>
```

2. Установите глобальную команду:
```bash
chmod +x scripts/install_alias.sh
./scripts/install_alias.sh
source ~/.bashrc  # или ~/.zshrc
```

3. Создайте новый проект:

Интерактивный режим:
```bash
cd ~/my-projects
gogen
```

Быстрая настройка с аргументами:
```bash
gogen --template rest-api --arch mvc --db postgres
```

### 🎯 Доступные опции

```bash
gogen [options]

Опции:
  --help, -h          Показать справку
  --template          Шаблон проекта (rest-api, graphql-api, cli-app, telegram-bot, grpc-service)
  --arch              Архитектура (monolith, mvc, clean-arch, hexagonal)
  --db                База данных (postgres, mongodb, elasticsearch, redis, clickhouse)
  --test              Инструменты тестирования (testify, gomock, httptest, ginkgo)
  --cicd              CI/CD (github-actions, gitlab-ci, jenkins)
  --monitoring        Мониторинг (prometheus, jaeger, elk)
  --docs              Документация (swagger, godoc, markdown)
  --security          Безопасность (jwt, oauth2, cors, rate-limit)
  --config            Конфигурация (yaml, env, etcd, consul)
```

### 🛠️ Доступные команды Make

- `make build` - Build the application
- `make run` - Run the application
- `make test` - Run tests
- `make lint` - Check code with linter
- `make docker-up` - Start Docker containers
- `make docker-down` - Stop Docker containers

## 📝 License

MIT
