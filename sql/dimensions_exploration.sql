USE SQL_EDA_PROJECT;

SELECT DISTINCT COUNTRY FROM dim_customers;

SELECT DISTINCT GENDER FROM DIM_CUSTOMERS;


SELECT DISTINCT CATEGORY FROM dim_products ORDER BY CATEGORY;

SELECT DISTINCT subcategory FROM dim_products ORDER BY subcategory;

SELECT 
	DISTINCT CATEGORY,SUBCATEGORY,product_name 
FROM dim_products
ORDER BY 1,2,3;

SELECT
    category,
    COUNT(*) AS product_count
FROM dim_products
GROUP BY category
ORDER BY product_count DESC;

SELECT
	COUNTRY,
    COUNT(*) as CUSTOMERS_COUNT
FROM dim_customers
GROUP BY COUNTRY
ORDER BY CUSTOMERS_COUNT DESC;

SELECT
    gender,
    COUNT(*) AS customer_count
FROM dim_customers
GROUP BY gender
ORDER BY customer_count DESC;


SELECT
    marital_status,
    COUNT(*) AS customer_count
FROM dim_customers
GROUP BY marital_status
ORDER BY customer_count DESC;




