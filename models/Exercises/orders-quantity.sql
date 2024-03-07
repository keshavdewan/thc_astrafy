select o.date_date, o.customers_id, o.orders_id, o.ca_ht, sum(s.qty) as qty_product

from {{ ref("orders_recruitment") }} o
join {{ ref("Sales_Recruitment") }} s on o.orders_id = s.transaction_id

where extract(year from o.date_date) in (2022, 2023)
group by o.date_date, o.customers_id, o.orders_id, o.ca_ht
