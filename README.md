# retail-sales-analysis-SQL

📊 SQL Mini Report – Retail Sales Analysis

Author: Ifeoluwa Samuel Sunday
Date: September 12, 2025

📖 Project Overview

This project demonstrates how SQL can be used to generate business insights from retail sales data.
It covers aggregations, grouping, subqueries, and ranking to answer real-world business questions.

Dataset used: Mock Orders Table

orderid

customername

city

productcategory

price

quantity

Revenue is calculated as:

revenue = price * quantity

🛠️ SQL Queries & Insights
1️⃣ Total Revenue by Product Category
SELECT productcategory, SUM(price*quantity) AS total_revenue
FROM orders
GROUP BY productcategory;


Insight: Electronics leads with £2900 revenue, followed by Furniture (£1900) and Clothing (£500).

2️⃣ Top 3 Customers by Spending
SELECT customername, SUM(price*quantity) AS total_spent
FROM orders
GROUP BY customername
ORDER BY total_spent DESC
LIMIT 3;


Insight: Ella (£1600) and Clara (£1500) are VIP customers.

3️⃣ Orders Above Average Revenue
SELECT orderid, customername, (price*quantity) AS revenue
FROM orders
WHERE (price*quantity) > (
    SELECT AVG(price*quantity)
    FROM orders
);


Insight: Only Clara (£1500) and Ella (£1600) placed orders above the £883 average.

4️⃣ City Performance
SELECT city, SUM(price*quantity) AS total_revenue
FROM orders
GROUP BY city
ORDER BY total_revenue DESC;


Insight: London (£2500) outperforms Leeds (£2000) and Bristol (£800).

5️⃣ VIP Customers (Above Average Customer Revenue)
SELECT customername, SUM(price*quantity) AS customer_revenue
FROM orders
GROUP BY customername
HAVING SUM(price*quantity) > (
    SELECT AVG(customer_revenue)
    FROM (
        SELECT SUM(price*quantity) AS customer_revenue
        FROM orders
        GROUP BY customername
    ) AS sub
);


Insight: Clara (£1500) and Ella (£1600) are VIPs worth loyalty programs.

6️⃣ Most Popular Category
SELECT productcategory, SUM(quantity) AS total_quantity
FROM orders
GROUP BY productcategory
ORDER BY total_quantity DESC;


Insight: Electronics sold 16 units → most popular category.

📌 Final Business Summary

Electronics dominates both in revenue (£2900) and units (16).

Ella & Clara are VIP customers to retain.

London is the best-performing market.

Sales are top-heavy, so the business should diversify its customer base.

📂 Files in this Project

Day19_SQL_Mini_Report.pdf → Polished one-page analyst report

queries.sql → SQL queries used in analysis

🚀 Skills Demonstrated

SQL Aggregations (SUM, AVG, COUNT, MIN, MAX)

GROUP BY + HAVING

Subqueries inside WHERE and HAVING

Ranking with ORDER BY

Business interpretation of query results
