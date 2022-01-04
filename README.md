# datamesh-architecture.com

Engineering Perspective on Data

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

## Empowering Teams to do their own Data Analysis

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

### Example: Postgres

- good: easy
- bad: index optimization necessary, integration issues later on

### Example: BigQuery

- good: no performance issues, no storage costs

## Use Data from Other Teams

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

## Provide Data


## 




---

## What

## Why

## How

### GCP

### AWS

## Resources

### Books
