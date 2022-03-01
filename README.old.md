# Data Mesh Architecture: Data Mesh from an Engineering Perspective

Today, data analysis is central to the success of companies, but it's hard to scale.
Data Mesh addresses the issue of scaling of a central data team in a world of decentralised domain teams.
The goal of this website is to *focus on the engineering perspective of the domain teams* and to give advice and examples how to organize, build, and operate a Data Mesh within your organization.

> **Data Mesh Architecture** is a decentralised architecture that enables domain teams to perform cross-domain data analysis on their own.

The term *Data Mesh* was coined by [Zhamak Dehghani](https://martinfowler.com/articles/data-monolith-to-mesh.html).


## Data Mesh Principles
Data Mesh builds upon four principles: 

1. __Domain Ownership__ TODO...
1. __Data as a Product__ TODO...
1. __Self-Serve Data Platform__ TODO...
1. __Computational Federated Governance__ TODO... 


## Architecture Components

- Data Storage
- Information Architecture: Raw, ...
- Data Ingesting
  - Streaming
  - ELT wenn es sein muss
- Data Preparation
  - Deduplicate
  - Parsing (JSON -> Columns)
  - Schema Migrations / Null Fields
  - Anonymize
- Analysis & Visualisation
- Daat as a Product: Data API
  - Virtual
  -  e.g. View
- Data Access
  - Access Policy
  - Authentication
- Data Catalog
- Monitoring
- Results: Dataset, ML Models, Report, KPI, Events
- Feedback Loops: -> Back to operational Systems


### Storage

Storing data is a primary purpose of any data platform.
As hundreds of terabytes and more may be stored on the platform, storage should be cost-efficient.
It should also provide good performance for analytical queries.

There are different types of storage options that optimize for the origin of data and the analytical use cases:

__SQL-like databases__

Most common are _SQL-like databases_ that store data in tables with a structured schema.
These databases usually use columnar data stores to retrieve and search large datasets efficiently, hence there is no need for indexes.
For smaller datasets is also possible to use traditional relational databases, but these will require more storage management efforts and index optimizations to build efficient queries.
Data is often ingested in a semi-structurted format into a CLOB field, mostly in JSON format. 
Hence, the database should be capable to parse JSON and to support array structures.

_Cloud Service Examples: Google BigQuery, AWS Redshift, Azure Synapse Ananlytics, Snowflake_  
_On-Premise Alternative: PostgreSQL/Greenplum_


__Optional: _Object Storage___

In some use cases, data needs to be exported from operative or third party systems as files, such as CSV, JSON or XML.
The data platform may need support to store file-oriented data, that can be further processed or analyzed.
We recommend not to use file-based datasets, but in some cases this is the most pragmatic option.

_Cloud Service Examples: Google Object Store, AWS S3_  
_On-Premise Alternative: Git, SMB Fileshare, MinIO, Ceph_


__Optional: _Topics / Streaming___

For high-volume realtime data, it might be inappropriate to store all events permanently.
A _streaming_ platform with short-time rentetion can be the suitably technology to perform realtime analytics.

_Cloud Service Examples: Confluent Kafka, AWS MSK, AWS Kinesis (Note: there is no real alternative on Google Cloud)_  
_On-Premise Alternative: Apache Kafka_

### Storage Topology: Shared, Separated, Federated?

Modern software systems are build independently and self-contained for a given bounded context.
Engineers made great efforts to eliminate shared databases and monolithic structures to enforce loose coupling.

In a Data Mesh environment accessing data from other domains happens through database access.

- Same Database, separated realms by domin
- Separate Database, federated queries
  - Presto


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




