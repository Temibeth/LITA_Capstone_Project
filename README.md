# LITA_Capstone_Project
This project analyzes two datasets using Excel, SQL, and Power BI. SQL is used for querying and data extraction, Excel for data cleaning and analysis, and Power BI for creating interactive dashboards. The goal is to uncover insights, trends, and key metrics to drive informed decision-making.

## PROJECT 1: Sales Performance Analysis for a Retail Store
### Overview
----------------
This project collects and analyses data from various regions, markets, and stores. The goal is to provide insights into the revenue, units sold, and transaction categories over different periods. The analysis focuses on understanding revenue trends and sales performance across regions and calculating key metrics such as average revenue by region.
### Data Collected
---------------
The dataset includes the following key columns:
1.	ORDER ID: unique identifier for each order placed.
2.	CUSTOMER ID: unique identifier for each customer.
3.	PRODUCT: the specific item sold to a customer.
4.	REGION: the geographical area where the store operates.
5.	ORDER DATE: the date on which a particular sale or transaction was made.
6.	QUANTITY/SALES: the number of units of a product that were sold.
7.	UNIT PRICE: the number of units sold for a given transaction.
8.	REVENUE: the total monetary value generated from the sale.
### Project Objectives
----------------
This project was designed to address the following analysis goals:
- Revenue by region: determine the total revenue generated in each region.
- Region by quantity sold: analyze the number of units sold across different regions to identify the highest selling locations.
- Average revenue by region: calculate the average revenue per sale in each region to assess performance.
### How To Use The Data
---------------
- Revenue by region: group the data by region and sum the revenue column. This provides an overview of how much revenue each region is generating.
- Units sold by region: group the data by region and sum the units sold to identify which regions are moving the most products.
- Average revenue by region: to get the average revenue per transaction or unit sold in a region.
### Formulas Used
---------------
Microsoft Excel
- Revenue = Unitprice * QuantitySold
- Average Revenue = Total Revenue / QuantitySold

SQL

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
 Capstone Sales Data.sql…]()

###  Tools And Methods Used
---------------
- Data cleaning: the data was cleaned using Microsoft Excel by removing duplicates from the data.
- Data analysis: the data was analyzed with the following tools: - Microsoft Excel - used pivot table to organize, summarize, and filter the data for easier representation; SQL - used to query and manipulate the data.
- Data visualization: the data was visualized using: - Microsoft Excel - charts were created in excel to visually represent the key insights; Power BI - used to create a dashboard to visualize the insights found in excel and SQL.
### Visual Analysis and inference
## 1. Total Revenue by Region

# Pivot Table

![Total revenue by region](https://github.com/user-attachments/assets/9c1bc98f-c42b-4f3b-b9e9-768ae4d334d8)
