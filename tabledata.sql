
CREATE TABLE log_in_attempts (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    login_date DATE NOT NULL,
    login_time TIME NOT NULL,
    country VARCHAR(50) NOT NULL,
    ip_address VARCHAR(15) NOT NULL,
    success BOOLEAN NOT NULL
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    office VARCHAR(50) NOT NULL