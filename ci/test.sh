#!/bin/bash

# Запуск тестового виконуваного файлу та збереження результатів
build/test_serial_communication.exe > ci/test_output.txt

if [ $? -eq 0 ]; then
    echo "Tests executed successfully."
else
    echo "Failed to execute tests."
    exit 1
fi

# Переконайтеся, що створений файл існує
if [ -f ci/test_output.txt ]; then
    echo "Test output file created successfully."
else
    echo "Failed to create test output file."
    exit 1
fi
