
-- Silver transaction transformation
-- Validate, standardize and deduplicate records

CREATE TABLE IF NOT EXISTS
  `project-0444c6ef-f266-4ba3-8f7.banking_silver.transactions`
AS
SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TRIM(TransactionType) AS TransactionType,
    Amount,
    UPPER(TRIM(Currency)) AS Currency,
    TRIM(Channel) AS Channel
FROM
    `project-0444c6ef-f266-4ba3-8f7.banking_bronze.transactions_clean`
WHERE
    TransactionID IS NOT NULL
    AND AccountID IS NOT NULL
    AND TransactionDate IS NOT NULL
    AND Amount IS NOT NULL
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY TransactionID
    ORDER BY TransactionDate DESC, AccountID
) = 1;

