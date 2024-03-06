/* Order segmentation
Orders are segmented into 3 groups:
•	New: it's the 1st order of the customer (client_id) in the past 12 months. In the 12 months prior to this order, the customer did not place any orders
•	Returning: it's between the 2nd and the 4th order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed between 1 and 3 orders
•	VIP: it's the 5th or more order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed at least 4 orders or more
Calculate for each order placed in 2023, the segment of this order.
 */

WITH ranked_orders AS (
  SELECT
    o.date_date,
    o.customers_id,
    o.orders_id,
    o.CA_ht,
    CASE
      WHEN ROW_NUMBER() OVER (PARTITION BY customers_id ORDER BY date_date) <= 1 THEN 'New'
      WHEN ROW_NUMBER() OVER (PARTITION BY customers_id ORDER BY date_date) BETWEEN 2 AND 4  THEN 'Returning'
      ELSE 'VIP'
    END AS orders_segmentation
  FROM 
    {{ ref('orders_recruitment') }} o
  WHERE EXTRACT(YEAR FROM o.date_date) = 2023
)
SELECT * FROM ranked_orders