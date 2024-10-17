#include <iostream>
#include <boost/asio.hpp>

int main() {
    const std::string port = "COM3";
    const unsigned int baud_rate = 115200;
    const std::string message = "Message from SW side\n";  // Повідомлення

    try {
        // Ініціалізація Boost.Asio
        boost::asio::io_context io_context;

        // Налаштування серійного порту
        boost::asio::serial_port serial(io_context, port);
        serial.set_option(boost::asio::serial_port_base::baud_rate(baud_rate));

        // Відправлення повідомлення
        boost::asio::write(serial, boost::asio::buffer(message));
        std::cout << "\n\tMessage sent: " << message;

        // Читання відповіді 
        boost::asio::streambuf response_buffer;
        // Зчитування даних до завершення рядка
        boost::asio::read_until(serial, response_buffer, '\n');

        // Конвертація буфера в рядок
        std::istream response_stream(&response_buffer);
        std::string response;
        std::getline(response_stream, response); // читаємо до завершення рядка

        std::cout << "\n\tReceived message: " << response << std::endl;

    }
    catch (std::exception& e) {
        std::cerr << "\n\tError: " << e.what() << std::endl;
        std::cout << "\n\tExiting program." << std::endl;
        return 1;
    }

    // завершення роботи
    std::cout << "\n\tProgram finished successfully." << std::endl;
    return 0;
}
