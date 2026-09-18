USE SQL_EDA_PROJECT;

SELECT SUM(SALES_AMOUNT) AS TOTAL_SALES FROM fact_sales;

SELECT
    MIN(sales_amount) AS minimum_sale
FROM fact_sales;


SELECT
    MAX(sales_amount) AS maximum_sale
FROM fact_sales;




SELECT * FROM FACT_SALES;


SELECT COUNT(QUANTITY) AS TOTAL_SOLD_ITEMS FROM fact_sales;

SELECT COUNT(ORDER_NUMBER) AS TOTAL_ORDERS FROM FACT_SALES;

SELECT COUNT(DISTINCT PRODUCT_NAME) AS TOTAL_PRODUCTS FROM dim_products;

SELECT COUNT(DISTINCT CUSTOMER_KEY) AS TOTAL_CUSTOMERS FROM DIM_CUSTOMERS;


SELECT AVG(PRICE) AS AVG_PRICE FROM FACT_SALES;


SELECT
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_quantity,
    AVG(sales_amount) AS average_sales,
    MIN(sales_amount) AS minimum_sale,
    MAX(sales_amount) AS maximum_sale,
    COUNT(DISTINCT order_number) AS total_orders,
    COUNT(DISTINCT customer_key) AS total_customers,
    COUNT(DISTINCT product_key) AS total_products
FROM fact_sales;



