with
    ranked_orders as (
        select
            o.date_date,
            o.customers_id,
            o.orders_id,
            o.ca_ht,
            case
                when
                    row_number() over (partition by customers_id order by date_date)
                    <= 1
                then 'New'
                when
                    row_number() over (partition by customers_id order by date_date)
                    between 2 and 4
                then 'Returning'
                else 'VIP'
            end as orders_segmentation
        from {{ ref("orders_recruitment") }} o
        where extract(year from o.date_date) = 2023
    )
select *
from ranked_orders
