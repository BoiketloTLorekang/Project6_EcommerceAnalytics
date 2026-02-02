CREATE VIEW vw_funnel_conversion AS
SELECT
    COUNT(DISTINCT s.user_id) AS users_with_sessions,
    COUNT(DISTINCT o.user_id) AS users_with_orders,
    CAST(
        COUNT(DISTINCT o.user_id) * 1.0 /
        NULLIF(COUNT(DISTINCT s.user_id), 0)
        AS DECIMAL(5,2)
    ) AS conversion_rate
FROM sessions s
LEFT JOIN orders o
    ON s.user_id = o.user_id
    AND o.order_status = 'Completed';
