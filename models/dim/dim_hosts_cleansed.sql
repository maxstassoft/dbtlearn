{{
    config(
        materialized = 'view'
    )
}}
WITH src_hosts AS (
    SELECT * FROM {{ ref("src_hosts") }}
)
SELECT
    host_id,
    CASE 
        WHEN host_name IS NULL THEN NVL(host_name, 'Anonymous')
        ELSE host_name
    END AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM
    src_hosts
