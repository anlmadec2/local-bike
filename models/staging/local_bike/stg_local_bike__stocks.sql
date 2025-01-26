SELECT
    CONCAT(store_id, "_", product_id) as stock_id,
    store_id,
    product_id,
    quantity
FROM {{ source('local_bike','stocks') }}
