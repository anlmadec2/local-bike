SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    b.brand_name
FROM {{ ref('stg_local_bike__products') }} as p
    INNER JOIN {{ ref('stg_local_bike__categories')}} as c ON c.category_id = p.category_id
    INNER JOIN {{ ref('stg_local_bike__brands') }} as b ON b.brand_id = p.brand_id