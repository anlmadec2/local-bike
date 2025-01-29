SELECT
    o.order_date,
    s.store_name,
    s.city,
    s.state,
    SUM(o.item_quantity) AS total_item_solds,
    SUM(o.total_order_item_amount) AS total_sales_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('stg_local_bike__stores') }} s on s.store_id = o.store_id
GROUP BY
    o.order_date,
    store_name,
    s.city,
    s.state