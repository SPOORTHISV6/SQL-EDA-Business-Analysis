USE sql_eda_project;

SHOW TABLES;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='DIM_PRODUCTS'; 

DESCRIBE dim_customers;
SELECT * FROM dim_customers LIMIT 10;

DESCRIBE dim_products;
SELECT * FROM dim_products LIMIT 10;

DESCRIBE fact_sales;
SELECT * FROM fact_sales LIMIT 10;

SELECT COUNT(*) AS total_customers
FROM dim_customers;

SELECT COUNT(*) AS total_products
FROM dim_products;

SELECT COUNT(*) AS total_sales_records
FROM fact_sales;