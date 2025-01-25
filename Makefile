PROJECT_NAME ?= my-app

# Основные команды
.PHONY: create-structure setup-monolith setup-mvc install-packages setup-docker setup-linter clean setup-all

create-structure:
	bash scripts/setup.sh $(PROJECT_NAME)

setup-monolith:
	bash scripts/setup_monolith.sh $(PROJECT_NAME)

setup-mvc:
	bash scripts/setup_mvc.sh $(PROJECT_NAME)

install-packages:
	bash scripts/setup_packages.sh

setup-docker:
	bash scripts/setup_docker.sh

setup-linter:
	bash scripts/setup_linter.sh

clean:
	bash scripts/clean.sh $(PROJECT_NAME)

# Полная настройка
setup-all: create-structure install-packages setup-docker setup-linter

# Команды для разработки
.PHONY: run build test lint docker-up docker-down

run:
	go run ./cmd/app

build:
	go build -o bin/app ./cmd/app

test:
	go test -v ./...

lint:
	golangci-lint run

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down 