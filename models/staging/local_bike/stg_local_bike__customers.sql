SELECT
    customer_id,
    first_name,
    last_name,
    CASE WHEN
        phone = 'NULL' THEN NULL
        ELSE phone
    END as phone,
    email,
    street,
    city,
    state,
    zip_code
FROM {{ source('local_bike','customers') }}
