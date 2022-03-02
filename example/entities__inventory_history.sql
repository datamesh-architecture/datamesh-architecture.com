-- Step 1: Deduplicate
WITH inventory_deduplicated AS (
    SELECT *
    EXCEPT (row_number)
    FROM (
       SELECT *,
              ROW_NUMBER() OVER (PARTITION BY id ORDER BY time DESC) row_number
       FROM `datameshexample-fulfillment.raw.inventory`)
    WHERE row_number = 1
),
-- Step 2: Parse JSON to columns
inventory_parsed AS (
    SELECT
        json_value(data, "$.sku")                           AS sku,
        json_value(data, "$.location")                      AS location,
        CAST(json_value(data, "$.available") AS int64)      AS available,
        CAST(json_value(data, "$.updated_at") AS timestamp) AS updated_at,
    FROM inventory_deduplicated
)
-- Step 3: Actual Query
SELECT sku, location, available, updated_at
FROM inventory_parsed
ORDER BY sku, location, updated_at