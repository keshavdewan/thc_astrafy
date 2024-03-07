select extract(month from date_date) as month, avg(qty) as average_products_per_order
from {{ ref("Sales_Recruitment") }}
where extract(year from date_date) = 2023
group by month
order by month
