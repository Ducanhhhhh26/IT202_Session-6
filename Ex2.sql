ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2);
UPDATE orders 
SET total_amount = CASE order_id
    WHEN 1  THEN 3500000
    WHEN 2  THEN 4200000
    WHEN 3  THEN 3100000
    WHEN 4  THEN 2500000
    WHEN 5  THEN 1800000
    WHEN 6  THEN 6000000
    WHEN 7  THEN 5500000
    WHEN 8  THEN 7200000
    WHEN 9  THEN 3500000
    WHEN 10 THEN 4000000
    WHEN 11 THEN 3800000
    WHEN 12 THEN 2600000
    WHEN 13 THEN 9000000
    WHEN 14 THEN 5000000
    ELSE total_amount
END;
select c.*, o.total_amount'Tổng chi tiêu'
from customers c 
join orders o on o.customer_id = c.customer_id;

SELECT c.customer_id,c.full_name,MAX(o.total_amount) AS max_order_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY  c.customer_id, c.full_name;

SELECT c.customer_id,c.full_name,SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC;

