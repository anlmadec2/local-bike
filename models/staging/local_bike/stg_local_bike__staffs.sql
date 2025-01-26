SELECT
    staff_id,
    store_id,
    CASE
        WHEN manager_id = 'NULL' THEN null
        ELSE manager_id
    END AS manager_id,
    first_name,
    last_name,
    email,
    phone,
    CASE
        WHEN active = 1 THEN true
        ELSE false
    END AS is_active
FROM {{ source('local_bike','staffs') }}
