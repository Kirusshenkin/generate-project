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

### Requirements

- Go 1.21 or higher
- Docker and Docker Compose
- Make

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

### Требования

- Go 1.21 или выше
- Docker и Docker Compose
- Make

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
