with customers as (
    select * from {{ref("stg_jaffle_shop__customers")}}
),
orders as (
    select * from {{ref("stg_jaffle_shop__orders")}}
)
select orders.*, first_name, last_name from orders left join customers on orders.customer_id=customers.customer_id