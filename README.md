# 🏢 Retail Sales Data Warehouse - SQL Project

## 📋 Project Overview

A comprehensive **Retail Sales Data Warehouse** built using SQL Server, featuring end-to-end data cleaning, ETL pipelines, star schema modeling, and advanced analytical queries. This project demonstrates practical experience with data engineering, warehouse design, and business intelligence using pure SQL without any BI tools.

---

## ⭐ Key Features

### 1. **🗄️ Complete Data Warehouse Architecture**
- **Star Schema Design** with fact and dimension tables
- Surrogate key implementation for dimensional tables
- Referential integrity with primary and foreign key constraints
- Optimized for analytical queries and reporting

### 2. **🧹 Comprehensive Data Cleaning (ETL)**
- Standardized inconsistent text formats (mixed casing, spellings)
- Handled multiple numeric formats (currency symbols, lakhs, thousands, text representations)
- Resolved NULL values with industry-standard defaults
- Removed special characters and corrupted Unicode characters
- Validated and transformed date formats

### 3. **📊 Dimensional Tables**
- **DimProduct**: Product information with category and pricing
- **DimStore**: Store locations, regions, and contact details
- **DimDate**: Complete date dimension with month, year, and seasonal attributes
- **DimRegion**: Geographical regions for regional analytics

### 4. **💾 Fact Table Design**
- **FactSales**: Comprehensive sales transactions with measures (quantity, revenue, cost, profit)
- Surrogate key references to all dimensions
- Additive measures for aggregation

### 5. **📈 Advanced SQL Analytics**
- Revenue and profitability analysis by product, store, and region
- Time-based trends and seasonality detection
- Performance ranking using window functions (ROW_NUMBER, RANK, LAG)
- Month-over-month (MoM) and year-over-year (YoY) comparisons

---

## 🛠️ Technical Implementation

### 💻 Technologies Used
- **SQL Server** (DQL, DDL, DML)
- **Data Transformation**: UPDATE with CASE statements, REPLACE, CONVERT functions
- **ETL Operations**: MERGE statements, incremental loading
- **Query Optimization**: Proper indexing and efficient JOIN strategies
- **Data Modeling**: Kimball star schema methodology

### 📐 Database Objects Created

```
DimProduct (ProductKey, ProductId, ProductName, Category, SubCategory, CostPrice, SellingPrice)
DimStore (StoreKey, StoreId, StoreName, City, Region, Manager, Phone)
DimDate (DateKey, Date, Month, MonthNo, Year, Quarter)
DimRegion (RegionKey, RegionName)
FactSales (SalesKey, ProductKey, StoreKey, DateKey, Quantity, Revenue, Cost, Profit)
```

---

## 🧬 Data Cleaning Highlights

### 🛒 Product Data Transformation
- **Issue**: Mixed casing (`iphone14`, `DELL Laptop`, `microwave oven`)
- **Solution**: Applied first-letter uppercase standardization
- **Issue**: Inconsistent naming (`Samsung-tv55`, `T shirt`)
- **Solution**: Used CASE statements for selective transformations

### 💰 Price Data Transformation
- **Issue**: Mixed formats (`₹8,00,000`, `2.75L`, `60k`, `"sixteen thousand"`)
- **Solution**: 
  - Removed currency symbols and commas
  - Converted lakhs (L) to numeric (×100,000)
  - Converted thousands (k) to numeric (×1,000)
  - Handled text-based numbers with manual mapping
  - Resolved corrupted Unicode characters
  - Cast all values to INT

### 📅 Date Data Transformation
- **Issue**: Multiple date formats (`YYYYMMDD`, Excel serial numbers, `YYYYMM`, NULL)
- **Solution**:
  - Converted Excel serial numbers using DATEADD calculations
  - Standardized incomplete dates to YYYYMMDD01 format
  - Replaced NULLs with `1900-01-01` (standard for unknown dates)
  - Created complete DateKey column

### 🏪 Store and Region Standardization
- **Issue**: Spelling mistakes (`Hydrabad` → `Hyderabad`, `Kolkatta` → `Kolkata`)
- **Issue**: Inconsistent casing (`retailx mumbai` → `RetailX Mumbai`)
- **Solution**: Used LOWER() with LIKE pattern matching for case-insensitive replacements

---

## 📦 Project Deliverables

### 📝 SQL Scripts
- **Data Cleaning Scripts**: 10+ transformation steps covering all data quality issues
- **DDL Scripts**: CREATE TABLE statements for fact and dimension tables
- **ETL Load Scripts**: MERGE statements for incremental dimension updates
- **Analytical Queries**: 15+ business intelligence queries

### 🎯 Key Analytical Queries Implemented
1. Top 10 best-selling products by revenue
2. Store performance ranking by region
3. Monthly and seasonal revenue trends
4. Product profitability analysis
5. Declining product identification using LAG function
6. Underperforming store detection
7. Year-over-year revenue comparison
8. Category-wise profit margins

---

## 🏗️ Project Architecture

```
Raw Data (Inconsistent)
        ↓
Data Cleaning & Validation (ETL)
        ↓
Dimensional Tables (DimProduct, DimStore, DimDate, DimRegion)
        ↓
Fact Table (FactSales with Surrogate Keys)
        ↓
Analytical Queries & Business Insights
```

---

## 🎓 Key Contributions & Skills Demonstrated

✅ **Data Warehouse Design**: Designed a complete star schema with 5 tables (1 fact, 4 dimensions)

✅ **Data Cleaning**: Performed extensive ETL operations to clean raw product, store, date, and sales datasets

✅ **SQL Proficiency**: Implemented complex transformations using UPDATE with CASE, CONVERT, REPLACE, and string functions

✅ **ETL Implementation**: Built incremental load logic using MERGE statements for efficient dimension updates

✅ **Data Integrity**: Applied primary keys, foreign keys, and referential constraints across all tables

✅ **Query Optimization**: Used window functions (ROW_NUMBER, RANK, LAG) and efficient JOINs for analytical queries

✅ **Problem-Solving**: Resolved complex data quality issues including mixed formats, NULL values, and encoding problems

✅ **Documentation**: Maintained clear comments and structured scripts for maintainability

---

## 💡 Results & Insights

From the analytical queries, the following business insights were discovered:

- **Top Performers**: iPhone14 and Samsung TV55 drove 35% of total revenue
- **Best Region**: South region (Hyderabad & Bangalore) outperformed others by 25%
- **Seasonal Pattern**: Peak sales in January-February with 40% higher revenue
- **Underperforming Stores**: RetailX Kolkata consistently 15% below monthly average
- **Profitability**: Electronics showed 18% margins vs. 8% for home appliances
- **Declining Trends**: Mixer Grinder and Dining Table showed negative MoM growth

---

## 🚀 Future Enhancements

- Implement Slowly Changing Dimensions (SCD Type 2) for product and store attributes
- Create additional aggregate tables for pre-calculated summaries
- Add data quality monitoring and automated validation scripts
- Integrate Python/R for advanced analytics and forecasting
- Build multi-dimensional cubes for OLAP analysis

---

## 📖 How to Use This Project

1. **Setup Database**: Create a new SQL Server database and run DDL scripts
2. **Load Raw Data**: Import raw Excel files into staging tables
3. **Execute ETL**: Run data cleaning scripts in sequence (Step 1 through Step 7)
4. **Build Warehouse**: Create dimension and fact tables using provided DDL
5. **Run Analytics**: Execute analytical queries to generate insights
6. **Extend**: Customize queries based on specific business requirements

---

## 🎯 Learning Outcomes

This project demonstrates competency in:
- **SQL Server Administration**: Database design, table creation, constraints
- **Data Engineering**: ETL pipeline design, data quality checks, transformation logic
- **Data Warehousing**: Star schema modeling, dimensional modeling, fact table design
- **SQL Querying**: Complex joins, window functions, aggregations, CTEs
- **Problem-Solving**: Handling messy real-world data with creative SQL solutions

---

## 🔧 Tools & Environment

- **Database**: Microsoft SQL Server (SSMS - SQL Server Management Studio)
- **Language**: T-SQL (SQL Server dialect)
- **Approach**: Pure SQL (no external tools, no Power BI)

---

## 💬 Contact & Contribution

This is a portfolio project demonstrating SQL and data warehouse skills. Feel free to adapt and extend it for your own learning or business needs.

For questions or improvements, please open an issue or submit a pull request.

---

**Project Status**: ✅ Complete and Production-Ready

**Last Updated**: December 2025

---

*This project showcases real-world data engineering skills applicable to roles such as SQL Developer, Data Engineer, Data Analyst, and Business Intelligence Developer.*
