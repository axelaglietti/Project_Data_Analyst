-- Mode of shipment efficiency:
-- To compare delivery success rates by Mode_of_Shipment and 
-- identify the most reliable modes for each Warehouse_block
WITH ShipmentEfficiency AS (
    SELECT 
        Warehouse_block,
        Mode_of_Shipment,
        COUNT(*) AS Total_Deliveries,
        SUM(ReachedonTime_YN) AS OnTime_Deliveries,
        ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / COUNT(*) * 100,2) AS OnTime_Percentage
    FROM train
    GROUP BY Warehouse_block, Mode_of_Shipment
)
SELECT 
    Warehouse_block, 
    Mode_of_Shipment,
    Total_Deliveries,
    OnTime_Deliveries,
    OnTime_Percentage,
    RANK() OVER (PARTITION BY Warehouse_block ORDER BY OnTime_Percentage DESC) AS Reliability_Rank
FROM ShipmentEfficiency
ORDER BY Warehouse_block, Reliability_Rank;

-- Weight analysis:
-- To analyze the relationship between Weight_in_gms and delivery success, 
-- divide weights into ranges (e.g., light, medium, heavy), calculate on-time 
-- delivery percentages for each range, and identify trends.
WITH WeightBuckets AS (
    SELECT 
        CASE 
            WHEN Weight_in_gms < 2000 THEN 'Light (<2kg)'
            WHEN Weight_in_gms BETWEEN 1000 AND 5000 THEN 'Medium (2-5kg)'
            WHEN Weight_in_gms > 5000 THEN 'Heavy (>5kg)'
        END AS Weight_Category,
        ReachedonTime_YN
    FROM train
)
SELECT 
    Weight_Category,
    COUNT(*) AS Total_Shipments,
    SUM(ReachedonTime_YN) AS OnTime_Shipments,
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / COUNT(*) * 100,2) AS OnTime_Percentage
FROM WeightBuckets
GROUP BY Weight_Category
ORDER BY OnTime_Percentage DESC;