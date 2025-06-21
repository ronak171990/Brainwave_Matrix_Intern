CREATE TABLE techzone_sales (
    sale_date          DATE,
    order_id           VARCHAR2(10),
    product_category   VARCHAR2(50),
    product_name       VARCHAR2(100),
    unit_price         NUMBER,
    quantity           NUMBER,
    revenue            NUMBER,
    customer_region    VARCHAR2(20),
    payment_method     VARCHAR2(30)
);

--1: Total Revenue by Region
SELECT customer_region, SUM(revenue) AS total_revenue
FROM techzone_sales
GROUP BY customer_region
ORDER BY total_revenue DESC;

--2: Monthly Revenue Trend
SELECT TO_CHAR(sale_date, 'YYYY-MM') AS month, SUM(revenue) AS total_revenue
FROM techzone_sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month;

--3: Top 5 Selling Products
SELECT product_name, SUM(quantity) AS units_sold
FROM techzone_sales
GROUP BY product_name
ORDER BY units_sold DESC
FETCH FIRST 5 ROWS ONLY;

--4: Category-wise Revenue
SELECT product_category, SUM(revenue) AS total_revenue
FROM techzone_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

--5: Payment Method Popularity
SELECT payment_method, COUNT(*) AS total_orders
FROM techzone_sales
GROUP BY payment_method
ORDER BY total_orders DESC;
