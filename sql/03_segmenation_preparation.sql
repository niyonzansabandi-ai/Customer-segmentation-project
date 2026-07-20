-- Export clean segmentation dataset

SELECT
    CustomerID,
    Age,
    Gender,
    Region,
    TotalSpend,
    PurchaseFrequency,
    LoyaltyScore,
    CategorySpend_Electronics,
    CategorySpend_Clothing,
    CategorySpend_Grocery,
    DATEDIFF(day, LastPurchaseDate, '2024-12-31') AS Recency
FROM retail_customers;
