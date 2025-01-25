SELECT
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status, -- case when todo
    order_date,
    required_date,
    shipped_date    
FROM {{ source('local_bike','orders') }}
