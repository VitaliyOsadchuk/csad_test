echo "Running test executable..."
Start-Process -FilePath "build/test_serial_communication.exe" -NoNewWindow -Wait -RedirectStandardOutput "ci/test_output.txt" -RedirectStandardError "ci/test_output.txt"

# Перевірка, чи тестовий файл успішно виконано
if ($LASTEXITCODE -eq 0) {
    echo "Tests executed successfully."
} else {
    echo "Failed to execute tests."
    Get-Content "ci/test_output.txt" | Write-Output
    exit 1
}

# Вивід вмісту тестового файлу для журналювання
echo "Test output content:"
Get-Content "ci/test_output.txt" | Write-Output

# Переконайтеся, що створений файл існує та не порожній
if ((Get-Item "ci/test_output.txt").length -gt 0) {
    echo "Test output file created successfully and is not empty."
} else {
    echo "Test output file is empty or does not exist."
    exit 1
}
