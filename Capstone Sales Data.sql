CREATE DATABASE Capstone_Project_Sales_Data

Select * from [dbo].[Capstone Sales Data]

Delete from [dbo].[Capstone Sales Data]
where OrderID is null

-------TOTAL SALES FOR EACH PRODUCT CATEGORY----------
Select Product, sum(Quantity_Sales) as TotalSale
from [dbo].[Capstone Sales Data]
Group by Product;


------NUMBER OF SALES TRANSACTION IN EACH REGION---------
Select Region, count(*) as
Number_of_Transactions
from [dbo].[Capstone Sales Data]
Group by Region;


------HIGHEST SELLING PRODUCT BY TOTAL SALES VALUE--------
Select Top 1 Product, sum(Quantity_Sales) as Totalsales
from [dbo].[Capstone Sales Data]
Group by Product
Order by TotalSales Desc;


-----TOTAL REVENUE BY PRODUCT--------
Select Product, sum(Revenue) as TotalRevenue
from [dbo].[Capstone Sales Data]
Group By Product;


------MONTHLY SALES TOTALS FOR THE CURRENT YEAR-------
Select Month(OrderDate) as Month, sum(Quantity_Sales) as MonthlySales
from [dbo].[Capstone Sales Data]
where Year(OrderDate) = Year(GetDate())
Group By Month(OrderDate)
Order by Month;

------TOP 5 CUSTOMERS BY TOTAL PURCHASE AMOUNT--------
Select Top 5 Customer_id, sum(Revenue) as TotalPurchaseAmount
from [dbo].[Capstone Sales Data]
Group by Customer_Id
Order By TotalPurchaseAmount Desc;


------PERCENTAGE OF TOTAL SALES CONTRIBUTED BY EACH REGION--------
Select Region, sum(Quantity_Sales) as TotalSales,
sum(Quantity_Sales) * 1.0/ (Select sum(Quantity_Sales)
from [dbo].[Capstone Sales Data]) * 100
as Percentage_of_Total_Sales
from [dbo].[Capstone Sales Data]
Group by Region;


-----PRODUCTS WITH NO SALES IN THE LAST QUARTER-------
Select Product, Quantity_Sales, OrderDate
from [dbo].[Capstone Sales Data]
WHERE Quantity_Sales = 0 AND MONTH(OrderDate) <=4
