-- Customer care effectivness:
-- To analyze whether more Customer_care_calls correlate 
-- with delivery success (ReachedonTime_YN) or higher Customer_rating
WITH CallsBuckets AS (
    SELECT 
        CASE 
            WHEN Customer_care_calls BETWEEN 0 AND 2 THEN '0-2 Calls'
            WHEN Customer_care_calls BETWEEN 3 AND 5 THEN '3-5 Calls'
            WHEN Customer_care_calls > 5 THEN '>5 Calls'
        END AS Call_Bucket,
        ReachedonTime_YN,
        Customer_rating
    FROM train
)
SELECT 
    Call_Bucket,
    COUNT(*) AS Total_Deliveries,
    SUM(ReachedonTime_YN) AS OnTime_Deliveries,
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / COUNT(*) * 100, 2) AS OnTime_Percentage,
    ROUND(AVG(Customer_rating),2) AS Avg_Customer_Rating
FROM CallsBuckets
GROUP BY Call_Bucket
ORDER BY OnTime_Percentage DESC, Avg_Customer_Rating DESC;


-- Prior purchase trends:
-- To examine whether more Prior_purchases correlate with 
-- delivery success (ReachedonTime_YN) or higher Customer_rating
WITH PurchaseBuckets AS (
    SELECT 
        CASE 
            WHEN Prior_purchases BETWEEN 0 AND 2 THEN '0-2 Purchases'
            WHEN Prior_purchases BETWEEN 3 AND 5 THEN '3-5 Purchases'
            WHEN Prior_purchases > 5 THEN '>5 Purchases'
        END AS Purchase_Bucket,
        ReachedonTime_YN,
        Customer_rating
    FROM train
)
SELECT 
    Purchase_Bucket,
    COUNT(*) AS Total_Customers,
    SUM(ReachedonTime_YN) AS OnTime_Deliveries,
    ROUND(CAST(SUM(ReachedonTime_YN) AS FLOAT) / COUNT(*) * 100,2) AS OnTime_Percentage,
    ROUND(AVG(Customer_rating),2) AS Avg_Customer_Rating
FROM PurchaseBuckets
GROUP BY Purchase_Bucket
ORDER BY OnTime_Percentage DESC, Avg_Customer_Rating DESC;