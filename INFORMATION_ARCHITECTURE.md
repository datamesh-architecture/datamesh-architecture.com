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
   ├─ events
   ├─ aggregates
   ├─ external
   ├─ manual
   ├─ intermediates
   ├─ data_products
   ├─ explorative_data_analysis 
```

{stage}: prod (default), dev, test

- raw:                 (private) ingested data, typically with full payload in source format.
- events:              (private) Cleaned and structured domain events as published by operational system.
- aggregates:          (private) Cleaned and structured aggregates (business objects) as published by operational system.
- external:            (private) ingested data from external sources that do not offer data as products on the same platform; in a perfect world, this is not necessary
- manual:              (private) manually maintained data
- intermediates:       (private) extracted reusable queries/views, think of materialized Common Table Expressions (CTE); not helpful on their own, only through their multiple usages
- data_products:       (orga-public) the actual data products that are published to be used by other domains
- explorative_data_analysis: (private) one time queries and Jupyter notebooks for ad-hoc purposes that are stored for later use and inspection, but not actively maintained. Should not be used in reports.


Meta-Data:
- Added Timestamp
- Type
- Source System

