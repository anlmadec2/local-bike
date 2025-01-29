SELECT
    order_date,
    p.product_name, 
    p.category_name,
    p.brand_name,
    SUM(item_quantity) AS total_item_solds,
    SUM(total_order_item_amount) AS total_sales_amount
FROM {{ ref('int_order_items_joined_to_orders') }} o
    INNER JOIN {{ ref('int_products_joined_to_category_and_brand') }} AS p on p.product_id = o.product_id
GROUP BY
    order_date,
    p.product_name, 
    p.category_name,
    p.brand_name,