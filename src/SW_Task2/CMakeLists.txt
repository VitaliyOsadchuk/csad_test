cmake_minimum_required(VERSION 3.10)
project(SW_Task2)

# Встановлюємо директорію для бінарних файлів
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/src/SW_Task2/x64/Debug)

# Вказуємо всі джерела та заголовкові файли
set(SOURCE_FILES SW_Task2/client.cpp)
set(EXECUTABLE_NAME SW_Task2)

# Створюємо виконуваний файл
add_executable(${EXECUTABLE_NAME} ${SOURCE_FILES})

# Додаємо шляхи до заголовкових файлів (якщо потрібно)
include_directories(${CMAKE_SOURCE_DIR}/src/SW_Task2)
