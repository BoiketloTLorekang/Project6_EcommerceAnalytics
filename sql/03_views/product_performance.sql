CREATE VIEW vw_product_performance AS
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_name,
    p.category;
