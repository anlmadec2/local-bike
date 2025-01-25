SELECT
    product_id,
    brand_id,
    category_id,
    product_name,
    model_year,
    list_price as price
FROM {{ source('local_bike','products') }}
