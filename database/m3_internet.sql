CREATE DATABASE InternetCafe;
USE InternetCafe;

-- Bảng người dùng (admin và quản lý)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'manager') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng máy tính
CREATE TABLE computers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position varchar(50),
    status ENUM('available', 'in-use', 'maintenance') DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng danh mục dịch vụ đi kèm
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng quản lý sử dụng máy tính
CREATE TABLE computer_usage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    computer_id INT,
    start_time DATETIME NOT NULL,
    end_time DATETIME DEFAULT NULL,
    price DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (computer_id) REFERENCES computers(id)
);

-- Bảng dịch vụ đi kèm cho khách hàng
CREATE TABLE customer_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usage_id INT,
    service_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (usage_id) REFERENCES computer_usage(id),
    FOREIGN KEY (service_id) REFERENCES services(id)
);
