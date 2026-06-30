-- ============================================================
-- Superstore Sales Dataset - SQL Queries
-- Task 1: Data Analytics & Business Intelligence
-- Maincrafts Technology Internship
-- ============================================================

-- ── CREATE TABLE ────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS sales (
    order_id       VARCHAR(50),
    order_date     DATE,
    ship_date      DATE,
    ship_mode      VARCHAR(50),
    customer_id    VARCHAR(20),
    customer_name  VARCHAR(100),
    segment        VARCHAR(50),
    country        VARCHAR(50),
    city           VARCHAR(100),
    state          VARCHAR(100),
    postal_code    VARCHAR(20),
    region         VARCHAR(50),
    product_id     VARCHAR(50),
    category       VARCHAR(50),
    sub_category   VARCHAR(50),
    product_name   VARCHAR(255),
    sales          DECIMAL(10,2),
    quantity       INT,
    discount       DECIMAL(5,2),
    profit         DECIMAL(10,2)
);

-- ============================================================
-- QUERY 1: Total Sales by Region
-- Business Question: Which region generates the highest sales?
-- ============================================================
SELECT
    region,
    SUM(sales)                         AS total_sales,
    SUM(profit)                        AS total_profit,
    COUNT(DISTINCT order_id)           AS total_orders,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Expected Result:
-- West   | $725,457.76  | highest sales
-- East   | $678,781.30
-- Central| $501,239.76
-- South  | $391,721.83  | lowest sales


-- ============================================================
-- QUERY 2: Top 5 Most Profitable Categories
-- Business Question: Which category is most profitable?
-- ============================================================
SELECT
    category,
    SUM(profit)                             AS total_profit,
    SUM(sales)                              AS total_sales,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 5;

-- Expected Result:
-- Technology      | $145,455  | most profitable (17.4% margin)
-- Office Supplies | $122,490  | (17.0% margin)
-- Furniture       |  $18,451  | least profitable (2.5% margin)


-- ============================================================
-- QUERY 3: Monthly Sales Trend
-- Business Question: Which month performs best?
-- ============================================================
SELECT
    MONTH(order_date)   AS month_num,
    MONTHNAME(order_date) AS month_name,
    SUM(sales)          AS total_sales,
    SUM(profit)         AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_num;

-- SQLite alternative (replace MONTH/MONTHNAME):
-- SELECT
--     CAST(strftime('%m', order_date) AS INTEGER) AS month_num,
--     strftime('%m', order_date)                  AS month_name,
--     SUM(sales)                                  AS total_sales,
--     SUM(profit)                                 AS total_profit
-- FROM sales
-- GROUP BY strftime('%m', order_date)
-- ORDER BY month_num;


-- ============================================================
-- QUERY 4: Highest Discount Impact on Profit
-- Business Question: Are discounts affecting profit?
-- ============================================================
SELECT
    discount,
    COUNT(*)            AS num_transactions,
    ROUND(AVG(profit), 2)  AS avg_profit,
    ROUND(SUM(profit), 2)  AS total_profit,
    ROUND(AVG(sales), 2)   AS avg_sales
FROM sales
GROUP BY discount
ORDER BY discount;

-- Insight: As discount increases above 0.2, average profit drops sharply
-- into negative territory, confirming discounts hurt profitability.


-- ============================================================
-- QUERY 5: Top 10 Customers by Sales
-- Business Question: Who are the highest-value customers?
-- ============================================================
SELECT
    customer_name,
    SUM(sales)                    AS total_sales,
    SUM(profit)                   AS total_profit,
    COUNT(DISTINCT order_id)      AS total_orders,
    ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin_pct
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- QUERY 6: Sales by Sub-Category (Top 5 Products)
-- Business Question: Which product lines drive the most revenue?
-- ============================================================
SELECT
    sub_category,
    SUM(sales)   AS total_sales,
    SUM(profit)  AS total_profit,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- QUERY 7: Year-over-Year Sales Summary
-- ============================================================
SELECT
    YEAR(order_date) AS year,
    SUM(sales)       AS total_sales,
    SUM(profit)      AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY YEAR(order_date)
ORDER BY year;

-- SQLite: Use strftime('%Y', order_date) instead of YEAR()


-- ============================================================
-- QUERY 8: Segment Performance
-- ============================================================
SELECT
    segment,
    SUM(sales)   AS total_sales,
    SUM(profit)  AS total_profit,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin_pct
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;
