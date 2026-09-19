--Total Customer
select count(*) as Total_Customers
from Churn_Table;

-- Total Churn Customers

SELECT COUNT(*)
FROM Churn_Table as Total_Churn_Customers
WHERE Churn='Yes';
-- Churn Rate

SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/
COUNT(*),2)
AS Churn_Rate
FROM Churn_Table;

--Average Monthly Charges
SELECT AVG(Monthly_Charges) as Average_Monthly_Charges
FROM Churn_Table;

-- Average_Tenure
SELECT AVG(Tenure_Months) as Average_Tenure
FROM Churn_Table;

--Churn by Contract Type
SELECT Contract_Type,
COUNT(*) Customers
FROM Churn_Table
GROUP BY Contract_Type;

--Churn by Internet Service
SELECT Internet_Service,
COUNT(*)
FROM Churn_Table
GROUP BY Internet_Service;

--Churn by State
SELECT State,
COUNT(*) 
FROM Churn_Table
WHERE Churn='Yes'
GROUP BY State
ORDER BY 2 DESC;

--Payment Method Wise Customers
SELECT Payment_Method,
COUNT(*)
FROM Churn_Table
GROUP BY Payment_Method;

--Subscription Type Wise Customers
SELECT Subscription_Type,
COUNT(*)
FROM Churn_Table
GROUP BY Subscription_Type;

--Highest Revenue States
SELECT State,
SUM(Total_Charges)
FROM Churn_Table
GROUP BY State
ORDER BY 2 DESC;

--Average Charges by Contract
SELECT Contract_Type,
AVG(Monthly_Charges)
FROM Churn_Table
GROUP BY Contract_Type;

--Senior Citizens Churn
SELECT Senior_Citizen,
COUNT(*)
FROM Churn_Table
WHERE Churn='Yes'
GROUP BY Senior_Citizen;

--Top 10 High Value Customers
SELECT Top 10 Customer_Name,
Customer_Value
FROM Churn_Table
ORDER BY Customer_Value DESC;

--Customers Without Tech Support
SELECT *
FROM Churn_Table
WHERE Tech_Support='No';

