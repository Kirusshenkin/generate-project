#!/bin/bash

PROJECT_NAME=$1
echo "Очистка проекта '$PROJECT_NAME'..."

# Удаление сгенерированных файлов и директорий
rm -rf $PROJECT_NAME
rm -f docker-compose.yml
rm -f Dockerfile
rm -f .golangci.yml
rm -f go.mod
rm -f go.sum
rm -rf bin/
rm -rf vendor/

echo "Проект очищен!" 