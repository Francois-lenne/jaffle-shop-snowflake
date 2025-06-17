with

customers as (

    select customer_id, 
    concat(customer_first_name, ' ', cusotmer_last_name) as name_complete
    from {{ ref('stg_customers') }}

),

orders as (
    select 
    id,
    user_id
    from {{ ref('stg_ecom__orders') }}
),

compute as 
(
    select 
    count(orders.id) as count_commands,
    customers.name_complete,
    from orders 
    left join customers on customers.customer_id = orders.user_id
    group by all

)
select * from compute