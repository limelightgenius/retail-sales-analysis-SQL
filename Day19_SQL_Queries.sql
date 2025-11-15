CREATE TABLE orders (
    orderid INTEGER PRIMARY KEY,
    customername TEXT NOT NULL,
    city TEXT NOT NULL,
    productcategory TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INTEGER NOT NULL
);

INSERT INTO orders (orderid, customername, city, productcategory, price, quantity) VALUES
(1, 'Ella', 'London', 'Electronics', 200, 8),
(2, 'Clara', 'London', 'Furniture', 300, 5),
(3, 'Frank', 'Leeds', 'Electronics', 100, 8),
(4, 'David', 'Leeds', 'Furniture', 200, 1),
(5, 'Bob', 'Leeds', 'Electronics', 100, 8),
(6, 'Alice', 'Bristol', 'Clothing', 50, 10),
(7, 'Grace', 'Bristol', 'Furniture', 300, 1);


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
