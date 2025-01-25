SELECT
    staff_id,
    store_id,
    manager_id,
    first_name,
    last_name,
    email,
    phone,
    active as is_active
FROM {{ source('local_bike','products') }}
