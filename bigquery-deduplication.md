BigQuery Deduplication
---

- time when inserted into BigQuery to order by (a timestamp field)
- deduplication field (some ID)

```sql
MERGE `mytable` target
USING (
          SELECT
            * EXCEPT(row_number)
          FROM (
            SELECT
              *,
              ROW_NUMBER() OVER (PARTITION BY idempotencyId ORDER BY timestamp DESC) row_number
            FROM `target`)
          WHERE
            row_number = 1
          AND
            timestamp < TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 MINUTE)
) source
ON FALSE
WHEN NOT MATCHED BY SOURCE AND timestamp < TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 MINUTE) THEN DELETE
WHEN NOT MATCHED BY TARGET AND timestamp < TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 MINUTE) THEN INSERT ROW
```

#### Learning

- `select distinct` is not sufficient, esp. when created timestamps differ
- select and write to same table is not atomic
- always have a field with instant.now in the event, set the instant now right before sending the info to bigquery
- When streaming is used `bigquery.insertAll()`, the stream buffer cannot be manipulated by merge, it takes 30-90 minutes, until the entries are written to columnar storage.

