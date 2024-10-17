#include <iostream>
#include <boost/asio.hpp>

int main() {
    const std::string port = "COM3";
    const unsigned int baud_rate = 115200;
    const std::string message = "Message from SW side\n";  // �����������

    try {
        // ����������� Boost.Asio
        boost::asio::io_context io_context;

        // ������������ �������� �����
        boost::asio::serial_port serial(io_context, port);
        serial.set_option(boost::asio::serial_port_base::baud_rate(baud_rate));

        // ³���������� �����������
        boost::asio::write(serial, boost::asio::buffer(message));
        std::cout << "\n\tMessage sent: " << message;

        // ������� ������ 
        boost::asio::streambuf response_buffer;
        // ���������� ����� �� ���������� �����
        boost::asio::read_until(serial, response_buffer, '\n');

        // ����������� ������ � �����
        std::istream response_stream(&response_buffer);
        std::string response;
        std::getline(response_stream, response); // ������ �� ���������� �����

        std::cout << "\n\tReceived message: " << response << std::endl;

    }
    catch (std::exception& e) {
        std::cerr << "\n\tError: " << e.what() << std::endl;
        std::cout << "\n\tExiting program." << std::endl;
        return 1;
    }

    // ���������� ������
    std::cout << "\n\tProgram finished successfully." << std::endl;
    return 0;
}
