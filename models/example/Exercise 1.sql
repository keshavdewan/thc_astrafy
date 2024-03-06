/* What is the number of orders in the year 2023? */

SELECT COUNT(*) AS total_orders 
FROM {{ ref('orders_recruitment') }}
WHERE EXTRACT(YEAR FROM date_date) = 2023