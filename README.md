🛒 Retail Sales Data Warehouse Project
📌 Overview

This project simulates the design and implementation of a Retail Sales Data Warehouse using SQL. The goal is to build a robust data model that enables efficient reporting and insights for business decision-making in a retail environment.

🗂️ Features

Created Fact and Dimension tables using Star Schema

Performed data cleaning and standardization from raw sales, store, product, and date datasets

Applied incremental loading logic for maintaining dimension tables

Derived business insights through SQL queries (e.g., top products, store performance, seasonal trends)

Ensured data consistency with normalization and basic validation checks

🧱 Data Model

FactSales: Captures transactional data (Quantity, Revenue, Cost, Profit)

DimProduct: Contains product attributes (Name, Category, SubCategory, Prices)

DimStore: Contains store attributes (City, Region, Manager, Contact)

DimDate: Captures date, month, and year breakdown for time-based analysis

🧼 Data Transformation

Removed nulls, duplicates, and inconsistent values (e.g., mixed case, symbols like ₹ or k/L in revenue)

Unified formats (e.g., product names, region names, date fields)

Converted columns like revenue/cost to clean numeric formats

📊 Sample Insights

Top 10 best-selling products by revenue

Lowest profit margin items

Region-wise and store-wise sales performance

Monthly and quarterly sales trends

Products with declining sales month-over-month

🛠️ Tools Used

Microsoft SQL Server (SSMS 21)

SQL (DDL, DML, Joins, Aggregates, Window functions)

Excel (for staging raw datasets)

📄 Key SQL Concepts

Star Schema Design

Data Normalization (1NF, 2NF, 3NF)

Joins and Aggregation

Case statements, string/date functions

CTEs and RANK() for advanced analytics

Incremental Load Simulation
