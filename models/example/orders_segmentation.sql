WITH ranked_orders AS (
  SELECT
    o.date_date,
    o.customers_id,
    o.orders_id,
    o.CA_ht,
    CASE
      WHEN ROW_NUMBER() OVER (PARTITION BY customers_id ORDER BY date_date) <= 1 THEN 'New'
      WHEN ROW_NUMBER() OVER (PARTITION BY customers_id ORDER BY date_date) BETWEEN 2 AND 4 AND COUNT(*) OVER (PARTITION BY customers_id) BETWEEN 2 AND 4 THEN 'Returning'
      ELSE 'VIP'
    END AS orders_segmentation
  FROM 
    `bi-thc.Orders.Orders_Recruitment` o
  WHERE EXTRACT(YEAR FROM o.date_date) = 2023
)
SELECT * FROM ranked_orders
