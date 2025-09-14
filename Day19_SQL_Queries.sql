-- 1️⃣ Total Revenue by Product Category
SELECT productcategory, SUM(price*quantity) AS total_revenue
FROM orders
GROUP BY productcategory;

-- 2️⃣ Top 3 Customers by Spending
SELECT customername, SUM(price*quantity) AS total_spent
FROM orders
GROUP BY customername
ORDER BY total_spent DESC
LIMIT 3;

-- 3️⃣ Orders Above Average Revenue
SELECT orderid, customername, (price*quantity) AS revenue
FROM orders
WHERE (price*quantity) > (
    SELECT AVG(price*quantity)
    FROM orders
);

-- 4️⃣ City Performance – Ranked by Revenue
SELECT city, SUM(price*quantity) AS total_revenue
FROM orders
GROUP BY city
ORDER BY total_revenue DESC;

-- 5️⃣ VIP Customers (Above Average Customer Revenue)
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

-- 6️⃣ Most Popular Product Category (by Quantity Sold)
SELECT productcategory, SUM(quantity) AS total_quantity
FROM orders
GROUP BY productcategory
ORDER BY total_quantity DESC;
