SELECT
    CONCAT(order_id, "_", item_id) as order_items_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price as price,
    discount as discount_percent,
    quantity * list_price * (1 - discount) as total_order_item_amount
FROM {{ source('local_bike','order_items') }}
