# GCP Banking Data Engineering Pipeline

An end-to-end hands-on banking analytics project using Google Cloud BigQuery, SQL, and the Bronze–Silver–Gold architecture.

**Project type:** Independent, hackathon-inspired practice project using synthetic banking data.

## Architecture

Synthetic CSV Sources → BigQuery Bronze → BigQuery Silver → BigQuery Gold → Banking Analytics

## Technology Stack

- Google Cloud Platform (GCP)
- BigQuery Sandbox
- SQL (GoogleSQL)
- Data ingestion, transformation, validation, and reconciliation

## Implementation

### Bronze Layer
- Loaded synthetic Customers, Accounts, Branches, and Transactions datasets.
- Investigated malformed CSV ingestion and corrected transaction schemas using SAFE_CAST.

### Silver Layer
- Standardized records using TRIM and LOWER/UPPER.
- Applied ROW_NUMBER and QUALIFY for deduplication.
- Implemented mandatory-field and referential-integrity checks.

### Gold Layer
- Created a daily transaction summary grouped by transaction date, type, and currency.
- Calculated transaction counts, total amounts, and averages.

## Validated Practice Results

| Metric | Result |
|---|---:|
| Customers | 100 |
| Accounts | 160 |
| Branches | 8 |
| Clean transactions | 5 |
| Silver-to-Gold transaction count difference | 0 |
| Silver-to-Gold amount difference | 0 GBP |

## Engineering Learnings

- Successful query execution does not guarantee correct data.
- Schema inference, duplicate records, and missing keys require explicit validation.
- Source-to-target reconciliation is essential for financial reporting.

## Next Steps

- Add reusable SQL scripts and synthetic input samples.
- Expand Gold reporting and data-quality tests.
- Document deployment, rerun, and operational practices.

## Data Disclaimer

All example datasets are synthetic and created for learning. No confidential employer, client, or hackathon datasets are included. This is a portfolio practice implementation, not a production deployment.
