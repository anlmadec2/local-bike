SELECT stocks.stock_id,
    stores.store_id,
    stores.store_name,
    stocks.product_id, 
    -- p.product_name,
    -- p.category_name,
    -- p.brand_name,
    stocks.quantity as stock_quantity
FROM {{ ref('stg_local_bike__stocks') }} AS stocks
    INNER JOIN {{ ref('stg_local_bike__stores') }} AS stores on stocks.store_id = stores.store_id
    -- INNER JOIN {{ ref('int_products_joined_to_category_and_brand') }} AS p on p.product_id = stocks.product_id