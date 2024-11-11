Create Database Capstone_Customer_Data

Select * from [dbo].[Capstone Customer Data]

Delete from [dbo].[Capstone Customer Data]
where CustomerID is null


-----Total number of customers from each region-------
Select Region, count(distinct CustomerID) as
Total_Number_of_Customers
from [dbo].[Capstone Customer Data]
Group by Region;


-----Most popular subscription type by the number of customers-----
Select Top 1 SubscriptionType, count(DISTINCT CustomerID) as Total_Number_of_Customers
from [dbo].[Capstone Customer Data]
Group by SubscriptionType
Order by Total_Number_of_Customers Desc;


-----Customers who canceled their subscription within 6 months------
SELECT CustomerID
FROM [dbo].[Capstone Customer Data]
WHERE DATEDIFF(MONTH, 2022-01-31, 2023-12-31) <= 6;

-----The average subscription duration for all customers-------
SELECT AVG (Subscription_Duration) As Average_SubscriptionDuration
FROM [dbo].[Capstone Customer Data]


-----Customers with subscriptions longer than 12 months-----
SELECT CustomerID 
FROM [dbo].[Capstone Customer Data]
WHERE DATEDIFF(MONTH, 2022-01-31, 2023-12-31) > 12;

---- Total revenue by subscription type-----
SELECT SubscriptionType, SUM(revenue) as TotalRevenue
FROM [dbo].[Capstone Customer Data]
GROUP BY SubscriptionType;


----The top 3 regions by subscription cancellations------
SELECT Region, COUNT(*) AS SubscriptionEnd_Count
FROM [dbo].[Capstone Customer Data]
WHERE SubscriptionEnd is null
GROUP BY Region
ORDER BY SubscriptionEnd_Count desc;

SELECT TOP 3 Region, Count (canceled) as Subscription_cancellation
FROM [dbo].[Capstone Customer Data]
WHERE Canceled = 1
GROUP BY Region 
ORDER BY Subscription_cancellation desc;

----The total number of active and canceled subscriptions-----
SELECT Count (canceled) as TotalActiveandCanceled_Subscriptions
FROM [dbo].[Capstone Customer Data]
