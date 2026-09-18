# SQL EDA Business Analysis - Analysis Notes

## 1. Project Overview

This project performs Exploratory Data Analysis (EDA) on a sales database using MySQL.

The analysis focuses on three major areas:

- Customer information
- Product information
- Sales transactions

The database contains three main tables:

- `dim_customers`
- `dim_products`
- `fact_sales`

The analysis uses SQL to explore the database structure, understand customer and product dimensions, analyze sales over time, calculate business measures, identify high-performing products and customers, and rank business entities based on revenue.

---

# 2. Database Exploration

## Objective

The purpose of database exploration is to understand the structure and contents of the available data before performing deeper analysis.

## Tables Explored

### dim_customers

This table contains customer-related information.

The analysis checks:

- Table structure
- Customer records
- Available columns
- Number of customers
- Customer attributes

### dim_products

This table contains product-related information.

The analysis checks:

- Product structure
- Product records
- Product attributes
- Number of products
- Product categories

### fact_sales

This table contains sales transaction information.

The analysis checks:

- Sales transaction structure
- Order information
- Sales amount
- Quantity
- Product references
- Customer references
- Number of sales records

## Analysis Performed

The database exploration queries:

- Display all tables
- Inspect table columns
- View sample customer records
- View sample product records
- View sample sales records
- Count customers
- Count products
- Count sales records

## Business Purpose

This initial exploration provides an understanding of the database before performing analytical queries.

It also helps identify the relationships between:

Customer → Sales → Product

---

# 3. Dimensions Exploration

## Objective

The objective of dimension exploration is to understand the different categories and characteristics present in the customer and product data.

## Customer Dimensions

The following customer attributes are explored:

- Country
- Gender
- Marital status

### Country Analysis

The analysis identifies the distinct countries represented in the customer database.

Customer counts are also calculated for each country.

This helps understand the geographical distribution of customers.

### Gender Analysis

The analysis identifies the available gender categories and calculates the number of customers belonging to each category.

This provides an overview of the customer demographic distribution.

### Marital Status Analysis

The analysis calculates customer counts based on marital status.

This helps understand the composition of the customer base.

---

## Product Dimensions

The product analysis explores:

- Category
- Subcategory
- Product name

The analysis identifies the unique product categories and subcategories.

It also creates a detailed hierarchy:

Category → Subcategory → Product

### Product Count by Category

The number of products belonging to each category is calculated.

This helps identify categories with larger or smaller product portfolios.

---

# 4. Date Exploration

## Objective

The objective of date exploration is to understand the time period covered by the sales data and identify sales and order patterns over time.

## Date Range

The earliest and latest order dates are identified using:

- MIN(order_date)
- MAX(order_date)

This establishes the time period covered by the dataset.

---

## Orders by Year

The number of orders is grouped by year.

This allows comparison of order activity across different years.

### Business Question

Which year recorded the highest number of orders?

The query output can be used to identify the year with the highest order volume.

---

## Sales by Year

Total sales are calculated for each year.

This allows yearly revenue performance to be compared.

### Business Questions

- Which year generated the highest sales?
- Which year generated the lowest sales?
- How does sales performance vary between years?

---

## Sales by Month

Sales are grouped by:

- Year
- Month

This allows monthly revenue patterns to be studied.

### Business Questions

- Which months generate higher sales?
- Are there noticeable seasonal patterns?
- Are some months consistently stronger than others?

---

## Orders by Month

The number of orders is calculated for each year and month.

This helps compare order activity with sales performance.

For example, a month with many orders may not necessarily generate the highest revenue if the average transaction value is lower.

---

## Month Name Analysis

The analysis also displays sales using month names.

This makes the results easier to interpret when reviewing monthly trends.

---

# 5. Measures Exploration

## Objective

The measures analysis calculates important numerical indicators that summarize overall business performance.

## Total Sales

The total sales amount is calculated using:

SUM(sales_amount)

This represents the overall sales value recorded in the sales table.

---

## Minimum Sale

The minimum sales transaction value is identified.

This shows the smallest recorded sales amount.

---

## Maximum Sale

The maximum sales transaction value is identified.

This shows the largest recorded sales amount.

---

## Total Sold Items

The analysis examines the quantity field to understand the volume of products sold.

---

## Total Orders

The analysis examines the order number field to determine order volume.

---

## Total Products

The product table is analyzed to determine the number of distinct products.

---

## Total Customers

The customer table is analyzed to determine the number of distinct customers.

---

## Average Price

The average price from the sales data is calculated.

This provides an overall view of the average transaction price represented in the dataset.

---

## Combined Business Metrics

The final query combines several important metrics:

- Total sales
- Total quantity
- Average sales
- Minimum sale
- Maximum sale
- Total orders
- Total customers
- Total products

This provides a high-level summary of business performance.

---

# 6. Magnitude Analysis

## Objective

Magnitude analysis examines the size of important business measures across different dimensions.

The analysis connects the dimension tables with the sales fact table using JOIN operations.

---

## Customer Distribution by Country

The number of customers is calculated for each country.

### Business Question

Which countries have the largest customer base?

This helps identify the geographical concentration of customers.

---

## Customer Distribution by Gender

Customer counts are calculated by gender.

This provides an overview of the demographic distribution of customers.

---

## Product Distribution by Category

The number of products is calculated for every product category.

This helps understand the size of each product category.

---

## Average Product Cost by Category

The average product cost is calculated for each category.

### Business Questions

- Which category has the highest average cost?
- Which category has the lowest average cost?

This can help understand differences in product pricing/cost structure across categories.

---

## Revenue by Product Category

Sales transactions are joined with product information to calculate total revenue for each category.

### Business Questions

- Which category contributes the most revenue?
- Which category contributes the least revenue?

This helps identify important revenue-generating product categories.

---

## Items Sold by Country

The sales and customer tables are joined to calculate total quantity sold by country.

### Business Questions

- Which country has the highest sales volume?
- Which country has the lowest sales volume?

This provides a geographical view of product demand.

---

## Revenue by Subcategory

The sales data is joined with product information to calculate total revenue by subcategory.

This allows more detailed product performance analysis than category-level analysis.

---

## Revenue by Customer

Total sales revenue is calculated for each customer.

This helps identify customers who contribute significant revenue to the business.

---

# 7. Ranking Analysis

## Objective

Ranking analysis identifies the highest- and lowest-performing products and customers.

---

## Top 5 Products by Revenue

Products are ranked based on their total revenue.

The query returns the top 5 products.

### Business Question

Which products generate the highest revenue?

---

## Bottom 5 Products by Revenue

Products are ordered by revenue in ascending order.

The query returns the bottom 5 products based on revenue.

### Business Question

Which products generate the lowest revenue?

These products may require further investigation regarding:

- Demand
- Pricing
- Product positioning
- Availability
- Customer interest

---

## Top 10 Customers by Revenue

Customers are ranked according to total revenue generated.

The analysis returns the top 10 customers.

### Business Question

Which customers contribute the most revenue?

These customers represent the highest-revenue customer group within the analyzed sales data.

---

## Customer Order Analysis

The analysis calculates the number of orders associated with each customer.

The customers are sorted according to order count.

This helps identify customers with higher purchasing activity.

---

## Revenue by Category

Categories are ranked according to total sales revenue.

This provides a comparison of category-level financial performance.

---

## Product Revenue Ranking

A SQL window function is used to assign a ranking to products based on total revenue.

The analysis uses:

RANK() OVER (ORDER BY SUM(sales_amount) DESC)

This demonstrates the use of SQL window functions for analytical ranking.

---

# 8. SQL Techniques Demonstrated

The project demonstrates several important SQL concepts.

## Basic SQL

- SELECT
- DISTINCT
- ORDER BY
- LIMIT

## Aggregation

- COUNT()
- COUNT(DISTINCT ...)
- SUM()
- AVG()
- MIN()
- MAX()

## Grouping

- GROUP BY

## Joins

- LEFT JOIN
- INNER JOIN

The joins connect:

```text
dim_customers → fact_sales
dim_products  → fact_sales