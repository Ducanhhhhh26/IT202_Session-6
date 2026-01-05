drop database if exists ex1;
create database ex1;
use ex1;
create table customers(
	customer_id int auto_increment primary key,
    full_name 	VARCHAR(255) not null,
    city 	VARCHAR(255) not null
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers (full_name, city) VALUES
('Nguyen Van An', 'Ha Noi'),
('Tran Thi Binh', 'Hai Phong'),
('Le Minh Chau', 'Da Nang'),
('Pham Quoc Dung', 'Ho Chi Minh'),
('Vo Thi Hoa', 'Can Tho');
INSERT INTO orders (customer_id, order_date, status) VALUES
-- Ngày 2025-01-05
(1, '2025-01-05', 'completed'),
(2, '2025-01-05', 'completed'),
(3, '2025-01-05', 'completed',

-- Ngày 2025-01-06
(1, '2025-01-06', 'completed'),
(4, '2025-01-06', 'completed'),

-- Ngày 2025-01-07
(2, '2025-01-07', 'completed'),
(3, '2025-01-07', 'completed'),

-- Ngày 2025-01-08
(5, '2025-01-08', 'completed'),
(1, '2025-01-08', 'completed'),

-- Ngày 2025-01-09
(2, '2025-01-09', 'completed'),
(3, '2025-01-09', 'completed'),
(4, '2025-01-09', 'completed'),

-- Đơn không hoàn thành (để test WHERE)
(1, '2025-01-09', 'pending'),
(3, '2025-01-10', 'cancelled');
SELECT * FROM customers;
SELECT * FROM orders;
select c.full_name,o.* 
from orders o
join customers c on c.customer_id = o.customer_id;


SELECT 
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.full_name;
SELECT 
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.full_name
having total_orders  =1;


