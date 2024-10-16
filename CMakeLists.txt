cmake_minimum_required(VERSION 3.10)
project(csad_test)

# Додаємо підкаталоги з вихідним кодом і тестами
add_subdirectory(src/SW_Task2)
add_subdirectory(tests/test_serial_communication)

# Включаємо можливість тестування
enable_testing()
