# Ingesting Patterns

_Streaming_ instead of _Extract and Load_.

Why?
Enable realtime analysis.
Enable time series analysis.
Simpler, as date/time staging pipelines are not required.


## Public Domain Events
(API contract): Stream to Data Platform

- Idea: Generate schema from asyncapi.yaml
- What happens with schema changes?

## Internal Events
(unstable data structures): Stream to Data Platform

- Implementation as analytical events is more pragmatic (shift transformation to data platform)

## Analytical Events
New events just for analysis purposes, app must be extended (e.g. with library/spec/instrumentation): Stream to Data Platform

- Generic Event structure
  - type
  - timestamp
  - any JSON payload
- 1 topic per domain/app?

## Change Data Capture
Make database table changes to events.

- 1 topic per database table
- A tranformation to desired data model is usually required.
- May require initial snapshots?
- TBD: what happens when service is down?

## File export and import

Not recommended, as not streamed. 

- Streaming adapter for legacy systems. 
- triggered/scheduled import

# PII processing

- Data Removal: Allow-List or Excluded field-lists.
- Masking: *****
- Hashing

Where?
- Ingester
- Data Platform
  - Raw/Data pool is always restricted
  - Labeling: Auto Processing by data platform
  - Lambda

