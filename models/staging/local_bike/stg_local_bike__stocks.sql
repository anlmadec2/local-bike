SELECT
    store_id,
    product_id,
    quantity
FROM {{ source('local_bike','stocks') }}
