select extract(month from date_date) as month, count(*) as orders_per_month
from {{ ref("orders_recruitment") }}
where extract(year from date_date) = 2023
group by month
order by month
