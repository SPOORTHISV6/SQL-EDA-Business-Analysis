USE sql_eda_project;

-- =====================================================
-- 07 - ADVANCED ANALYSIS
-- Independent Portfolio Analysis
-- =====================================================


-- =====================================================
-- 1. REVENUE BY CUSTOMER
-- =====================================================

WITH customer_sales AS
(
    SELECT
        customer_key,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY customer_key
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC;


-- =====================================================
-- 2. CUSTOMER SEGMENTATION
-- =====================================================

WITH customer_sales AS
(
    SELECT
        customer_key,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY customer_key
)
SELECT
    customer_key,
    total_sales,
    CASE
        WHEN total_sales >= 10000 THEN 'High Value'
        WHEN total_sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_sales
ORDER BY total_sales DESC;


-- =====================================================
-- 3. NUMBER OF CUSTOMERS BY SEGMENT
-- =====================================================

WITH customer_sales AS
(
    SELECT
        customer_key,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY customer_key
),
segmented_customers AS
(
    SELECT
        customer_key,
        total_sales,
        CASE
            WHEN total_sales >= 10000 THEN 'High Value'
            WHEN total_sales >= 5000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customer_sales
)
SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM segmented_customers
GROUP BY customer_segment
ORDER BY customer_count DESC;


-- =====================================================
-- 4. REVENUE BY CUSTOMER SEGMENT
-- =====================================================

WITH customer_sales AS
(
    SELECT
        customer_key,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY customer_key
),
segmented_customers AS
(
    SELECT
        customer_key,
        total_sales,
        CASE
            WHEN total_sales >= 10000 THEN 'High Value'
            WHEN total_sales >= 5000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customer_sales
)
SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_sales) AS segment_revenue,
    AVG(total_sales) AS average_customer_revenue
FROM segmented_customers
GROUP BY customer_segment
ORDER BY segment_revenue DESC;


-- =====================================================
-- 5. CATEGORY CONTRIBUTION TO TOTAL SALES
-- =====================================================

WITH category_sales AS
(
    SELECT
        p.category,
        SUM(s.sales_amount) AS category_sales
    FROM fact_sales s
    JOIN dim_products p
        ON s.product_key = p.product_key
    GROUP BY p.category
)
SELECT
    category,
    category_sales,
    ROUND(
        category_sales * 100.0 /
        SUM(category_sales) OVER (),
        2
    ) AS percentage_of_total_sales
FROM category_sales
ORDER BY category_sales DESC;


-- =====================================================
-- 6. CUMULATIVE SALES BY DATE
-- =====================================================

WITH daily_sales AS
(
    SELECT
        order_date,
        SUM(sales_amount) AS daily_sales
    FROM fact_sales
    GROUP BY order_date
)
SELECT
    order_date,
    daily_sales,
    SUM(daily_sales) OVER (
        ORDER BY order_date
    ) AS cumulative_sales
FROM daily_sales
ORDER BY order_date;


-- =====================================================
-- 7. MONTHLY SALES
-- =====================================================

WITH monthly_sales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT
    sales_year,
    sales_month,
    total_sales
FROM monthly_sales
ORDER BY
    sales_year,
    sales_month;


-- =====================================================
-- 8. YEAR-OVER-YEAR SALES COMPARISON
-- =====================================================

WITH yearly_sales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY YEAR(order_date)
)
SELECT
    sales_year,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_year
    ) AS previous_year_sales,
    total_sales -
    LAG(total_sales) OVER (
        ORDER BY sales_year
    ) AS sales_difference
FROM yearly_sales
ORDER BY sales_year;


-- =====================================================
-- 9. TOP 10 PRODUCTS USING ROW_NUMBER()
-- =====================================================

WITH product_sales AS
(
    SELECT
        p.product_name,
        SUM(s.sales_amount) AS total_sales
    FROM fact_sales s
    JOIN dim_products p
        ON s.product_key = p.product_key
    GROUP BY p.product_name
),
ranked_products AS
(
    SELECT
        product_name,
        total_sales,
        ROW_NUMBER() OVER (
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT *
FROM ranked_products
WHERE product_rank <= 10;


-- =====================================================
-- 10. AVERAGE ORDER VALUE
-- =====================================================

SELECT
    SUM(sales_amount) /
    COUNT(DISTINCT order_number) AS average_order_value
FROM fact_sales;