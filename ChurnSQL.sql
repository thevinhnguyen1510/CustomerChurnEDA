--1. How many customers left in total?
SELECT COUNT(*) AS SoLuongChurn
FROM Customer_Churn_Data
WHERE Churn = '1';

--2. What is the total number of customers by gender?
SELECT gender, COUNT(*) AS SoLuong
FROM Customer_Churn_Data
GROUP BY gender;

--3. Which Internet services do churning customers tend to use?
SELECT InternetService,
       COUNT(*) AS SoLuongChurn
FROM Customer_Churn_Data
WHERE Churn = '1'
GROUP BY InternetService;

--4. Find the highest monthly cost customers
SELECT TOP 1 customerID, MonthlyCharges
FROM Customer_Churn_Data
ORDER BY MonthlyCharges DESC

--5. Churn comparison between customers with and without dependents
SELECT Dependents,
       COUNT(*) AS SoLuong,
       SUM(CASE WHEN Churn = '1' THEN 1 ELSE 0 END) AS SoChurn,
       ROUND(SUM(CASE WHEN Churn = '1' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS TyLeChurn
FROM Customer_Churn_Data
GROUP BY Dependents;

--6. Which customers have the highest total spend (TotalCharges) but still churn?
SELECT TOP 5 customerID, TotalCharges, tenure, MonthlyCharges
FROM Customer_Churn_Data
WHERE Churn = '1'
ORDER BY TotalCharges DESC

--7. Compare the average cost of churning and non-churning customers
SELECT Churn, AVG(MonthlyCharges) AS AvgMonthlyCharge
FROM Customer_Churn_Data
GROUP BY Churn;





