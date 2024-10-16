#!/bin/bash

echo "Starting build script..."

# Перевірка наявності директорії для бінарних файлів
mkdir -p build

# Компіляція головного проекту
echo "Compiling main project..."
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

echo "Build script completed."
