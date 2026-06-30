# 📊 Superstore Sales Analytics — From Raw CSV to Boardroom-Ready Dashboard

> 9,994 messy rows. One spreadsheet full of inconsistent regions, duplicate orders, and unformatted dates. By the end of this project, that same data is answering the three questions every sales leader actually cares about: **where are we winning, where are we bleeding money, and what do we do next?**

This repo is my end-to-end walkthrough of a real Data Analytics & BI workflow — not a tutorial copy-paste, but the actual cleaning decisions, SQL logic, and dashboard design choices I made while working through the Superstore Sales dataset.

---

## 🧠 Why this project exists

Most "data analyst portfolio projects" stop at a pretty chart. This one doesn't.

The goal here was to simulate what actually happens in a junior analyst's first real assignment: you're handed a raw export, zero documentation, and a vague ask to "find insights." So I treated it that way — clean first, question the data constantly, and only then start visualizing.

If you're hiring, learning, or just nosy about how a Superstore-style dataset turns into a working BI dashboard, this is the whole trail — code, queries, and reasoning included.

---

## 🗂️ What's Inside

| File | What it does |
|---|---|
| `cleaned_sales_data.xlsx` | Cleaned & enriched dataset — deduplicated, standardized regions/categories, formatted dates, plus pivot tables and embedded charts across 8 sheets |
| `superstore_queries.sql` | 8 SQL queries covering regional performance, category profitability, monthly trends, discount impact, and top customers |
| `business_insights_report.pdf` | 1–2 page executive summary translating the numbers into actual recommendations |
| `Internship DashBoard(SuperStore).pbix` | Power BI dashboard file |
| `powerbi_dashboard_screenshot.png` | Final dashboard preview |

---

## 🔍 The Process

**1. Data Cleaning (Excel)**
Inspected for missing values, duplicate rows, inconsistent region spelling (`East`, `EAST`, `east` → all standardized), and malformed dates — then rebuilt the dataset into something a pivot table wouldn't choke on.

**2. Exploratory Data Analysis**
Pivot tables to surface total sales, profit, average order value, and quantity sold — broken down by region, category, month, top customers, and top products.

**3. SQL Extraction**
Wrote aggregation queries to answer specific business questions: which region sells the most, which category actually makes money, and where discounts start eating into profit.

**4. Power BI Dashboard**
Built an interactive dashboard with KPI cards, regional and shipping-mode comparisons, category profit contribution, a sales distribution treemap, and a discount-vs-profit scatter plot — because a number without context is just trivia.

---

## 📌 The Headline Numbers

- **Total Sales:** $2.30M | **Total Profit:** $286.40K | **5,009 Orders**
- **West region** leads in both sales ($0.73M) and profit ($0.83M)
- **Technology** is the most profitable category (50.79% of total profit) — **Furniture** lags far behind at just 6.44%
- Discounts beyond a certain threshold visibly tip orders into **negative profit** — confirmed in the scatter plot, not just assumed

---

## 🛠️ Tools Used

`Microsoft Excel` · `SQL` · `Power BI`

---

## 🚀 What I'd Build Next

- Predictive churn/CLV modeling on top customers
- Automated refresh pipeline instead of static CSV ingestion
- Regional drill-through pages for deeper Central/South diagnostics

---

## 👤 Author

**Author — DHANAKIRAN G**

If this was useful, helped you learn something, or you just want to argue about whether Furniture deserves to exist as a category — feel free to connect or open an issue.
