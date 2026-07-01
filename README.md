# Superstore Sales Analysis

A business analysis project examining retail sales performance across regions, product categories, and customer segments using Excel and SQL.

---

## Business Problem

A US-based retail superstore was generating strong top-line revenue but struggling with inconsistent profitability across regions and product lines. The goal of this analysis was to identify where the business was losing money, why, and what actions could recover it.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Excel | Data cleaning, feature engineering, pivot table analysis, dashboard |
| SQLite | Structured business queries and cross-validation |
| Power BI | Interactive dashboard (in progress) |

---

## Dataset

- **Source:** [Sample Superstore — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Size:** 5,009 clean records after deduplication
- **Period:** January 2014 — December 2017
- **Fields:** Order ID, Order Date, Region, Category, Sub-Category, Sales, Profit, Quantity, Discount, Segment

---

## Key Findings

**1. Central region has a profitability problem, not a demand problem**
Central ranked 3rd in sales ($246K) but had the lowest profit margin at just 4.6% — compared to East at 15.9%. High discounting, not low demand, is the root cause.

**2. Furniture sub-categories are destroying value**
Tables lost $10,997 despite generating $104K in sales. Bookcases also ran at a loss. Meanwhile Copiers generated $22,403 profit from just 35 orders — $640 profit per order.

**3. Any discount above 20% loses money on average**
- No discount → +$62.12 avg profit per order
- Low discount (1-20%) → +$27.00 avg profit per order
- Medium discount (21-40%) → -$74.65 avg profit per order
- High discount (41%+) → -$107.52 avg profit per order

The 702 medium and high discount orders collectively lost $68,148 in profit.

**4. Revenue grew 72% over 3 years**
2016 was the breakout year at 41% YoY growth. Growth slowed to 14% in 2017, warranting monitoring for market saturation. Q4 was the strongest quarter every single year.

**5. Excessive discounting drives losses across all segments**
Consumer, Corporate and Home Office segments all showed average discounts above 48% on loss-making orders — confirming discounting policy, not segment weakness, is the root cause.

---

## Business Recommendations

1. **Cap discounts at 20%** — orders above this threshold consistently lose money. Enforcing this policy recovers an estimated $68K in annual profit.
2. **Reprice or discontinue Tables and Bookcases** — both run at a loss despite high sales volume.
3. **Prioritise Technology in promotions** — Copiers and Phones deliver the highest margin and should receive more promotional focus.
4. **Audit Central region discount approvals** — Central's 4.6% margin vs the 12% company average points to a structural discounting problem.
5. **Plan proactively for Q4 demand** — Q4 peaks every year; inventory and staffing should be scaled ahead of time.

---

## Dashboard

![Superstore Dashboard](superstore_dashboard.png)

---

## Files in This Repository

| File | Description |
|------|-------------|
| `README.md` | Project overview and findings |
| `superstore_cleaned.xlsx` | Cleaned dataset with engineered columns and pivot dashboard |
| `superstore_queries.sql` | All 5 SQL queries with business question comments |
| `superstore_dashboard.png` | Excel dashboard screenshot |
| `Superstore_Case_Study.pdf` | Full case study document |

---

## SQL Queries Covered

1. Regional performance — total sales, profit and margin by region
2. Sub-category profitability — top and bottom performers ranked by profit
3. Discount impact — average and total profit by discount band
4. Monthly sales trend — year-over-year revenue by month
5. Loss-making orders — count, total loss and avg discount by customer segment

---

*Project completed as part of a Business Analyst portfolio. Dataset sourced from Kaggle.*
