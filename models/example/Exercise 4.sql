/* Create a table (1 line per order) for all orders in the year 2022 and 2023; this table is similar to orders with an additional column:
 the qty_product column that gives the quantity of products in the order, for all orders in 2022 and 2023 */

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