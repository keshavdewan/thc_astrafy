SELECT COUNT(*) AS total_orders 
FROM {{ ref('orders_recruitment') }}
WHERE EXTRACT(YEAR FROM date_date) = 2023