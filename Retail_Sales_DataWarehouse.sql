select * from Raw_Date_Data$
select * from Raw_Product_Data$
select * from Raw_Sales_Transactions$
select * from Raw_Store_Data$

--converting null values
--converting product data nulls to 0
update Raw_Product_Data$ set [cost price]=0 where [cost price] is null
update Raw_Product_Data$ set sellingPrice =0 where sellingPrice is null
--converting sales table nulls into 0
update Raw_Sales_Transactions$ set quantity=0 where quantity is null
update Raw_Sales_Transactions$ set profit=0 where profit is null
--store table nulls into 0
update Raw_Store_Data$ set manager='Not Defined' where manager is null
update Raw_Store_Data$ set Phone=0 where Phone is null

--Transformation
--raw_product_data
-- Remove symbols, trim, uppercase
select * from Raw_Product_Data$
update Raw_Product_Data$ set sellingPrice=60000 where ProductId='P003'
UPDATE Raw_Product_Data$ SET ProductId = UPPER(REPLACE(REPLACE(LTRIM(RTRIM(ProductId)), '-', ''), '_', ''));
UPDATE Raw_Product_Data$ SET ProductId = 'P' + RIGHT('00' + SUBSTRING(ProductId, 2, LEN(ProductId)), 3);
UPDATE Raw_Product_Data$
SET [Product Name] =CASE WHEN [Product Name] LIKE 'Samsung-%' THEN REPLACE([Product Name], '-', ' ') WHEN LOWER([Product Name]) = 't shirt' THEN 'T-shirt'
else [Product Name] end
update Raw_Product_Data$ set [cost price]=40000 where product_id='P002'
update Raw_Product_Data$ SET category = CASE WHEN category LIKE '%electronic%' THEN 'Electronics' 
WHEN category LIKE '%furniture%' THEN 'Furniture'
WHEN category LIKE '%cloth%' THEN 'Clothing' WHEN category LIKE '%home%' THEN 'HomeAppliance' ELSE category END
UPDATE Raw_Product_Data$
SET SubCategory =CASE WHEN SubCategory LIKE 'mobile%' THEN 'Mobile' WHEN SubCategory LIKE 'tv%' THEN 'TV' WHEN SubCategory LIKE 'laptop%' THEN 'Laptop' 
WHEN SubCategory LIKE '%living%' THEN 'Living Room' WHEN SubCategory LIKE 'men%' THEN 'Men' WHEN SubCategory LIKE 'kitchen%' THEN 'Kitchen'
ELSE SubCategory END
UPDATE Raw_Product_Data$ SET [Product Name] = UPPER(LEFT([Product Name],1)) + LOWER(SUBSTRING([Product Name], 2, LEN([Product Name])));
alter table raw_product_data$ drop column F7


--sales_data
select * from Raw_Sales_Transactions$
select * from Raw_Product_Data$
UPDATE Raw_Sales_Transactions$ SET product = UPPER(LEFT([Product],1)) + LOWER(SUBSTRING([Product], 2, LEN([Product])))
update Raw_Sales_Transactions$ set store= case WHEN LOWER(store) LIKE '%hyd%' THEN 'RetailX Hyderabad' 
WHEN LOWER(store) LIKE '%mum%' THEN 'RetailX Mumbai' WHEN LOWER(store) LIKE '%bang%' THEN 'RetailX Bangalore' 
WHEN LOWER(store) LIKE '%kol%' THEN 'RetailX Kolkata' WHEN LOWER(store) LIKE '%del%' THEN 'RetailX Delhi' else store end
UPDATE Raw_Sales_Transactions$ SET product = REPLACE(product, 'tv 55', 'tv55')
WHERE product LIKE '%tv 55%'
UPDATE Raw_Sales_Transactions$ SET revenue = REPLACE(REPLACE(revenue, '₹', ''), ',', ''),
cost= REPLACE(REPLACE(cost, '₹', ''), ',', '')
ALTER TABLE Raw_Sales_Transactions$ ALTER COLUMN date DATE
UPDATE Raw_Sales_Transactions$
SET revenue = CASE WHEN revenue LIKE '%L' OR revenue LIKE '%l'
THEN CAST(REPLACE(revenue, 'L', '') AS FLOAT) * 100000 ELSE revenue END,
cost = CASE WHEN cost LIKE '%L' OR cost LIKE '%l' THEN CAST(REPLACE(cost, 'L', '') AS FLOAT) * 100000 ELSE cost END
UPDATE Raw_Sales_Transactions$
SET revenue = REPLACE(REPLACE(revenue, '竄ｹ', ''), ',', ''),
    cost    = REPLACE(REPLACE(cost, '竄ｹ', ''), ',', '')
UPDATE Raw_Sales_Transactions$
SET cost =CASE WHEN LOWER(cost) = 'sixteen thousand' THEN '16000' ELSE cost END;
UPDATE Raw_Sales_Transactions$
SET cost = REPLACE(cost, NCHAR(65401), '');
SELECT cost,UNICODE(LEFT(cost,1)) AS UnicodeValue,LEFT(cost,1) AS FirstChar
FROM Raw_Sales_Transactions$
WHERE cost NOT LIKE '[0-9]%' AND cost NOT LIKE '[0-9.]%'AND  cost NOT LIKE '%L' AND cost NOT LIKE '%k';

select * from Raw_Sales_Transactions$
update Raw_Sales_Transactions$ set quantity=8 where sale_id=3
update Raw_Sales_Transactions$ set quantity=2 where sale_id=7
update Raw_Sales_Transactions$ set quantity=15 where sale_id=10
    select * from Raw_Sales_Transactions$
    select * from Raw_Product_Data$
UPDATE Raw_Sales_Transactions$
SET revenue = CAST(revenue AS INT),
cost    = CAST(cost AS INT);
UPDATE Raw_Sales_Transactions$ SET Product = 'Dining table' WHERE Product = 'Diningtable';
UPDATE Raw_Sales_Transactions$
SET Store = 'RetailX Kolkatta'
WHERE Store = 'RetailX Kolkata'

UPDATE Raw_Sales_Transactions$
SET revenue = TRY_CAST(TRY_CAST(revenue AS DECIMAL(18,2)) AS INT),cost    = TRY_CAST(TRY_CAST(cost    AS DECIMAL(18,2)) AS INT);

UPDATE Raw_Sales_Transactions$
SET profit = CAST(revenue AS INT) - CAST(cost AS INT);

--date_data
select * from Raw_Date_Data$
ALTER TABLE Raw_Date_Data$ ALTER COLUMN date DATE
update Raw_Date_Data$ set datekey='20230401'where month='apr'
update Raw_Date_Data$ set datekey=202303 where month='mar'
update Raw_Date_Data$ set month= case when LOWER(month) like '%jan%' then 'jan' when LOWER(month) like '%feb%' 
then 'feb' when LOWER(month) like '%mar%' then 'mar' when LOWER(month) like '%APR%' then 'apr' else null end
update Raw_Date_Data$ set monthno= case when month like '%jan%' then 1 when month like '%feb%' then 2 when month like '%mar%' then 3 
when month like '%apr%' then 4 else monthno end

--store_data_transformation
select * from Raw_Store_Data$
update Raw_Store_Data$ set Region= case when LOWER(Region) = 'south' then 'South' 
when LOWER(Region) ='west' then 'West' 
when LOWER(Region) ='east' then 'East' 
when LOWER(Region) ='north' then 'North' else Region end
update Raw_Store_Data$ set city= case when city='hyderabad' then 'Hyderabad' when city='delhi' then 'Delhi' 
when city='Bengluru' then 'Bengaluru' else city end
update Raw_Store_Data$ set [Store Name]='RetailX Bangalore' where [store id]=2
update Raw_Store_Data$ set [Store Name]='RetailX Hyderabad' where [store id]=1
update Raw_Store_Data$ set [Store Name]='RetailX Mumbai' where [store id]=3
update Raw_Store_Data$ set StoreName='RetailX Kolkata' where StoreName='RetailX Kolkatta'




--creating fact and dimension tables 
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductId VARCHAR(50),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    CostPrice INT,
    SellingPrice INT)

INSERT INTO DimProduct (ProductId,ProductName, Category, SubCategory,CostPrice,SellingPrice)
SELECT DISTINCT ProductId,ProductName,category,subcategory,CostPrice,SellingPrice
FROM Raw_Product_Data$

select * from DimProduct
select * from Raw_Product_Data$

CREATE TABLE DimStore(
    StoreKey INT IDENTITY(1,1) PRIMARY KEY,
    StoreId INT,
    StoreName VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    Manager VARCHAR(50),
    Phone Varchar(50))

Insert Into DimStore(StoreId,StoreName,City,Region,Manager,Phone)
select distinct StoreId,StoreName,City,Region,Manager,CONVERT(VARCHAR(20), CAST(Phone AS BIGINT))
from Raw_Store_Data$

select * from Raw_Store_Data$
select * from DimStore


CREATE TABLE DimDate(
    DateKey INT PRIMARY KEY,
    Date date,
    Month VARCHAR(20),
    MonthNo INT,
    Year INT)

Insert Into DimDate(DateKey,Date,Month,MonthNo,Year)
select distinct DateKey,Date,Month,MonthNo,Year
from Raw_Date_Data$

select * from Raw_Date_Data$
select * from DimDate


CREATE TABLE FactSales(
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductKey INT,
    StoreKey INT,
    DateKey INT,
    Quantity INT,
    Revenue INT,
    Cost INT,
    Profit INT,
    Foreign key (ProductKey) references DimProduct(ProductKey),
    Foreign key (StoreKey) references DimStore(StoreKey),
    Foreign Key (DateKey) references DimDate(DateKey))

insert into FactSales(ProductKey,StoreKey,DateKey,Quantity,Revenue,Cost,Profit)
select dp.ProductKey,ds.StoreKey,dd.DateKey,rst.Quantity,rst.Revenue,rst.Cost,rst.Profit
from Raw_Sales_Transactions$ rst
join DimProduct dp
on rst.Product=dp.ProductName 
join DimStore ds
on rst.Store=ds.StoreName 
left join DimDate dd
on rst.Date=dd.Date

SELECT COUNT(*) FROM FactSales
SELECT COUNT(*) FROM Raw_Sales_Transactions$

select * from FactSales
select * from Raw_Sales_Transactions$
select * from DimDate
select * from DimProduct
select * from DimStore

--Which are the top 10 best-selling products by revenue? 
select top 10 dp.ProductName,SUM(fs.Revenue) as best_selling_products
from FactSales fs join DimProduct dp
on fs.ProductKey=dp.ProductKey
group by dp.ProductName
order by best_selling_products desc

--Which products have the lowest profit margins?
select dp.ProductName,SUM(fs.Profit) as total_profit,SUM(fs.Revenue) as total_revenue,SUM(fs.Profit) * 100 /SUM(fs.Revenue) as profit_margin_percent
from FactSales fs join DimProduct dp
on fs.ProductKey=dp.ProductKey
group by dp.ProductName
order by profit_margin_percent asc

--Identify products with declining sales month-over-month
with MonthlySales as(
select dp.ProductName,dd.Year,dd.MonthNo,SUM(fs.Quantity) as total_quantity
from FactSales fs join DimProduct dp
on fs.ProductKey=dp.ProductKey join DimDate dd
on fs.DateKey=dd.DateKey
group by dp.ProductName,dd.Year,dd.MonthNo
),SalesLag as(
select ProductName,Year,MonthNo,total_quantity,LAG(total_quantity) over (partition by ProductName order by Year,MonthNo) as previous_quantity
from MonthlySales
)
select *
from SalesLag
where previous_quantity is not null and total_quantity < previous_quantity
order by ProductName,Year,MonthNo

--. Which store generated the highest total revenue this year? 
select top 1 ds.StoreName,SUM(fs.Revenue) as highest_total_revenue
from FactSales fs join DimStore ds
on fs.StoreKey=ds.StoreKey join DimDate dd
on fs.DateKey=dd.DateKey
where dd.Year=2023
group by ds.StoreName
order by highest_total_revenue desc

--Which region is performing the best overall?
select top 1 ds.Region,SUM(fs.Revenue) as best_performing_region
from FactSales fs join DimStore ds
on fs.StoreKey=ds.StoreKey
group by ds.Region
order by best_performing_region desc


--Stores consistently underperforming across months?
with monthlystorerevenue as(
select ds.StoreName,dd.MonthNo,dd.Year,SUM(fs.Revenue) as store_revenue
from FactSales fs join DimStore ds
on fs.StoreKey=ds.StoreKey join DimDate dd
on fs.DateKey=dd.DateKey
group by ds.StoreName,dd.MonthNo,dd.Year
),monthlyavg as(
select Year,MonthNo,AVG(store_revenue) as avg_store_revenue
from monthlystorerevenue 
group by Year,MonthNo
), underperform as (
select ms.StoreName,ms.MonthNo,ms.Year,ms.store_revenue,ma.avg_store_revenue
from monthlystorerevenue ms join monthlyavg ma
on ms.Year=ma.Year and ms.MonthNo=ma.MonthNo
where ms.store_revenue < ma.avg_store_revenue
)
select StoreName,COUNT(*) as no_of_months_underperforming
from underperform
group by StoreName
order by no_of_months_underperforming desc


--What are the total sales and profits by month and quarter?
select dd.Year,dd.MonthNo,dd.Month,SUM(fs.Revenue) as total_sales,SUM(fs.Profit) as total_profit
from FactSales fs join DimDate dd
on fs.DateKey=dd.DateKey
group by dd.Year,dd.MonthNo,dd.Month


--How does the average transaction value vary across stores or regions? 
select ds.StoreName,SUM(fs.Revenue) /COUNT(*) as total_count
from FactSales fs join DimStore ds
on fs.StoreKey=ds.StoreKey
group by ds.StoreName
order by total_count desc


--Are there discrepancies between cost and selling price trends?
select dp.ProductName,SUM(fs.Cost) as cost_price,SUM(fs.Revenue) as revenue,SUM(fs.Revenue) - SUM(fs.Cost) as profitgap
from FactSales fs join DimProduct dp
on fs.ProductKey=dp.ProductKey
group by dp.ProductName;


--What are the top-performing product categories in each region? 
with RegionCategoryRevenue as(
select ds.Region,dp.Category,SUM(fs.Revenue) as TotalRevenue
from FactSales fs JOIN DimStore ds 
on fs.StoreKey = ds.StoreKey JOIN DimProduct dp 
on fs.ProductKey = dp.ProductKey
group by ds.Region, dp.Category),
RankedCategories as(
select Region,Category,TotalRevenue,RANK() over (partition by Region order by TotalRevenue desc) AS RevenueRank
from RegionCategoryRevenue)
select Region,Category as TopCategory,TotalRevenue
from RankedCategories
where RevenueRank = 1
order by Region

