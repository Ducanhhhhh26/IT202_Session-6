SELECT
    o.order_date,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY o.order_date
HAVING SUM(o.total_amount) > 10000000
ORDER BY o.order_date;