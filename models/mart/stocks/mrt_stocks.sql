WITH product_orders AS (
    SELECT
        store_id, 
        product_id, 
        SUM(item_quantity) AS total_item_solds,
        SUM(total_order_item_amount) AS total_sales_amount
    FROM {{ ref('int_order_items_joined_to_orders') }}
    GROUP BY
        store_id, 
        product_id
)

SELECT
    s.store_id, 
    s.product_id, 
    s.store_name,
    p.product_name, 
    p.category_name,
    p.brand_name,
    s.stock_quantity,
    products_solds.total_item_solds,
    products_solds.total_sales_amount
FROM {{ ref('int_stocks_joined_to_stores_and_products') }} AS s
    INNER JOIN {{ ref('int_products_joined_to_category_and_brand') }} AS p on p.product_id = s.product_id
    INNER JOIN product_orders po on s.store_id = po.store_id and s.product_id = po.product_id