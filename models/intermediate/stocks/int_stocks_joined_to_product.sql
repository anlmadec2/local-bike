SELECT stocks.stock_id,
    stocks.store_id, 
    stores.store_name,
    stocks.product_id, 
    products.product_name,
    products.brand_id,
    brands.brand_name,
    products.category_id,
    categories.category_name,
    stocks.quantity as stock_quantity
FROM {{ ref('stg_local_bike__stocks') }} AS stocks
    INNER JOIN {{ ref('stg_local_bike__stores') }} AS stores on stocks.store_id = stores.store_id
    INNER JOIN {{ ref('stg_local_bike__products') }} AS products on products.product_id = stocks.product_id
    INNER JOIN {{ ref('stg_local_bike__brands') }} AS brands on brands.brand_id = products.brand_id
    INNER JOIN {{ ref('stg_local_bike__categories') }} AS categories on categories.category_id = products.category_id