
INSERT INTO log_in_attempts (username, login_date, login_time, country, ip_address, success) VALUES
('jsmith', '2022-05-08', '17:30:00', 'USA', '192.168.1.1', TRUE),
('ajonson', '2022-05-09', '19:15:00', 'MEX', '192.168.1.2', FALSE),
('mjohnson', '2022-05-09', '20:30:00', 'CAN', '192.168.1.3', FALSE),
('jdoe', '2022-05-10', '08:45:00', 'USA', '192.168.1.4', TRUE),
('sbrown', '2022-05-10', '22:15:00', 'UK', '192.168.1.5', FALSE);
INSERT INTO employees (device_id, username, department, office) VALUES
('D001', 'jsmith', 'Marketing', 'East-170'),
('D002', 'ajonson', 'Sales', 'North-110'),
('D003', 'mjohnson', 'Finance', 'West-223'),
('D004', 'jdoe', 'IT', 'South-045'),
('D005', 'sbrown', 'HR', 'East-180');