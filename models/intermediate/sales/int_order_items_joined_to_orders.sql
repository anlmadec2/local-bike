select
    oi.order_item_id,
    oi.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.store_id,
    o.staff_id,
    oi.product_id,
    item_quantity,
    item_price,
    discount,
    total_order_item_amount
from {{ ref('stg_local_bike__order_items') }} AS oi
    INNER JOIN {{ ref('stg_local_bike__orders') }} AS o ON o.order_id = oi.order_id