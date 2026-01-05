CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 INSERT INTO products (product_name, price) VALUES
('Laptop Dell', 15000000),
('Chuột Logitech', 500000),
('Bàn phím cơ', 12000000),
('Tai nghe Sony', 2500000);
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1);
SELECT p.product_id, p.product_name,SUM(oi.quantity) AS total_quantity_sold,  SUM(oi.quantity * p.price) AS total_revenue
	FROM products p
	JOIN order_items oi ON p.product_id = oi.product_id
	JOIN orders o ON oi.order_id = o.order_id
	WHERE o.status = 'completed'
	GROUP BY p.product_id, p.product_name
	HAVING SUM(oi.quantity * p.price) > 5000000
	ORDER BY total_revenue DESC;
