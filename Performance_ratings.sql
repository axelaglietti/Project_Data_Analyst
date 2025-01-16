-- Customer rating trends
-- To explore the distribution of Customer_rating across Warehouse_block and Mode_of_Shipment
SELECT 
    Warehouse_block,
    Mode_of_Shipment,
    ROUND(AVG(Customer_rating), 2) AS Avg_Customer_Rating,
    COUNT(*) AS Total_Shipments,
    SUM(CASE WHEN Customer_rating <= 2 THEN 1 ELSE 0 END) AS Low_Rating_Count,
    CAST(SUM(CASE WHEN Customer_rating <= 2 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100 AS Low_Rating_Percentage
FROM train
GROUP BY Warehouse_block, Mode_of_Shipment
ORDER BY Low_Rating_Percentage DESC, Avg_Customer_Rating ASC;

-- High-risk deliveries
-- To flag shipments likely to miss delivery targets using a 
-- combination of factors (Weight_in_gms, Discount_offered, Product_importance)
WITH HighRiskShipments AS (
    SELECT 
        ID,
        CASE 
            WHEN Weight_in_gms > 5000 THEN 1 ELSE 0 
        END AS High_Weight_Flag,
        CASE 
            WHEN Discount_offered > 10 THEN 1 ELSE 0 
        END AS High_Discount_Flag,
        CASE 
            WHEN Product_importance = 'low' THEN 1 ELSE 0 
        END AS Low_Importance_Flag
    FROM train
)
SELECT 
    COUNT(*) AS Total_Shipments,
    SUM(High_Weight_Flag) AS High_Weight_Shipments,
    SUM(High_Discount_Flag) AS High_Discount_Shipments,
    SUM(Low_Importance_Flag) AS Low_Importance_Shipments,
    SUM(CASE 
        WHEN High_Weight_Flag + High_Discount_Flag + Low_Importance_Flag >= 2 THEN 1 
        ELSE 0 
    END) AS High_Risk_Shipments,
    CAST(SUM(CASE 
        WHEN High_Weight_Flag + High_Discount_Flag + Low_Importance_Flag >= 2 THEN 1 
        ELSE 0 
    END) AS FLOAT) / COUNT(*) * 100 AS High_Risk_Percentage
FROM HighRiskShipments;
