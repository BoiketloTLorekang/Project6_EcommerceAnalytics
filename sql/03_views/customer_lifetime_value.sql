CREATE VIEW vw_customer_lifetime_value AS
SELECT
    u.user_id,
    u.country,
    u.device,
    u.acquisition_channel,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS lifetime_revenue
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
    AND o.order_status = 'Completed'
GROUP BY
    u.user_id,
    u.country,
    u.device,
    u.acquisition_channel;
