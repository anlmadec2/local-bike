SELECT
    DATE_TRUNC(o.order_date, MONTH) as month,
    EXTRACT(YEAR FROM o.order_date) as order_year,
    EXTRACT(MONTH FROM o.order_date) as order_month,
    p.product_name, 
    p.category_name,
    p.brand_name,
    COUNT(order_id) as total_orders,
    SUM(o.item_quantity) AS total_item_solds,
    SUM(o.total_order_item_amount) AS total_sales_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('int_products_joined_to_category_and_brand') }} AS p on p.product_id = o.product_id
GROUP BY
    month,
    order_year,
    order_month,
    p.product_name, 
    p.category_name,
    p.brand_name