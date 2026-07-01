-- ============================================================
-- QUERY 1: Regional Performance
-- Business Question: Which region drives the most revenue
-- and which has the lowest profit margin?
-- ============================================================

SELECT
    "Region",
    ROUND(SUM("Sales"), 2)                       AS total_sales,
    ROUND(SUM("Profit"), 2)                      AS total_profit,
    ROUND(SUM("Profit") / SUM("Sales") * 100, 1) AS profit_margin_pct
FROM superstore
GROUP BY "Region"
ORDER BY total_sales DESC;

-- FINDING: Central region ranked 3rd in sales but had the
-- lowest profit margin at 4.6% vs East at 15.9%.
-- Root cause: excessive discounting, not weak demand.


-- ============================================================
-- QUERY 2: Sub-Category Profitability
-- Business Question: Which product sub-categories are the
-- most and least profitable?
-- ============================================================

SELECT
    "Category",
    "SubCategory",
    ROUND(SUM("Sales"), 2)          AS total_sales,
    ROUND(SUM("Profit"), 2)         AS total_profit,
    COUNT(DISTINCT "Order ID")      AS order_count
FROM superstore
GROUP BY "Category", "SubCategory"
ORDER BY total_profit DESC;

-- FINDING: Copiers generated $22,403 profit from just 35
-- orders ($640 per order). Tables lost $10,997 despite
-- $104K in sales — worst performing sub-category.


-- ============================================================
-- QUERY 3: Discount Impact on Profitability
-- Business Question: Does higher discounting always hurt
-- profitability? At what point do orders become loss-making?
-- ============================================================

SELECT
    CASE
        WHEN "Discount" = 0    THEN 'No Discount'
        WHEN "Discount" <= 0.2 THEN 'Low (1-20%)'
        WHEN "Discount" <= 0.4 THEN 'Medium (21-40%)'
        ELSE                        'High (41%+)'
    END                             AS discount_band,
    COUNT(*)                        AS orders,
    ROUND(AVG("Profit"), 2)         AS avg_profit,
    ROUND(SUM("Profit"), 2)         AS total_profit
FROM superstore
GROUP BY discount_band
ORDER BY avg_profit DESC;

-- FINDING: Any discount above 20% results in negative
-- average profit. High discount orders lost $107.52 per
-- order on average. 702 orders across medium and high
-- bands collectively lost $68,148 in profit.


-- ============================================================
-- QUERY 4: Monthly Sales Trend (Year-over-Year)
-- Business Question: Is the business growing year over year?
-- Which months and quarters are strongest?
-- ============================================================

SELECT
    STRFTIME('%Y', "Order Date")    AS year,
    STRFTIME('%m', "Order Date")    AS month,
    ROUND(SUM("Sales"), 2)          AS monthly_sales,
    ROUND(SUM("Profit"), 2)         AS monthly_profit
FROM superstore
GROUP BY year, month
ORDER BY year, month;

-- FINDING: Revenue grew 72% from 2014 ($207K) to 2017
-- ($357K). 2016 was the breakout year at 41% YoY growth.
-- November 2017 was the single highest revenue month at
-- $62,912. Q4 was the strongest quarter every year.


-- ============================================================
-- QUERY 5: Loss-Making Orders by Customer Segment
-- Business Question: Which customer segments account for
-- the most loss-making orders and what is driving the losses?
-- ============================================================

SELECT
    "Segment",
    COUNT(*)                            AS loss_orders,
    ROUND(SUM("Profit"), 2)             AS total_loss,
    ROUND(AVG("Discount") * 100, 1)     AS avg_discount_pct
FROM superstore
WHERE "Profit" < 0
GROUP BY "Segment"
ORDER BY total_loss;

-- FINDING: All 3 segments show average discounts above 48%
-- on loss-making orders. Consumer segment had the highest
-- total loss at $40,118 across 496 orders. Excessive
-- discounting — not segment weakness — is the root cause
-- across all segments.


-- ============================================================
-- BONUS: Cross-validation check
-- Verify SQL totals match Excel pivot table figures
-- ============================================================

SELECT
    ROUND(SUM("Sales"), 2)   AS grand_total_sales,
    ROUND(SUM("Profit"), 2)  AS grand_total_profit,
    COUNT(*)                 AS total_rows
FROM superstore;

-- Expected: Sales ~$1,099,862 | Profit ~$132,516 | Rows: 5009
-- If these match your Excel Grand Total row, the pipeline
-- is consistent and data integrity is confirmed.
