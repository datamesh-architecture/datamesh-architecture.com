
### Google Cloud

- Ingestion: BigQuery Ingest (from Feeds, Kafka Topics, Database Exports)
- Storage: BigQuery
- Queries: BigQuery SQL
- Data Discovery: Data Catalog
- Vizualization: Google Datastudio
- Authentication: Google IAM



### AWS

https://dev.to/aws-builders/data-mesh-on-aws-57ah

- Ingestion: AWS Glue (?)
- Storage: S3
- Queries: Amazon Athena
- Data Discovery: AWS Glue Data Catalog (?)
- Vizualization: Amazon QuickSight
- Authentication: AWS IAM & RAM


### Azure

### Snowflake

### On-Premise

Generally, not a very good idea.

Postgres
How to query multiple data sources?

postgres_fdw https://www.postgresql.org/docs/current/postgres-fdw.html


dblink (Postgres only) https://www.postgresql.org/docs/current/dblink.html
```
CREATE EXTENSION IF NOT EXISTS dblink;

SELECT * 
FROM   table1 tb1 
LEFT   JOIN (
   SELECT *
   FROM   dblink('dbname=db2','SELECT id, code FROM table2')
   AS     tb2(id int, code text);
) AS tb2 ON tb2.column = tb1.column;
```

https://prestodb.io


Exasol? (In Memory, Connects to virtual data sources)
