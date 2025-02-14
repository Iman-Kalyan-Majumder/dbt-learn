with customers as (
    select * from {{ref('stg_jaffle_shop__customers')}}
),
orders as (
    select * from {{ref('stg_jaffle_shop__orders')}}
),
payment as (
    select * from {{ref('stg_stripe__payments')}}
)
select O.order_id, C.customer_id, P.amount from payment P join orders O on P.order_id=O.order_id join customers C on O.customer_id=C.customer_id where P.status='success'