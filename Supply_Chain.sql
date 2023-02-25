-- inspecting data
SELECT top(3) *
  FROM [supply].[dbo].[Supply_Chain];

-- checking unique values
SELECT 
  DISTINCT Type 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Delivery_Status 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Category_Name 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Type 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Customer_Segment 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Product_Name 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Order_Status 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Market 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Department_Name 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Order_Region 
from 
  [supply].[dbo].[Supply_Chain];
SELECT 
  DISTINCT Order_Country 
from 
  [supply].[dbo].[Supply_Chain];


--Sales by Product Name
SELECT 
  Product_Name, 
  sum(Sales) AS Sales 
FROM 
  supply.dbo.Supply_Chain 
WHERE 
  Sales IS NOT NULL 
GROUP BY 
  Product_Name 
ORDER BY 
  2 DESC;


--sales by category_name and department
SELECT 
  Category_Name, 
  Department_Name, 
  sum(Sales) AS Sales 
FROM 
  supply.dbo.Supply_Chain 
WHERE 
  Sales IS NOT NULL 
GROUP BY 
  Category_Name, 
  Department_Name 
ORDER BY 
  2 DESC;

--Wich  departement sold more ? 
SELECT 
  Department_Name, 
  count(*) AS count 
from 
  supply.dbo.Supply_Chain 
group by 
  Department_Name 
order by 
  count desc;

--Are orders delivered on time?
select 
  Delivery_Status, 
  count(*) AS count 
from 
  supply.dbo.Supply_Chain 
group by 
  Delivery_Status 
order by 
  count desc;

-- most customers making Sales 
Select 
  top(10) Customer_Fname, 
  avg(Sales_Per_Customer) AS Sales_BY_Customer 
from 
  supply.dbo.Supply_Chain 
group by 
  Customer_Fname 
order by 
  Sales_BY_Customer desc;

-- The most targeted areas through our company
select 
  top(10) Customer_Segment, 
  Order_Country, 
  count(*) AS count_Country
from 
  supply.dbo.Supply_Chain 
where
    Order_Country is not null
group by 
  Customer_Segment, 
  Order_Country 
order by 
  count_Country desc;

-- market 

Select 
  top(5) Market, 
  round(SUM (Sales) , 2) AS Sales_BY_Market 
from 
  supply.dbo.Supply_Chain 
group by 
  Market
order by 
  Sales_BY_Market desc

--total Sales by Year 
SELECT 
  ROUND(
    YEAR(shipping_date_DateOrders), 
    3
  ) AS year, 
  SUM(Sales) AS Total_Sales 
FROM 
  supply.dbo.Supply_Chain 
GROUP BY 
  YEAR(shipping_date_DateOrders) 
order by 
  Total_Sales desc;

--Most used payment method
select 
  top(10) Count(*) as count_Type_Pay, 
  Type, 
  Order_Country 
from 
  supply.dbo.Supply_Chain 
Group by 
  Type, 
  Order_Country 
order by 
  count_Type_Pay desc;

--Most countries Sales
Select
  Sales,Order_Country,Market,Latitude,Longitude
from 
  supply.dbo.Supply_Chain;

--Orer Status
select 
  Order_Status, 
  count(*) AS count 
from 
  supply.dbo.Supply_Chain 
group by 
  Order_Status 
order by 
  count desc;

--Department _sataus
select 
  Department_Name, 
  round(sum(Order_Profit_Per_Order),1) AS Total_Profit 
from 
  supply.dbo.Supply_Chain 
group by 
  Department_Name
order by 
  Total_Profit desc;


--Problem Stament  Total delver_sataus =180519 ,standard = 41023 + second = 26987=135506
select 
  Delivery_Status, 
  Shipping_Mode,
  count(*) AS count 
from 
  supply.dbo.Supply_Chain 
--where 
  --Delivery_Status = 'Late delivery' 
group by 
  Delivery_Status, 
  Shipping_Mode
order by 
  count desc;
