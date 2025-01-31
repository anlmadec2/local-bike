SELECT
    DATE_TRUNC(o.order_date, MONTH) as month,
    EXTRACT(YEAR FROM o.order_date) as order_year,
    EXTRACT(MONTH FROM o.order_date) as order_month,
    stores.store_name,
    stores.city,
    stores.state,
    staffs.first_name,
    staffs.last_name,
    COUNT(order_id) as total_orders,
    SUM(o.item_quantity) AS total_item_solds,
    SUM(o.total_order_item_amount) AS total_sales_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('stg_local_bike__stores') }} stores on stores.store_id = o.store_id
    INNER JOIN {{ ref('stg_local_bike__staffs') }} staffs on staffs.store_id = o.store_id
GROUP BY
    month,
    order_year,
    order_month,
    store_name,
    stores.city,
    stores.state,
    staffs.first_name,
    staffs.last_name