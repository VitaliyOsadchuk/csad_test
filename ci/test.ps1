echo "Running test executable..."
Start-Process -FilePath "build/test_serial_communication.exe" -NoNewWindow -Wait -RedirectStandardOutput "ci/test_output.txt" -RedirectStandardError "ci/test_output.txt"

# Перевірка, чи тестовий файл успішно виконано
if ($LASTEXITCODE -eq 0) {
    echo "Tests executed successfully."
} else {
    echo "Failed to execute tests."
    Get-Content "ci/test_output.txt" | Write
