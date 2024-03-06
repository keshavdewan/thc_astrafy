/* What is the average number of products per order for each month of the year 2023? */

SELECT EXTRACT(MONTH FROM date_date) AS Month,
      AVG(qty) AS average_products_per_order
FROM {{ ref('Sales_Recruitment') }}
WHERE EXTRACT(YEAR FROM date_date) = 2023
GROUP BY MONTH
ORDER BY MONTH