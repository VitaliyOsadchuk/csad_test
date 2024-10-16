cmake_minimum_required(VERSION 3.10)
project(test_serial_communication)

# Включаємо директорії для заголовкових файлів Google Test
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

# Встановлюємо директорію для бінарних файлів
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/tests/test_serial_communication/x64/Debug)

# Вказуємо всі джерела та заголовкові файли
set(TEST_SOURCE_FILES test_serial_communication/test_serial_communication.cpp)
set(TEST_EXECUTABLE_NAME test_serial_communication)

# Створюємо тестовий виконуваний файл
add_executable(${TEST_EXECUTABLE_NAME} ${TEST_SOURCE_FILES})

# Лінкуємо Google Test та ваші бібліотеки
target_link_libraries(${TEST_EXECUTABLE_NAME} gtest gtest_main SW_Task2)

# Додаємо тестовий кейс
add_test(NAME ${TEST_EXECUTABLE_NAME} COMMAND ${TEST_EXECUTABLE_NAME})
