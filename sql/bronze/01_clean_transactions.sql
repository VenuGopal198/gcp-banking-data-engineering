
-- Banking project: Repair malformed CSV ingestion
-- Input: Bronze raw transactions
-- Output: Bronze transactions_clean

CREATE TABLE IF NOT EXISTS
  `project-0444c6ef-f266-4ba3-8f7.banking_bronze.transactions_clean`
AS
SELECT
  SAFE_CAST(string_field_0 AS INT64) AS TransactionID,
  SAFE_CAST(string_field_1 AS INT64) AS AccountID,
  SAFE_CAST(string_field_2 AS DATE) AS TransactionDate,
  string_field_3 AS TransactionType,
  SAFE_CAST(string_field_4 AS NUMERIC) AS Amount,
  string_field_5 AS Currency,
  string_field_6 AS Channel
FROM
  `project-0444c6ef-f266-4ba3-8f7.banking_bronze.transactions`
WHERE
  SAFE_CAST(string_field_0 AS INT64) IS NOT NULL;
