SELECT
    CONCAT(order_id, '-', item_id) as order_items_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price as price,
    discount as discount_percent
FROM {{ source('local_bike','order_items') }}
