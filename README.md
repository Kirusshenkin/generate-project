# Go Project Template / Шаблон проекта Go

[English](#english) | [Русский](#russian)

## English

A flexible template for quickly setting up Go projects with different architectures and tools.

### Features

- Support for Monolithic and MVC architectures
- Docker and Docker Compose integration
- Configured linter (golangci-lint)
- Ready-to-use project structure
- Makefile for task automation
- Database migrations support
- Configuration examples
- Automatic Go installation and version check

### Requirements

- Go 1.21 or higher (will be installed automatically if not present)
- Docker and Docker Compose
- Make

For automatic Go installation:
- On macOS: Homebrew (will be prompted to install if not present)
- On Linux: apt-get or yum package manager

### Quick Start

1. Clone the repository:
```bash
git clone <your-repository-url>
cd <your-project-name>
```

2. Run the setup script:
```bash
chmod +x setup.sh
./setup.sh
```

3. Follow the interactive prompts to configure your project:
- Choose your language (English/Russian)
- The script will check and install Go if needed
- Enter project name
- Select architecture (Monolith/MVC)
- Choose required packages
- Configure additional tools

### Available Make Commands

- `make build` - Build the application
- `make run` - Run the application
- `make test` - Run tests
- `make lint` - Check code with linter
- `make docker-up` - Start Docker containers
- `make docker-down` - Stop Docker containers

## Russian

Гибкий шаблон для быстрой настройки проектов на Go с различными архитектурами и инструментами.

### Особенности

- Поддержка монолитной и MVC архитектуры
- Интеграция с Docker и Docker Compose
- Настроенный линтер (golangci-lint)
- Готовая структура проекта
- Makefile для автоматизации задач
- Поддержка миграций базы данных
- Примеры конфигурации
- Автоматическая установка и проверка версии Go

### Требования

- Go 1.21 или выше (будет установлен автоматически при отсутствии)
- Docker и Docker Compose
- Make

Для автоматической установки Go:
- На macOS: Homebrew (будет предложено установить при отсутствии)
- На Linux: пакетный менеджер apt-get или yum

### Быстрый старт

1. Клонируйте репозиторий:
```bash
git clone <your-repository-url>
cd <your-project-name>
```

2. Запустите скрипт настройки:
```bash
chmod +x setup.sh
./setup.sh
```

3. Следуйте интерактивным подсказкам для настройки проекта:
- Выберите язык (английский/русский)
- Скрипт проверит и установит Go при необходимости
- Введите имя проекта
- Выберите архитектуру (Монолит/MVC)
- Выберите необходимые пакеты
- Настройте дополнительные инструменты

### Доступные команды Make

- `make build` - Сборка приложения
- `make run` - Запуск приложения
- `make test` - Запуск тестов
- `make lint` - Проверка кода линтером
- `make docker-up` - Запуск Docker контейнеров
- `make docker-down` - Остановка Docker контейнеров
