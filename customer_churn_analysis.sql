CREATE DATABASE churn_db;
USE churn_db;

SELECT COUNT(*) AS total_rows 
FROM customer_churn;

DESCRIBE customer_churn;

SELECT *
FROM customer_churn
LIMIT 10;

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;

SELECT 
   contract,
   COUNT(*) AS total_customers,
   SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) AS 
churned_customers,
   ROUND(
        SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) *
100.0 / COUNT(*),
       2
	) AS churn_rate
FROM customer_churn
GROUP BY contract 
ORDER BY churn_rate DESC;

SELECT 
   paymentMethod,
   COUNT(*) AS total_customers,
   SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) AS 
churned_customers,
ROUND(
     SUM(CASE WHEN churn = 'yes' 
THEN 1 ELSE 0 END ) *
100.0 / COUNT(*),
   2
) AS churn_rate
FROM customer_churn
GROUP BY paymentMethod
ORDER BY churn_rate DESC;

SELECT 
     CASE 
         WHEN tenure <= 12 THEN '0-1 year'
         WHEN tenure <= 24 THEN '1-2 years'
         WHEN tenure <= 48 THEN '2-4 years'
         WHEN tenure <= 60 THEN '4-5 years'
         ELSE '5+ years'
	END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) AS 
churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'yes' 
    THEN 1 ELSE 0 END) *
    100.0 / COUNT(*),
        2
        ) AS churn_rate 
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT 
   CASE 
       WHEN Monthlycharges < 30 THEN 'Low (<30)' 
	  WHEN Monthlycharges < 70 THEN 'Medium (30-70)'
      ELSE 'High (70)'
	END AS charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) AS churned_customers,
   ROUND(
       SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) *
100.0 / COUNT(*),
    2
    )AS churn_rate 
    FROM customer_churn 
    GROUP BY charge_group
    ORDER BY churn_rate DESC;
    
    SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;

SELECT 
    CONTRACT,
    internetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes'
THEN 1 ELSE 0 END) AS
churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'yes' 
THEN 1 ELSE 0 END )*100.0 / COUNT(*),
   2
) AS churn_rate
FROM customer_churn
GROUP BY CONTRACT, InternetService 
ORDER BY churn_rate DESC;
      
SELECT
    Contract,
    PaymentMethod,
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Contract, PaymentMethod, InternetService
ORDER BY churn_rate DESC
LIMIT 5;

SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2)
AS average_monthly_cahrge
FROM customer_churn
GROUP BY churn;

churn by gender 

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY gender 
ORDER BY churn_rate DESC;

SERVICE USED BY CUSTOMERS 

SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
        FROM customer_Churn
        GROUP BY OnlineSecurity
        ORDER BY churn_rate DESC;
        
TECH SUPPORT 

SELECT 
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;
    

