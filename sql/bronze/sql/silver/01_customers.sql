
-- Silver Customer Transformation

CREATE TABLE IF NOT EXISTS
  `project-0444c6ef-f266-4ba3-8f7.banking_silver.customers`
AS
SELECT
    CustomerID,
    TRIM(FirstName) AS FirstName,
    TRIM(LastName) AS LastName,
    LOWER(TRIM(Email)) AS Email,
    TRIM(City) AS City,
    TRIM(Status) AS Status
FROM
    `project-0444c6ef-f266-4ba3-8f7.banking_bronze.customers`
WHERE CustomerID IS NOT NULL
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY CustomerID
    ORDER BY FirstName, LastName, Email
) = 1;

