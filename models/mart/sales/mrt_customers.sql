SELECT
    DATE_TRUNC(date_value, date_granularity) as month,
    EXTRACT(YEAR FROM o.order_date) as order_year,
    EXTRACT(MONTH FROM o.order_date) as order_month,
    c.city,
    c.state,
    COUNT(order_id) as total_orders,
    SUM(o.item_quantity) AS total_item_solds,
    SUM(o.total_order_item_amount) AS total_sales_amount,
    AVG(total_order_amount) as avg_order_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('stg_local_bike__customers') }} AS c on c.customer_id = o.customer_id
GROUP BY
    month,
    order_year,
    order_month,
    c.city,
    c.state