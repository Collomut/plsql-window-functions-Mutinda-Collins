COURSE: DATABASE WITH PL/SQL

INSTRUCTOR: Eric Maniraguha

Name: Mutinda Collins

PROJECT NAME: PL/SQL WINDOW FUNCTIONS MASTERY PROJECT
====================================================================================================
1.PROBLEM DEFINITION

Business Context

>Kigali Retail Solutions Ltd runs a Rwanda wide convenience store network that deals with outsourcing basic goods by various Companies e.g. Bralirwa , Inyange and making it accessible closer to the users.It is based in Kigali, Huye, Musanze and Rubavu. 

Data Challenge

>The Company collects large volumes of sales data from multiple store locations but lacks the ability to Identify top-selling products and track sales trends. This limits their capacity to make decisions for inventory management.


Expected Outcome

 >By the end of this, The Company expects to be able to get a clear picture of the: 
>1.Clear rankings of product performance per region/quarter.
>2. 2.Trends in sales. 
>3.3.Customer segmentation to plan on promotions and limited offers.
 >4.Total goods well sorted in categories in the Inventory.


 Database Schema
 
 >The table consists of three tables each with different functionalities they include:-

Customers Table

>The table stores all relevant customer information.It enables the company to track purchase history and regularity which helps in creating a more personalized user experience for the customers and to the management it helps with inventory management

Products Table

>It contains all the stored products owned by the company. It allows the management to monitor the goods they have to prevent overstocking or understocking while identifying the most best-selling items to ensure that they maximize their profit in all aspects 

Transaction Table

>The table is mainly for the financial decisions made by the company,It ensures that the company knows how much money it makes from the products from the Company, identify high and low sale seasons to prevent delays in crucial goods. It also helps to monitor the depletion of stocks and holds every thing accountable hence reducing the cases of theft and also aids in generating accurate tax reports.

 WINDOWS FUNCTIONS IMPLEMANTATION
 
 >In this Project there is use of 4 windows functions they are the following :-
a) Ranking
 These functions assign a position to ROWS within a partition based on specific criteria.
 In this project there is use of :-
 -RANK()/STANDARD RANK()-Assigns ranks to rows and skips ranks for duplicates.
 -DENSE_RANK()- Assigns a unique number to each row in the result set.
 -PERCENTAGE_RANK()-shows the relative rank of a row as a percentage between 0 and 1.
The ranking helps the Kigali Retail Solution to identify the customer who spends the most for later encouragement and also to identify the best selling product to increase it and monitor which branch per region is doing exceptionally well and areas of concerns.

b) Aggregate

>They perform calculations over a group of rows without altering them. the aggregate function used here is AVG().
The average used to check the totals and the direction of the company it checks the previous business trends in terms of sales and using professionals or some tools like Zoho Analytics to predict the trend.

c)Navigation/offset

>These functions access data from other rows relative to the current rows.
In the project there is use of LAG() to collect data from different tables in order to calculate the monthly earnings of the company.

d)Distribution

>They help in statistical analysis e.g. percentiles. the one used for solving Kigali Retail solutions is the NTILE(n) this has been used for customer segmentation in order of how they spend at the shop which will be useful during product promotions and giveaways.

6.Result Analysis and Insights 

>In order to determine important consumer behaviours and business trends, this analysis looks at the sales data.
It is divided into three key parts:

Descriptive Analysis

>The data reveals several key patterns. The customer ranking query shows large spending by a small group of customers with the leading customer being Grant Hail leading spending a total of RWF 3,157,000. The monthly analysis indicates that the highest growth was recorded September this is a huge margin from the previous 308000 this shows that the company  experienced a massive profit. 
on the side of the customer segmentation due to insufficient data and the massive ranges in expenditure each bracket holds its own expenditure with Rank 1 having 3157000 and Rank 7 having 8500.

Diagnostic Analysis

>The business seems to have a very loyal customer that has a alot of money spent but the range from the first quartile is massive and is quite risky.The seasonal sales peak is recorded in September usually around the time for back to schoolwhich is a common trend in such an industry, However due to the huge range of customer expenditure it shows that every client is in their own segment as of now, but around Rank 3 and 4 there seems to be quite a small difference and show almost same shopping patterns and behaviours.

Prescriptive analysis
>Based on the data collected the following is recommended:-
>Launch a marketing campain increase capital on the advertising team to encourage more members to join social media campaigns help alot since majority of the people use social media this ensures reach.
>implement a VIP loyalty program once a certain group of customers reach a level set by the finance team they can be eligible to win various prizes and also if it is in budget warranted free shopping, this offer helps increase expenditure of the customers so that they can enroll to the program


REFERENCES
>https://www.geeksforgeeks.org
>
>https://www.sqltutorial.org
>
>https://geekflare.com
>
>https://www.oracle.com/education/guided-learning
>
>https://youtu.be/evktGJrgORA?list=PLb1qVSx1k1Vr0v4wVyvT3GEuA0J0M4xBm
>
>https://youtu.be/J5wjIf4gdq4
>
>https://www.datacamp.com/cheat-sheet/sql-window-functions-cheat-sheet
>
>https://www.freecodecamp.org/news/window-functions-in-sql
>
>https://medium.com/@BradleyOThompson/advanced-sql-window-functions-a5ba3ed15868
>
>https://www.tutorialspoint.com/plsql/index.htm
>
All sources were cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.
 
