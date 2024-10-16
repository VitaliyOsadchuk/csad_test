#!/bin/bash

echo "Running test executable..."
build/test_serial_communication.exe > ci/test_output.txt 2>&1

# Перевірка, чи тестовий файл успішно виконан
