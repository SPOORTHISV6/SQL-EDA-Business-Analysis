USE sql_eda_project;

-- =====================================================
-- 03 - DATE EXPLORATION
-- =====================================================


-- =====================================================
-- 1. EARLIEST AND LATEST ORDER
-- =====================================================

SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM fact_sales;


-- =====================================================
-- 2. ORDERS BY YEAR
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders
FROM fact_sales
GROUP BY YEAR(order_date)
ORDER BY order_year;


-- =====================================================
-- 3. SALES BY YEAR
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    SUM(sales_amount) AS total_sales
FROM fact_sales
GROUP BY YEAR(order_date)
ORDER BY order_year;


-- =====================================================
-- 4. SALES BY MONTH
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales
FROM fact_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- =====================================================
-- 5. ORDERS BY MONTH
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM fact_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- =====================================================
-- 6. SALES BY YEAR AND MONTH NAME
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTHNAME(order_date) AS month_name,
    SUM(sales_amount) AS total_sales
FROM fact_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    MONTH(order_date);