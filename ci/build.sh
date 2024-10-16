#!/bin/bash

# Перевірка наявності директорії для бінарних файлів
mkdir -p build

# Компіляція головного проекту
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Компіляція тестового проекту з використанням Google Test
cl /EHsc /Fe:build/test_serial_communication.exe tests/test_serial_communication/test_serial_communication.cpp 3party/googletest/lib/gtest.lib 3party/googletest/lib/gtest_main.lib
