# Information Architecture

Obviously, domain data should be separated by domain.
But this data still has different characteristics.
Raw data that is freshly imported may be in plain JSON and is incomplete or have duplicated.
Data that is provided as products for other teams is more mature and has stronger requirements
regarding stability and documentation.

A good structure helps to organize data by characteristics.
We want to share a structure that works well for us:

```
└─ {organization}-{domain}[-{stage}]
   ├─ raw
   ├─ raw_external
   ├─ intermediates
   ├─ information_objects
   ├─ data_products
   ├─ queries 
```

- raw:                 (private) ingested data, typically with full payload in source format. Result of Extracted and Loaded.
- raw_external:        (private) ingested data from external sources that do not offer data as products on the same platform, otherwise similar to raw; in a perfect world, this is not necessary
- intermediates:       (private) extracted reusable queries/views, think of materialized Common Table Expressions (CTE); not helpful on their own, only through their multiple usages
- information_objects: (private) the actual data products that are used by this domain for reports etc.
- data_products:       (orga-public) the actual data products that are used by this domain and other domains/teams
- queries:             (private) one time queries for ad hoc purposes that are stored for later use and inspection. Should not be used in reports.


Types of data:
- Aggregates (Term is overloaded!)
- Domain Events
- Streams (z. B. Clickstreams, Logfiles, Sensordata)
- Manually maintained tables

Meta-Data:
- Added Timestamp
- Type
- Source System

## Example

```
└─ yetanotheronlineshop-fulfillment
   ├─ raw
      ├─ stock_events
         ├─ attr: location_id, article_id, available, updated_at, inserted_at
   ├─ raw_external
   ├─ intermediates
   ├─ information_objects
   ├─ data_products
   ├─ queries 
```
