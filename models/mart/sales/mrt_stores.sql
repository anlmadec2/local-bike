SELECT
    order_date,
    store_name
    city,
    state,
    SUM(item_quantity) AS total_item_solds,
    SUM(total_order_item_amount) AS total_sales_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('stg_local_bike__stores') }} AS s on s.store_id = o.store_id
GROUP BY
    order_date,
    store_name,
    city,
    state,