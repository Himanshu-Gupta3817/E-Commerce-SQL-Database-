SELECT SUM(amount) AS total_revenue FROM payments;

-- Which product returns highest revenue --> Python Hoodie
SELECT p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.product_id
JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Which customer spents highest amount --> Simran Kaur
SELECT c.name, SUM(p.amount) AS total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Best selling product on basis of quantity --> DSA Notebook/SQL Cheat Sheet/ Terminal Stickers
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_of_product_sold
FROM products AS p
JOIN order_items AS oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_of_product_sold DESC;

-- Calculate count of cancelled orders
SELECT COUNT(order_status) AS cancelled
FROM orders
WHERE order_status = 'Cancelled';

-- Find out which Order item is cancelled most
SELECT p.product_name, COUNT(o.order_status) AS cancelled_orders
FROM products AS p
JOIN order_items AS oi ON p.product_id = oi.product_id
JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.order_status = 'Cancelled'
GROUP BY p.product_name
ORDER BY cancelled_orders DESC;