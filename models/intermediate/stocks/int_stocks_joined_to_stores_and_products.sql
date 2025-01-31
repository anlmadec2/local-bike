SELECT stocks.stock_id,
    stores.store_id,
    stores.store_name,
    stocks.product_id, 
    stocks.quantity as stock_quantity
FROM {{ ref('stg_local_bike__stocks') }} AS stocks
    INNER JOIN {{ ref('stg_local_bike__stores') }} AS stores on stocks.store_id = stores.store_id