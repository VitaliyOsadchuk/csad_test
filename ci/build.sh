#!/bin/bash

# Перевірка наявності директорії для бінарних файлів
mkdir -p build

# Компіляція головного проекту
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Переміщення виконуваного файлу тесту до build
cp tests/test_serial_communication/x64/Debug/test_serial_communication.exe build/
