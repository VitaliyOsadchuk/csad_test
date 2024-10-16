echo "Starting build script..."

# Перевірка наявності директорії для бінарних файлів
New-Item -ItemType Directory -Force -Path "build"

# Компіляція головного проекту
echo "Compiling main project..."
& cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# Перевірка результатів компіляції
if ($LASTEXITCODE -eq 0) {
    echo "Main project compiled successfully."
} else {
    echo "Failed to compile main project."
    exit 1
}

# Перевірка існування файлу виконуваного тесту
if (Test-Path "tests/test_serial_communication/x64/Debug/test_serial_communication.exe") {
    echo "Test executable found, copying to build directory."
    Copy-Item -Path "tests/test_serial_communication/x64/Debug/test_serial_communication.exe" -Destination "build/test_serial_communication.exe"
} else {
    echo "Test executable not found."
    exit 1
}

# Перевірка успішності копіювання
if (Test-Path "build/test_serial_communication.exe") {
    echo "Test executable copied successfully."
} else {
    echo "Failed to copy test executable."
    exit 1
}

echo "Build script completed."
