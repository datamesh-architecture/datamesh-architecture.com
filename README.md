# Data Mesh Architecture: Data Mesh from an Engineering Perspective

Today, data analysis is central to the success of companies, but it's hard to scale.
Data Mesh addresses the issue of scaling of a central data team in a world of decentralised domain teams.
The goal of this website is to *focus on the engineering perspective of the domain teams* and to give advice and examples how to organize, build, and operate a Data Mesh within your organization.

> **Data Mesh Architecture** is a decentralised architecture that enables domain teams to perform cross-domain data analysis on their own.

- [ ] TODO: Picture of the Data Mesh Concept.

The term *Data Mesh* was coined by [Zhamak Dehghani](https://martinfowler.com/articles/data-monolith-to-mesh.html).

## Why

![](datamesh-overview.jpg)

- status quo 1: Value proposition perspective
 - innovative product development: improve existing products or create new products

## Data Mesh Principles
Data Mesh builds upon four principles: 

1. __Domain Ownership__ TODO...
1. __Data as a Product__ TODO...
1. __Self-Serve Data Platform__ TODO...
1. __Computational Federated Governance__ TODO... 



## Case Study


## Data Mesh Maturity Model

![](datamesh-maturity.png)

TODO: schönere Grafik

This maturity model describes the evolution of a domain team in a data mesh architecture.

Level 0: No data analysis.

Level 1: Operational database queries.
- Variant: query on secondary nodes

Level 2: Analyze own data on self-serve data platform.
- Includes ingesting, storage, analysis, visualization.
- Variant: custom analytical postgres DB

Level 3: Combine own with data from other domains.
- Includes discoverability and access
- Use a data catalog

Level 4: Publish data as a product.
- Build and maintain data product
- Operational monitoring
- Describe data product in catalog

## Architecture Components

- Data Ingesting
- Data Storage
- Information Architecture: Raw, ...
- Pipelines
- Clean Data
- Data Access
- Data Catalog
- Analysis
- Visualisation
- Results: Dataset, ML Models, Report, KPI, Events
- Feedback Loops: Insights -> Business Value
- Security
- Monitoring

### Storage

Storing data is a primary purpose of any data platform.
As hundreds of terabytes and more may be stored on the platform, storage should be cost-efficient.
It should also provide good performance for analytical queries.
As we need to handle large datasets and typically need processing power only for a few seconds to run analytical queries, cloud-based services fit very well to storage requirements, but there are on-premise and open-source alternatives (TODO: link) as well.

There are different types of storage options that optimize for the origin of data and the analytical use cases:

__SQL-like databases__

Most common are _SQL-like databases_ that store data in tables that have a structured schema.
These databases use columnar data stores to retrieve and search large datasets efficiently,
hence there is no support for indexes.
For smaller datasets is also possible to use traditional relational databases, but these will require more storage management efforts and index optimizations to build efficient queries.
Data is often ingested in a semi-structurted format into a clob field, mostly in JSON format. 
Hence, the database should be capable to parse JSON and to support array structures.

_Cloud Services: Google BigQuery, AWS Redshift, Snowflake Data_  
_On-Premise Alternative: PostgreSQL/Greenplum_


__Optional: _Object Storage___

In some use cases, data needs to be exported from operative or third party systems as files, such as CSV, JSON or XML. The data platform should support to store file-oriented data, that can be further processed or analyzed.

_Cloud Services: Google Object Store, AWS S3_  
_On-Premise Alternative: MinIO, Ceph_


__Optional: _Streaming___

For high-volume realtime data, it might be inappropriate to store all events permanently.
A _streaming_ platform with short-time rentetion can be the suitably technology to perform realtime analytics.

_Cloud Services: Confluent Kafka, AWS MSK, AWS Kinesis (Note: there is no real alternative on Google Cloud)_  
_On-Premise Alternative: Apache Kafka_



## Organisation

- Domain-aligned Teams
- Team Structure / Team Topology
- More scope, Skillset
- Role of Data Team
  - Manage Platform
  - Enabling (Templates, ...)
  - Consulting
  - Form new domain teams
- Governance
  - Guilds
  - Define Global Policies
- Requirements -> Data Product







## Backup

Data Ingesting
- Operative Systems to Analytical Platform
- Patterns: ETL vs Streaming
- External Data
- Examples:
  - Cloud Functions
  - Spring Boot Service 
  - Dataflow / Apache Beam

Data Storage
- Cloud
- Streaming?
- Examples:
  - BigQuery


Data API/Endpoints/Ports
- Types: Dataset, Dashboard, Report
- Feedback back to operative Systems

Data Catalog
- Meta data
- Best Practices
- Examples: 
  - Confluence
  - Git Repo
  - Google Data Catalog

Security
- PII






## FAQ

- Ab welcher Organisationsgröße lohnt sich Data Mesh?

# Resources


# Authors
Jochen Christ
Simon Harrer
Larysa Visengeriyeva




