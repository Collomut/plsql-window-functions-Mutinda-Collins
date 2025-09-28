--1.CREATING TABLES 
-- CREATING CUSTOMER TABLE

CREATE TABLE Customers(
  Customer_id varchar(20) not null,
  Full_Name Varchar(30) not null,
  Phone_Number varchar(14) not null,
  Region varchar(20) not null,
  primary key (Customer_id));
--CREATING PRODUCTS TABLE

  CREATE TABLE Products(
  Product_id varchar(20) not null,
    Product_Name varchar(30) not null,
    Category varchar(20) not null,
    Supplier varchar(40) not null,
    Unit_Price varchar(20) not null,
    primary key (Product_id));
 
--CREATING TRANSACTIONS TABLE
CREATE TABLE Transactions(
  Transaction_id varchar(20) not null,
  Customer_id varchar(20) not null,
  Product_id varchar(20) not null,
  Sale_Date date not null,
  Quantity varchar(10) not null,
  Total_Amount varchar(20) not null,
  primary key (Transaction_id),
  foreign key (Customer_id) references Customers(Customer_id),
  foreign key (Product_id) references Products(Product_id));

--2. Creating Views
--Creating View to Use in manipulation of Windows Functions(Customer based)
CREATE OR REPLACE FORCE VIEW "RETAIL"."CUSTOMER_REVENUE_SUMMARY" ("FULL_NAME", "TOTALREVENUE") AS 
SELECT
c.Full_Name,
 -- add up all the money a customer spent and call it TotalRevenue
SUM(t.Total_Amount) AS TotalRevenue
--Identifying the table where the data is to be obtained  
FROM
Customers c
--Combining the fields of different tables on different conditions 
JOIN
Transactions t ON c.Customer_id = t.Customer_id
GROUP BY
c.Full_Name;

--Creating View to Use in manipulation of Windows Functions(time based)
 
CREATE OR REPLACE FORCE VIEW "RETAIL"."MONTHLY_SALES_SUMMARY" ("SALEYEAR", "SALEMONTH", "MONTHLABEL", "MONTHLYTOTAL") AS 
SELECT
-- Extract the year from the sale date
EXTRACT(YEAR FROM Sale_date) AS SaleYear,
-- Extract the month number from the sale date
EXTRACT(MONTH FROM Sale_date) AS SaleMonth,
-- Create a neat label like 
TO_CHAR(Sale_date, 'YYYY-MM') AS MonthLabel,
-- Total sales amount for that month
SUM(Total_Amount) AS MonthlyTotal
FROM
    Transactions
GROUP BY
    EXTRACT(YEAR FROM Sale_date),
    EXTRACT(MONTH FROM Sale_date),
    TO_CHAR(Sale_date, 'YYYY-MM');
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--3. WINDOWS FUNCTIONS
--RANKING
SELECT
    region,
    Full_name,
    Product_name,
    --Rank products in each region by total sales, highest first
    RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS product_rank
--shows the table we are obtaining data from
FROM Transactions
--join products and customers tables to get product and customer details,
--then group results by region, customer name, and product name
JOIN products USING (product_id)
JOIN customers USING (customer_id)
GROUP BY region, Full_name, Product_name;

--Percentage Ranking,Dense Ranking,Standard Rank
SELECT
    Full_Name,
    TotalRevenue,
-- Standard rank, skips numbers after a tie
    RANK() OVER (ORDER BY TotalRevenue DESC) AS CustomerRank,
-- Dense rank, does not skip numbers
    DENSE_RANK() OVER (ORDER BY TotalRevenue DESC) AS CustomerDenseRank,
-- Percent rank, shows the relative rank as a percentage 
    PERCENT_RANK() OVER (ORDER BY TotalRevenue DESC) AS CustomerPercentRank
FROM
    Customer_Revenue_Summary;

--Aggregate
SELECT
    MonthLabel,
    MonthlyTotal,
    -- calculate the moving average for the sales
    AVG(MonthlyTotal) OVER (
        -- order by year then month to get the timeline right
        ORDER BY SaleYear, SaleMonth
        -- this is the frame: it looks at the current row and the 2 before it
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingMonthAvg
FROM
    Monthly_Sales_Summary;

--Navigation
SELECT
    MonthLabel,
    MonthlyTotal,
-- LAG() gets the sales total from the previous month
    LAG(MonthlyTotal, 1, 0) OVER (ORDER BY SaleYear, SaleMonth) AS PreviousMonthSales,
-- calculate the percentage change from the previous month
    ROUND(
        (MonthlyTotal - LAG(MonthlyTotal, 1, 0) OVER (ORDER BY SaleYear, SaleMonth)) /
-- NULLIF is a safety check to prevent division by zero errors
        NULLIF(LAG(MonthlyTotal, 1, 0) OVER (ORDER BY SaleYear, SaleMonth), 0) * 100,
    2) AS GrowthPercentage
FROM
    Monthly_Sales_Summary;
--Distribution
-- using customer revenue view 
SELECT
    Full_Name,
    TotalRevenue,
-- NTILE(4) divides the customers into 4 equal groups
    NTILE(4) OVER (ORDER BY TotalRevenue DESC) AS CustomerQuartile
FROM
    Customer_Revenue_Summary;
 


  
 
