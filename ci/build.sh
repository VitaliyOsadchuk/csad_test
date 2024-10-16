#!/bin/bash

# Перевірка наявності директорії для бінарних файлів
mkdir -p build

# Компіляція головного проекту
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Перевірка результатів компіляції
if [ $? -eq 0 ]; then
    echo "Main project compiled successfully."
else
    echo "Failed to compile main project."
    exit 1
fi

# Переміщення виконуваного файлу тесту до build
cp tests/test_serial_communication/x64/Debug/test_serial_communication.exe build/

if [ $? -eq 0 ]; then
    echo "Test executable copied successfully."
else
    echo "Failed to copy test executable."
    exit 1
fi
