echo "Starting build script..."

# Перевірка наявності директорії для бінарних файлів
New-Item -ItemType Directory -Force -Path "build"

# Компіляція головного проекту
echo "Compiling main project..."
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Перевірка результатів компіляції
if ($LASTEXITCODE -eq 0) {
    echo "Main project compiled successfully."
} else {
    echo "Failed to compile main project."
    exit 1
}

# Компіляція тестового проекту
echo "Compiling test project..."
cl /EHsc /Fe:build/test_serial_communication.exe tests/test_serial_communication/test_serial_communication.cpp

# Перевірка результатів компіляції тесту
if ($LASTEXITCODE -eq 0) {
    echo "Test project compiled successfully."
} else {
    echo "Failed to compile test project."
    exit 1
}

echo "Build script completed."
