SELECT 
    o.date_date,
    o.customers_id,
    o.orders_id,
    o.CA_ht,
    SUM(s.qty) AS qty_product

FROM {{ ref('orders_recruitment') }} o

JOIN {{ ref('Sales_Recruitment') }} s ON o.orders_id = s.transaction_id

WHERE EXTRACT(YEAR FROM o.date_date) IN(2022,2023)

GROUP BY o.date_date,
    o.customers_id,
    o.orders_id,
    o.CA_ht