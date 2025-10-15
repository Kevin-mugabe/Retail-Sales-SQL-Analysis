-- create TABLE
CREATE TABLE retail_sales
            (
                transactions_id INT PRIMARY KEY,
                sale_date DATE,
                sale_time TIME,
                customer_id INT,
                gender VARCHAR(15),
                age INT,
				category  VARCHAR(15),
                quantiy INT,
                price_per_unit FLOAT,
                cogs FLOAT,
                total_sale FLOAT
            );

SELECT * FROM retail_sales
LIMIT 10;

SELECT 
  COUNT (*)
  FROM retail_sales;


--data cleaning
SELECT * FROM retail_sales
WHERE 
      transactions_id IS NULL
	  OR
	  sale_date IS NULL
	  OR
	  sale_time IS NULL
	  OR 
	  gender IS NULL
	  OR
	  quantiy IS NULL
	  OR
	  cogs IS NULL
	  OR
	  total_sale IS NULL
	  
	  ;

DELETE FROM retail_sales
 WHERE 
      transactions_id IS NULL
	  OR
	  sale_date IS NULL
	  OR
	  sale_time IS NULL
	  OR 
	  gender IS NULL
	  OR
	  quantiy IS NULL
	  OR
	  cogs IS NULL
	  OR
	  total_sale IS NULL
	  
	  ;

-- data exploration

-- how many sales 
SELECT COUNT (*)  as total_sales FROM retail_sales;

--how many unique customers 
SELECT COUNT(DISTINCT customer_id)  as total_sales FROM retail_sales;

-- distinct category
SELECT DISTINCT category FROM retail_sales;

-- Business problems
--all sales on '2022-11-05'
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05'

--transactions where category is 'clothing', quantity sold is more than 4 in Nov-2022
 SELECT
    category,
	SUM(quantiy)
FROM retail_sales
WHERE  category = 'clothing'
     AND 
	 TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	 AND 
	 quantiy >= 4
	 GROUP BY 1
	 ;

--total sales for each category
SELECT 
     category,
	 SUM(total_sale) as net_sale,
	 COUNT(*) AS total_orders
FROM retail_sales
 GROUP BY 1

-- average age of customers who purchased items from the Beauty category
SELECT 
   ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE  category = 'Beauty'

-- transactions where total_sale is greater than 1000
 SELECT * FROM retail_sales
 WHERE 
      total_sale > 1000

--total number of transactions made by each gender in each category
SELECT 
     category,
	 gender,
	 COUNT(*) as total_trans
FROM retail_sales
GROUP 
  BY 
  category,
  gender
 ORDER BY 1

--average sale for each month
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
	EXTRACT(MONTH FROM sale_date) as month,
	AVG(total_sale) as avg_sales
FROM retail_sales
GROUP BY 1, 2 
ORDER BY 1, 2

--top 5 customers based on the highest total sales
SELECT 
  customer_id,
  SUM(total_sale) as total_sales
FROM  retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--number of unique customers who purchased items from each category
SELECT
  category,
  COUNT(DISTINCT customer_id) as count_unique_customers
FROM  retail_sales
GROUP BY 1

--shifts and number of orders per shift
WITH hourly_sale
AS
(
SELECT 
  CASE
      WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
      WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
   END as shift
FROM retail_sales
)
SELECT 
shift,
  COUNT(*) as total_orders
 FROM hourly_sale
 GROUP BY shift
 





