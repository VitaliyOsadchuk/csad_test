#define _SILENCE_TR1_NAMESPACE_DEPRECATION_WARNING

#include "pch.h"
#include <gtest/gtest.h>
#include <windows.h>
#include <cstring>

// Функція для перевірки довжини повідомлення
bool checkMessageLength(const char* message) {
    return message && strlen(message) > 0;
}

// Тест для перевірки довжини повідомлення
TEST(SerialCommunicationTest, CheckMessageLength) {
    const char* message = "Message from SW side\n";
    ASSERT_TRUE(checkMessageLength(message));
}

// Тест для серійної комунікації
TEST(SerialCommunicationTest, TestSerialCommunication) {
    const char* message = "Message from SW side\n";

    HANDLE hSerial = CreateFile(L"COM3",
        GENERIC_READ | GENERIC_WRITE,
        0,
        NULL,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        NULL);

    ASSERT_NE(hSerial, INVALID_HANDLE_VALUE) << "Error opening serial port.";

    DCB dcbSerialParams = { 0 };
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
    ASSERT_TRUE(GetCommState(hSerial, &dcbSerialParams)) << "Error getting serial state.";

    dcbSerialParams.BaudRate = CBR_115200;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.StopBits = ONESTOPBIT;
    dcbSerialParams.Parity = NOPARITY;

    ASSERT_TRUE(SetCommState(hSerial, &dcbSerialParams)) << "Error setting serial state.";

    COMMTIMEOUTS timeouts = { 0 };
    timeouts.ReadIntervalTimeout = 50;
    timeouts.ReadTotalTimeoutConstant = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    timeouts.WriteTotalTimeoutConstant = 50;
    timeouts.WriteTotalTimeoutMultiplier = 10;

    ASSERT_TRUE(SetCommTimeouts(hSerial, &timeouts)) << "Error setting timeouts.";

    DWORD bytesWritten;
    ASSERT_TRUE(WriteFile(hSerial, message, strlen(message), &bytesWritten, NULL)) << "Error writing to serial port.";

    char buffer[256];
    DWORD bytesRead;
    ASSERT_TRUE(ReadFile(hSerial, buffer, sizeof(buffer) - 1, &bytesRead, NULL)) << "Error reading from serial port.";

    if (bytesRead == 0) {
        std::cerr << "No response received from HW." << std::endl;
    }
    else {
        buffer[bytesRead] = '\0';

        // Видаляємо \r\n з кінця отриманого повідомлення
        if (buffer[strlen(buffer) - 1] == '\n') {
            buffer[strlen(buffer) - 1] = '\0';
        }
        if (buffer[strlen(buffer) - 1] == '\r') {
            buffer[strlen(buffer) - 1] = '\0';
        }

        EXPECT_STREQ(buffer, "Message from SW side - modified by HW*");
    }

    CloseHandle(hSerial);
}

// Головна функція для виконання тестів
int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
