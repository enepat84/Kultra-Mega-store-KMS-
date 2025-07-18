

KMS_SQL_PROJECT
Analysed datasets to give key insight and recommendations

PROJECT TOPIC: Kultra Mega Store Inventory
Project Overview
This is my project work after my 3 month training as a DSA student in Incubator hub. The project describes Kultra Mega Store Inventories, comprising of products, Customer names, Customer Segment, Total Sales, Shipping method, Orders and their date, returnd items, profits incurred, amongst others. The raw data file was 8,400 rows with row id and order which was used to identify and track each products and its relationship with other variables in the given data.

Project Source
The data for this project is a csv file which was supplied by Incubator Hub and is soleley for the training.

Tools Used
SQL server download here
Data Cleaning and Preparation
In the initial phase of the data cleaning and preparation, we performed the following actions;

Data loading
Data cleaning and formatting
Allowed nulls and insert primary keys
Exploratory Data Analysis
The datasets was used to answer the following questions:

Which product category had the highest sales?
What are the Top 3 and Bottom 3 regions in terms of sales?
What were the total sales of appliances in Ontario?
Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
KMS incurred the most shipping cost using which shipping method?
Who are the most valuable customers, and what products or services do they typically purchase?
Which small business customer had the highest sales?
Which Corporate Customer placed the most number of orders in 2009 – 2012?
Which consumer customer was the most profitable one?
Which customer returned items, and what segment do they belong to?
If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer
Data Analysis
Here are my lines of code and queries used during the analysis.

TO CREATE A NEW DATABASE

create database DSA_project
CHANGE OF DATA TYPES FOR ALL PRICE(S) COLUMN

ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN SALES DECIMAL (10, 3)
ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN PROFIT DECIMAL (10, 3)
ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN DISCOUNT DECIMAL (10, 3)
ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN UNIT_PRICE DECIMAL (10, 3)
ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN SHIPPING_COST DECIMAL (10, 3)
ALTER table [dbo].[KMS Sql Case Study]
ALTER COLUMN PRODUCT_BASE_MARGIN DECIMAL (10, 3)
TO VIEW THE TABLES RESULT

select * from [dbo].[KMS Sql Case Study]
--------Question 1------ --- Which product category that has the highest?

select top 1 [Product_Category],count ([Product_Category])as [Product Count]
from [KMS Sql Case Study]
group by Product_Category
order by [Product Count] desc
-------Question 2------- --- what are the top 3 and buttom 3 region in terms of sales?

select top 3 [Region],sum([sales]) as [Total Sales]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] desc
select top 3 [Region],sum([sales]) as [Total Sales]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] asc
----------Question 3------- ----- what were the Total Sales of applicants in ontario?

select Region, SUM(sales) as [Total Sales]
from [KMS Sql Case Study]
where Region='ontario'
Group by Region
------Question 4----- -----Advice the management of KMS on what to do to increase the revenue from the buttom 10 customer

Select top 10 [Customer_Name], SUM([Sales]) as [Total Sales]
from [KMS Sql Case Study]
group by Customer_Name
order by [Total Sales] asc
--------Question 5------ ------KMS incurred the Most shipping cost using which shipping method ?

Select Top 1 [Ship_Mode], SUM([Shipping_Cost]) as [Total Shipping Cost]
from [KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost] desc
---------Question 6------ ----Who are the most valuable customer, and what products or services did they typically purchase?

select [Customer_Name],Product_Name, SUM(sales) as [Total Sales]
from [KMS Sql Case Study]
Group by Customer_Name,Product_Name
order by [Total Sales] desc
------Question 7-------- -----Which small business customer have the highest sales ?

select top 1 Customer_Name,Customer_Segment, SUM([Sales]) as [Total Sales]
from [KMS Sql Case Study]
where Customer_Segment ='small Business'
group by Customer_Name,Customer_Segment
order by [Total Sales] desc
-----Question 8------- ---Which corporate customer placed the most number of orders in 2019 -2012?

select top 1  Customer_Name,Customer_Segment, count([Order_ID]) as [Total order]
from [KMS Sql Case Study]
where Customer_Segment ='corporate' and Order_Date between '2009' and '2012'
group by Customer_Name,Customer_Segment
order by [Total order] desc
-------Question 9------ ---Which consumer customer was the most profitable one?

select top 1 Customer_Name,Customer_Segment, sum([Profit]) as [Total profit]
from [KMS Sql Case Study]
where Customer_Segment ='Consumer'
group by Customer_Name,Customer_Segment
order by [Total profit] desc
-----Question 10------- ----Which customer returned items, and what segments do they belong to?

select Customer_Name,Customer_Segment,[Status]
from [KMS Sql Case Study]
join [dbo].[Order_Status]
on [KMS Sql Case Study].Order_ID = [dbo].[Order_Status].[Order_ID]
-----Question 11--------- If the delivery truck is the most economical but the lowest shipping method and express air is the fastest. but the most expensive one, did you think the company appropriately spent shipping costs based on the order priority

Select Order_Priority, Ship_Mode,
    COUNT([Order_ID]) AS [order count],
    SUM(sales - profit) AS [Estimated shipping cost],
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS [Avg ship date]
from  [KMS Sql Case Study1] 
group by Order_Priority,Ship_Mode
order by  Order_Priority,Ship_Mode desc
Analysis
from the analysis the following were observed.

KMS did not appropriately spend shipping costs based on the order of priority. They overused delivery trucks, which are best for bulk or non-urgent orders and underused express air, which is meant for urgent deliveries. This shows a misalignment between shipping cost,speed and order priority leading to inefficient spending and wasted cost.

To boost sales from the bottom 10 customers;

The company should focus on strengthening relationships through customized promotions, puchasing behaviours.
Reaching out directly through calls or emails to their customers to understand their past experience.
Give discounts on their most viewed or previously purchased products.
Upsell and Cross-sell Offers.
Offer faster delivery, better after-sales support, or dedicated account managers for small businesses.
Organise a survey to understand the needs of the customers, which would make them come again and why they havent been coming frequently
Find below the back up file link for the sql
