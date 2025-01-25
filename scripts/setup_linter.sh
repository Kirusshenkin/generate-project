#!/bin/bash

echo "Настраиваем линтер GolangCI-Lint..."

# Создание конфигурации golangci-lint
cat > .golangci.yml << EOF
linters:
  enable:
    - gofmt
    - golint
    - govet
    - errcheck
    - staticcheck
    - gosimple
    - ineffassign
    - unconvert
    - deadcode
    - structcheck
    - varcheck
    - gosec
    - interfacer
    - goconst
    - unparam
    - misspell

run:
  deadline: 5m
  tests: true

issues:
  exclude-rules:
    - path: _test\.go
      linters:
        - gosec

linters-settings:
  govet:
    check-shadowing: true
  golint:
    min-confidence: 0
  gocyclo:
    min-complexity: 15
  maligned:
    suggest-new: true
  dupl:
    threshold: 100
  goconst:
    min-len: 3
    min-occurrences: 3
EOF

# Установка golangci-lint если не установлен
if ! command -v golangci-lint &> /dev/null; then
    echo "Устанавливаем golangci-lint..."
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
fi

echo "Линтер успешно настроен!" 