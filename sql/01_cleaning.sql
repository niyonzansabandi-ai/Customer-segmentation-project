-- 1. Inspect raw data
SELECT *
FROM retail_customers;

-- 2. Check for missing values
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Missing_Region,
    SUM(CASE WHEN TotalSpend IS NULL THEN 1 ELSE 0 END) AS Missing_TotalSpend,
    SUM(CASE WHEN PurchaseFrequency IS NULL THEN 1 ELSE 0 END) AS Missing_PurchaseFrequency,
    SUM(CASE WHEN LoyaltyScore IS NULL THEN 1 ELSE 0 END) AS Missing_LoyaltyScore
FROM retail_customers;

-- 3. Standardize region names (if needed)
UPDATE retail_customers
SET Region = CASE
    WHEN Region IN ('west', 'West ', 'WEST') THEN 'West'
    WHEN Region IN ('south', 'South ', 'SOUTH') THEN 'South'
    WHEN Region IN ('east', 'East ', 'EAST') THEN 'East'
    WHEN Region IN ('north', 'North ', 'NORTH') THEN 'North'
    ELSE Region
END;

-- 4. Remove impossible values (negative spend, negative frequency)
DELETE FROM retail_customers
WHERE TotalSpend < 0
   OR PurchaseFrequency < 0
   OR LoyaltyScore < 0;
