#!/bin/bash

# �������� �������� �������� ��� ������� �����
mkdir -p build

# ��������� ��������� �������
cl /EHsc /Fe:build/SW_Task2.exe src/SW_Task2/SW_Task2/client.cpp

# ���������� ������������ ����� ����� �� build
cp tests/test_serial_communication/x64/Debug/test_serial_communication.exe build/
