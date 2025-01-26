SELECT
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date,
    required_date,
    CASE
        WHEN shipped_date = 'NULL' THEN null
        ELSE shipped_date
    END AS shipped_date,    
FROM {{ source('local_bike','orders') }}
