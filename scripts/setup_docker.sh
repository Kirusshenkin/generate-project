#!/bin/bash

REDIS=$1
DOCKER_COMPOSE=$2

echo "Настраиваем Docker..."

# Создание Dockerfile
cat > Dockerfile << EOF
FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o main ./cmd/app

EXPOSE 8080

CMD ["./main"]
EOF

# Создание docker-compose.yml
cat > docker-compose.yml << EOF
version: '3.8'

services:
  app:
    build: .
    ports:
      - "8080:8080"
    depends_on:
      - postgres
$([ "$REDIS" = "y" ] && echo "      - redis")
    environment:
      - DB_HOST=postgres
      - DB_USER=postgres
      - DB_PASSWORD=postgres
      - DB_NAME=app
      - DB_PORT=5432

  postgres:
    image: postgres:15-alpine
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=app
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
$([ "$REDIS" = "y" ] && echo "
  redis:
    image: redis:alpine
    ports:
      - \"6379:6379\"
    volumes:
      - redis_data:/data")

volumes:
  postgres_data:
$([ "$REDIS" = "y" ] && echo "  redis_data:")
EOF

echo "Docker конфигурация создана!" 