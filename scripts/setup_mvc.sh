#!/bin/bash

PROJECT_NAME=$1
echo "Генерация структуры для MVC..."

mkdir -p $PROJECT_NAME/cmd/app
mkdir -p $PROJECT_NAME/internal/{controllers,models,views}
mkdir -p $PROJECT_NAME/pkg/{logger,database}
mkdir -p $PROJECT_NAME/templates
mkdir -p $PROJECT_NAME/migrations

# Создаем базовые файлы
cat > $PROJECT_NAME/cmd/app/main.go << EOF
package main

import (
    "log"
    "net/http"
)

func main() {
    log.Println("Starting MVC application...")
    // TODO: Initialize your application
}
EOF

cat > $PROJECT_NAME/internal/controllers/base_controller.go << EOF
package controllers

type BaseController struct {
    // TODO: Add common controller functionality
}
EOF

cat > $PROJECT_NAME/internal/models/base_model.go << EOF
package models

type BaseModel struct {
    ID        uint      \`json:"id"\`
    CreatedAt time.Time \`json:"created_at"\`
    UpdatedAt time.Time \`json:"updated_at"\`
}
EOF

cat > $PROJECT_NAME/internal/views/base_view.go << EOF
package views

type BaseView struct {
    // TODO: Add common view functionality
}

func RenderTemplate(name string, data interface{}) error {
    // TODO: Implement template rendering
    return nil
}
EOF

echo "MVC успешно настроен!" 