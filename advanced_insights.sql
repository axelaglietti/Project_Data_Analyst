-- Clustering for delivery risk
-- To group shipments into high, medium, and low-risk categories based on 
-- factors like Weight_in_gms, Mode_of_Shipment, and Discount_offered
WITH RiskFactors AS (
    SELECT 
        ID,
        CASE 
            WHEN Weight_in_gms > 5000 THEN 2
            WHEN Weight_in_gms BETWEEN 1000 AND 5000 THEN 1
            ELSE 0
        END AS Weight_Risk,
        CASE 
            WHEN Discount_offered > 15 THEN 2
            WHEN Discount_offered BETWEEN 5 AND 15 THEN 1
            ELSE 0
        END AS Discount_Risk,
        CASE 
            WHEN Mode_of_Shipment = 'Ship' THEN 2
            WHEN Mode_of_Shipment = 'Road' THEN 1
            ELSE 0
        END AS Shipment_Risk
    FROM train
),
RiskClusters AS (
    SELECT 
        ID,
        Weight_Risk + Discount_Risk + Shipment_Risk AS Total_Risk,
        CASE 
            WHEN Weight_Risk + Discount_Risk + Shipment_Risk >= 4 THEN 'High Risk'
            WHEN Weight_Risk + Discount_Risk + Shipment_Risk BETWEEN 2 AND 3 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS Risk_Cluster
    FROM RiskFactors
)
SELECT 
    Risk_Cluster,
    COUNT(*) AS Total_Shipments,
    SUM(CASE WHEN Risk_Cluster = 'High Risk' THEN 1 ELSE 0 END) AS High_Risk_Count,
    SUM(CASE WHEN Risk_Cluster = 'Medium Risk' THEN 1 ELSE 0 END) AS Medium_Risk_Count,
    SUM(CASE WHEN Risk_Cluster = 'Low Risk' THEN 1 ELSE 0 END) AS Low_Risk_Count
FROM RiskClusters
GROUP BY Risk_Cluster
ORDER BY Total_Shipments DESC;

-- Impact of Gender on ratings
-- To analyze whether Gender influences Customer_rating or the frequency of Customer_care_calls
SELECT 
    Gender,
    ROUND(AVG(Customer_rating), 2) AS Avg_Customer_Rating,
    ROUND(AVG(Customer_care_calls), 2) AS Avg_Customer_Care_Calls,
    COUNT(*) AS Total_Customers
FROM train
GROUP BY Gender
ORDER BY Avg_Customer_Rating DESC, Avg_Customer_Care_Calls DESC;
