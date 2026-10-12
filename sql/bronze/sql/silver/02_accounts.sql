

-- Silver Accounts Transformation

CREATE TABLE IF NOT EXISTS
  `project-0444c6ef-f266-4ba3-8f7.banking_silver.accounts`
AS
SELECT *
FROM
  `project-0444c6ef-f266-4ba3-8f7.banking_bronze.accounts`
WHERE AccountID IS NOT NULL
  AND CustomerID IS NOT NULL
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY AccountID
    ORDER BY CustomerID, BranchID
) = 1;
