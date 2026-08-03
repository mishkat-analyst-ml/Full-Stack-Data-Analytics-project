# Full-Stack-Data-Analytics-project

End-to-End Full Stack Data Analytics Project

Transforming Raw Sales Data into Executive-Level Business Intelligence using Python, SQL, Power BI, and Advanced Analytics.

# 🛒 Daraz Sales — Full-Stack Data Analytics Project

End-to-end analysis of 1,400 e-commerce orders — from raw CSV to cleaned dataset, Python EDA, SQL business queries, and an interactive Power BI dashboard.


## 📌 Project Overview

This project simulates a full analytics workflow on **Daraz** (e-commerce) sales data — covering data cleaning, exploratory analysis, SQL-based business querying, and dashboard reporting.

**Pipeline:** `Raw CSV → Python (clean + EDA) → Clean CSV → MySQL (business queries) → Power BI (dashboard)`

---

## 📊 Dataset

1,400 orders × 12 columns — no missing values, no duplicates. Fields: `Order_ID`, `Customer_Name`, `Customer_City`, `Product_Name`, `Category`, `Price`, `Quantity`, `Order_Date`, `Delivery_Date`, `Payment_Method`, `Order_Status`, `Seller_Name`.

## 🧹 Data Cleaning (Python)

- Converted `Order_Date` / `Delivery_Date` from string → datetime
- Standardized text (`Customer_City`, `Seller_Name` stripped; `Customer_Name` uppercased)
- Removed price outliers with the **IQR method**
- Engineered `sales = Price × Quantity`, `order_year`, `order_month`

## 🗃️ SQL Analysis

`Full stack Project.sql` covers: total revenue/customers,

top products & categories,

monthly/yearly trends,

revenue by payment method,

**customer segmentation** (Premium/Gold/Regular via `CASE`),

above-average sales via a **CTE**,

and window functions (`ROW_NUMBER`, `RANK`, running totals with `SUM() OVER`, `LAG()`)


## 📈 Key Business Insights

Pulled straight from the dashboard and the underlying `daraz_clean_dataset`:

| Metric | Value |
|---|---|
| Total Revenue | **PKR 4,142,920.91** (~4.14M) |
| Total Units Sold | **4,130** |
| Average Order Value | **PKR 2,959.23** |
| Highest Single Sale | **PKR 9,970** |
| Orders Analyzed | 1,400 |

**1. Electronics is the real revenue leader — not the biggest category by volume.**

Electronics generates **PKR 690,866.58 (16.68%)** of total revenue, 

ahead of Automotive (626,712.45 · 15.13%),

Beauty (607,695.79 · 14.67%),

Sports (602,537.32 · 14.54%),

Books (558,520.14 · 13.48%),

Home Appliances (541,951.31 · 13.08%),

and Fashion, the smallest at 514,637.32 (12.42%). 

The spread across all 7 categories is fairly tight — no single category dominates the store.


**2. Automotive and Electronics customers spend the most per order.**

Average sale value by category: 

Automotive (PKR 3,165.21)

and Electronics (PKR 3,140.30) lead,

while Fashion (PKR 2,708.62)

and Books (PKR 2,711.26) have the lowest basket sizes

useful for prioritizing upsell/bundle strategies on the lower-AOV categories.


**3. Order fulfillment is a problem area, not a strength.**
Revenue is split almost evenly across **Delivered, Cancelled, Returned, and Pending** (~PKR 1.0–1.1M each) in the waterfall breakdown. 

That means only roughly a quarter of total revenue corresponds to cleanly completed (Delivered) orders — Cancelled + Returned + Pending together account for the majority of order value, which is a strong flag for fulfillment/operations review rather than a marketing problem.

**4. 2024 vs 2025 isn't a real trend — it's a data coverage gap.**

The `order_year` chart shows revenue heavily concentrated in 2024 with only a small sliver in 2025, and the dashboard's own **YoY% shows 0.00%**.

This isn't a genuine year-over-year decline; it means the dataset only contains a partial slice of 2025 orders, so year-over-year comparisons shouldn't be trusted as-is without normalizing for the incomplete year.


**5. The monthly revenue trend chart has an axis-ordering bug worth calling out.**
`order_month` was created with `.dt.month_name()`, so when Pandas groups by month name it sorts **alphabetically, not chronologically** (the dashboard axis reads Oct → Jan → Jun → Sep... instead of Jan → Dec).

The downward-looking trend line is real in the underlying numbers but is currently unreadable as a "trend" because the x-axis isn't in calendar order. **Fix:** keep `order_month` as a `Period` or categorical ordered by `Order_Date.dt.month` before grouping, so the chart reads left-to-right chronologically.


## 🛠️ Tools & Tech

`Python` (Pandas, Matplotlib) · `MySQL` · `Power BI` · `Jupyter Notebook`

## 📁 Repository Structure

```
├── Full Stack data analytics.ipynb   # Data cleaning + EDA (Python)
├── Full stack Project.sql            # Business analysis queries (SQL)
├── DARAZ SALES..png                  # Dashboard - Page 1
├── Daraz Dashboard 2.png             # Dashboard - Page 2
└── README.md

# 🎯 Business Impact


This project demonstrates how a Data Analyst can convert raw transactional data into actionable business intelligence. The dashboards support executive decision-making by providing visibility into revenue performance, customer behavior, product trends, and regional demand. The included recommendations help improve marketing effectiveness, optimize inventory, enhance customer retention, and support data-driven growth strategies.

### 👤 Author

**Mishkat** — Aspiring Data Analyst
📫 [GitHub](https://github.com/mishkat-analyst-ml)
