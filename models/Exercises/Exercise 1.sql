select count(*) as total_orders
from {{ ref("orders_recruitment") }}
where extract(year from date_date) = 2023
