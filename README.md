# datamesh-architecture.com

Engineering Perspective on Data

Bottom-up with management support (the hard way, but only the hard way works)

## Status Quo

Happy with:

- Strategy: DDD with bounded contexts
- Architecture: Microservice Architecture with REST-APIs and messages
- Orga: autonomous teams
- Operations: logging, monitoring

Unhappy with:

- Some other (data) team wants access to prod database
  - No SELECT * with REST APIs
- Very little insights on what's going on based on own data
  - Queries on data per production database (disadvantage: performance impact, index optimization for analytics, PII)
- Data warehouse are doing something to create reports for management
- Combine your own data with the data of other teams

Consequences:

- No data driven decisions
- Excel is everywhere, with all it's consequences
- Only C-level/controlling reports
- Slow creation of new reports
- Wrong reports because of lack of domain knowledge
- Broken reports because of data or schema changes

## Making Everybody Happy: Journey towards a Data Mesh

- Where we want to go: decentralization, applying same principles that made us successful and scalable on the operation part to the analytical part
- domain ownership for their own data: Before: UI+API After: UI+API+DATA

## Use Data from Yourself (Empowering Teams to do their own Data Analysis)

- let teams grow slowly
- bring data analytics skills/knowledge into the teams
  - data platform
  - advanced/analytical sql
  - visualization
- ingesting: bring own data into the data platform
  - PATTERNS
  - STRUCTURE

Consequences:
- cycle: hypothesis (could be exploratively created) -> verify with data -> improvements
- which pain posts have been solved now? "No data driven decisions"
- analytics enabled combining data from multiple microservices

_Example: Postgres_

- good: easy
- bad: index optimization necessary, integration issues later on

_Example: BigQuery_

- good: no performance issues, no storage costs

## Use Data from Other Teams: Bootstrap

- team used up all insights generated with own data -> data from upstream teams now necessary
- why? want to combine data to get even better insights
- data adapter: ingesting nightly operational data exports into team-owned data platform area
  - might not be feasable depending on the data format of the data
- challenge: knowledge of the data might be lacking
- PATTERNS
  - ELT, ETL

Examples: 
- BigQuery Nightly SQL Export
- Nightly File Export via sFTP
- Feed

Pain Points:
- New Technology for every team
- Freshness
- Domain Knowledge (OK, when data equals APIs)
- schema changes
- missing or duplicated data

Advantages:
- insights back to operation

## Use Data from Other Teams: Data Products

- another team wants data from your team -> the two teams talk -> define data API together
- first step towards data governance
- data governance: SLO, clean data
- governance has to grow with the teams

best practices:
- common platform (?)
- public views on private tables
- tags
- auth
- descriptions
- documentation
- PII anonymous

Advantages:
- enable other teams to provide insights back to operation

## Cut Prod Database Access

- team wants to cut any prod database access except their own systems -> forces data (warehouse) team to act
- requires talking with data (warehouse) team, collaboration, defining data apis (see provide data)

## Innovations

- at some point, enough teams have created and are using data products
- data product: charts, widgets, includes, report partials
- new domain teams: new features with ml teams (back to operations), selling data
- fast ad hoc analysis now possible


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
- data_products:       (orga-public) the actual data products that are used by other domains/teams
- queries:             (private) one time queries for ad hoc purposes that are stored for later use and inspection. Should not be used in reports.


Meta-Data:
- Added Timestamp
- Type
- Source System

---

## What

## Why

## How

### GCP

### AWS

## Resources

### Books
