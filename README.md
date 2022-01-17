# datamesh-architecture.com

Domain Engineering Team Perspective on Data (from the engine room)

Bottom-up with management support (the hard way, but only the hard way works)

## Status Quo:

Happy with:

- Strategy: DDD with bounded contexts
- Architecture: Microservice Architecture with REST-APIs and Messaging
- Orga: autonomous teams
- Operations: Excellence with monitoring, logging.

Transformation from central monolith to decentralised systems has already happened/is happening

Unhappy with:

- Central data team wants access to prod database
  - Information hiding principle is violated 
    - Internal data structure becomes public API
    - Data team build ACL, but needs to maintain it most of their time -> frustration -> domain team will feel data team frustration
  - No SELECT * with REST APIs -> requires extract and load
- Team has little insights on what's going on based on own data
  - Queries on data per production database (disadvantage: performance impact, index optimization for analytics, PII)
- Data warehouse are doing something to create reports for management, but it is not clear how KPIs are calculated

Consequences:

- No data driven decisions
- Excel is everywhere, with all it's consequences
- Only C-level/controlling reports
- Slow creation of new reports
- Wrong reports because of lack of domain knowledge
- Broken reports because of data or schema changes
- No awareness for analytical data within a domain team

## Journey towards a Data Mesh

- Where we want to go: decentralization, applying same principles that made us successful and scalable on the operation part to the analytical part
- domain ownership for their own data
- Ownernship
  - Before: UI+API 
  - After: UI+API+DATA

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
  - Requires autonomous product teams
- which pain posts have been solved now? "No data driven decisions"
- analytics enabled combining data from multiple microservices

Maturity:
1. no data analysis
2. run queries on operational database
3. run queries on secondary node of operational database
4. build read model for data analysis
5. use big data technology

_Example: MongoDB Charts_

- run queries on operational database 

_Example: Postgres_

- good: easy
- bad: index optimization necessary, integration issues later on

_Example: BigQuery_

- good: no performance issues, no storage costs

Innovation Driver: 
- Data Platform is accessible through cloud providers
- Self-Service by cloud providers
- Product teams have shifted from feature development to product optimization 

## Use Data from Other Teams: Bootstrap/Importing

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






Data APIs
---
- central, logical separated SQL-like Database
- federated SQL-like Database
  - Presto
- GraphQL
- Feeds

