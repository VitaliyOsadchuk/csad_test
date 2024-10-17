#!/bin/bash

echo "Starting build script..."

# Перевірка наявності директорії для бінарних файлів
mkdir -p build

# Компіляція головного проекту
echo "Compiling main project..."
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Перевірка результатів компіляції
if [ $? -eq 0 ]; then
    echo "Main project compiled successfully."
else
    echo "Failed to compile main project."
    exit 1
fi

# Компіляція тестового проекту
echo "Compiling test project..."
cl /EHsc /Fe:build/test_serial_communication.exe tests/test_serial_communication/test_serial_communication/test.cpp

# Перевірка результатів компіляції тесту
if [ $? -eq 0 ]; then
    echo "Test project compiled successfully."
else
    echo "Failed to compile test project."
    exit 1
fi

echo "Build script completed."
