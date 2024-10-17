#!/bin/bash

echo "Running test executable..."
build/test_serial_communication.exe > ci/test_output.txt 2>&1

# Перевірка, чи тестовий файл успішно виконано
if [ $? -eq 0 ]; then
    echo "Tests executed successfully."
else
    echo "Failed to execute tests."
    cat ci/test_output.txt
    exit 1
fi

# Вивід вмісту тестового файлу для журналювання
echo "Test output content:"
cat ci/test_output.txt

# Переконайтеся, що створений файл існує та не порожній
if [ -s ci/test_output.txt ]; then
    echo "Test output file created successfully and is not empty."
else
    echo "Test output file is empty or does not exist."
    exit 1
fi
