# Retail-Sales-SQL-Analysis
This project demonstrates core SQL skills in PostgreSQL using a realistic retail sales dataset. It covers table creation, null checks and clean up, and a set of analytic queries that generate insights on customers, categories, sales by time periods, and top customers.

Skills demonstrated;
-Data modeling and DDL in PostgreSQL
-Data quality checks and deletion of invalid rows
-Aggregate queries with COUNT, SUM, AVG and DISTINCT
-Date and time functions including EXTRACT and TO_CHAR
-CTEs for readable step wise analysis
-Grouping and ordering for reporting

Core steps
1. CREATE TABLE retail_sales (...)
2. Removed null/invalid rows using conditional DELETE
3. Explored dataset with COUNT, DISTINCT, and GROUP BY
4. Derived KPIs – category sales, top customers, avg sales per month
5. Built CTE for shift-based analysis (Morning, Afternoon, Evening)

Key Queries:
-Total and unique sales count
-Sales by category
-Top 5 customers by total_sale
-Average monthly sales
-Orders per shift using CASE + EXTRACT(HOUR)

Result:
Identified top performing categories, customer purchase patterns and time based sales trends.
This project demonstrates structured querying, data cleaning and business insight generation purely in SQL.
