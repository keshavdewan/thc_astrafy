SELECT  EXTRACT(MONTH FROM date_date) AS Month,
        COUNT(*) AS orders_per_month
FROM {{ ref('orders_recruitment') }}
WHERE EXTRACT(YEAR FROM date_date) = 2023
GROUP BY Month
ORDER BY Month