#!/bin/bash

mkdir -p build

g++ -o build/SW_Task2 src/SW_Task2/SW_Task2/client.cpp

g++ -o build/test_serial_communication tests/test_serial_communication/test_serial_communication.cpp -I3party/googletest/include -L3party/googletest/lib -lgtest -lgtest_main -lpthread
