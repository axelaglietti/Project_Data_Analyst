-- On-time delivery by Mode_of_Shipment
SELECT 
    Mode_of_Shipment, 
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / CAST(COUNT(*) AS FLOAT) * 100, 2) AS Pct_OnTime
FROM train
GROUP BY Mode_of_Shipment;

-- On-time delivery by Warehouse_block
SELECT 
    Warehouse_block, 
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / CAST(COUNT(*) AS FLOAT) * 100, 2) AS Pct_OnTime
FROM train
GROUP BY Warehouse_block;

-- On-time delivery by Product_importance
SELECT 
    Product_importance, 
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / CAST(COUNT(*) AS FLOAT) * 100, 2) AS Pct_OnTime
FROM train
GROUP BY Product_importance;