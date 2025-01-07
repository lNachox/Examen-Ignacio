CREATE DATABASE IF NOT EXISTS flyhigh;
USE flyhigh;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    user_type ENUM('FREQUENT', 'TOURIST', 'STAFF', 'ADMIN') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE flights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL UNIQUE,
    origin_city_id INT NOT NULL,
    destination_city_id INT NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    capacity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status ENUM('SCHEDULED', 'CONFIRMED', 'CANCELLED') NOT NULL DEFAULT 'SCHEDULED',
    FOREIGN KEY (origin_city_id) REFERENCES cities(id),
    FOREIGN KEY (destination_city_id) REFERENCES cities(id)
);

CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    flight_id INT NOT NULL,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('CONFIRMED', 'CANCELLED') NOT NULL DEFAULT 'CONFIRMED',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);


INSERT INTO cities (name) VALUES 
('New York'),
('London'),
('Paris'),
('Tokyo'),
('Sydney');

INSERT INTO users (username, password, email, user_type) VALUES
('john_doe', 'hashed_password', 'john@example.com', 'FREQUENT'),
('jane_smith', 'hashed_password', 'jane@example.com', 'TOURIST'),
('admin_user', 'hashed_password', 'admin@flyhigh.com', 'ADMIN'),
('staff_user', 'hashed_password', 'staff@flyhigh.com', 'STAFF');

INSERT INTO flights (flight_number, origin_city_id, destination_city_id, departure_time, arrival_time, capacity, price, status) VALUES
('FH001', 1, 2, '2023-07-01 10:00:00', '2023-07-01 22:00:00', 200, 500.00, 'SCHEDULED'),
('FH002', 2, 3, '2023-07-02 14:00:00', '2023-07-02 16:30:00', 180, 200.00, 'CONFIRMED'),
('FH003', 3, 4, '2023-07-03 09:00:00', '2023-07-04 01:00:00', 250, 800.00, 'SCHEDULED'),
('FH004', 4, 5, '2023-07-04 22:00:00', '2023-07-05 10:00:00', 220, 750.00, 'SCHEDULED'),
('FH005', 5, 1, '2023-07-05 23:00:00', '2023-07-06 15:00:00', 190, 900.00, 'SCHEDULED');

INSERT INTO reservations (user_id, flight_id, status) VALUES
(1, 1, 'CONFIRMED'),
(2, 2, 'CONFIRMED'),
(1, 3, 'CONFIRMED'),
(2, 4, 'CANCELLED');