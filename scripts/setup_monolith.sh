#!/bin/bash

PROJECT_NAME=$1
echo "Генерация структуры для Монолита..."

mkdir -p $PROJECT_NAME/cmd/app
mkdir -p $PROJECT_NAME/internal/{app,config,models,repository,service}
mkdir -p $PROJECT_NAME/pkg/{logger,database}
mkdir -p $PROJECT_NAME/api/handlers
mkdir -p $PROJECT_NAME/migrations

# Создаем базовые файлы
cat > $PROJECT_NAME/cmd/app/main.go << EOF
package main

import (
    "log"
)

func main() {
    log.Println("Starting monolithic application...")
    // TODO: Initialize your application
}
EOF

cat > $PROJECT_NAME/internal/config/config.go << EOF
package config

type Config struct {
    Server struct {
        Port string
    }
    Database struct {
        Host     string
        Port     string
        User     string
        Password string
        DBName   string
    }
}

func LoadConfig() (*Config, error) {
    // TODO: Implement config loading
    return &Config{}, nil
}
EOF

cat > $PROJECT_NAME/internal/app/app.go << EOF
package app

type App struct {
    config *config.Config
    // TODO: Add other dependencies
}

func NewApp(config *config.Config) *App {
    return &App{
        config: config,
    }
}

func (a *App) Run() error {
    // TODO: Implement application logic
    return nil
}
EOF

echo "Монолит успешно настроен!" 