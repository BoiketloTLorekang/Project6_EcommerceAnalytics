CREATE VIEW vw_channel_performance AS
SELECT
    s.channel,
    COUNT(DISTINCT s.session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM sessions s
LEFT JOIN orders o
    ON s.user_id = o.user_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
    AND o.order_status = 'Completed'
GROUP BY s.channel;
