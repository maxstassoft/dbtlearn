WITH
l AS (
    SELECT
        *
    FROM
        {{ ref('dim_listings_cleansed') }}
),
r AS (
    SELECT * 
    FROM {{ ref('fct_reviews') }}
)

SELECT
    *
FROM l
LEFT JOIN r ON (l.listing_id = r.listing_id)
WHERE r.review_date < l.created_at
