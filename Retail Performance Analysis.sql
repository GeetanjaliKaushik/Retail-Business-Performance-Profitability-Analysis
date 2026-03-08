SELECT * FROM shopping_mall.customer_shopping_dataset;
SELECT * FROM shopping_mall.customer_shopping_dataset
WHERE invoice_no IS NULL
   OR customer_id IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price IS NULL;
   
SET SQL_SAFE_UPDATES = 0;
DELETE FROM shopping_mall.customer_shopping_dataset
WHERE invoice_no IS NULL
   OR customer_id IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price IS NULL;   
SET SQL_SAFE_UPDATES = 1;

# Calculate Profit Margin by Category
SELECT category,
    SUM(quantity * price) AS total_revenue,
    ROUND(AVG(price),2) AS avg_price,
    SUM(quantity) AS total_units_sold
FROM shopping_mall.customer_shopping_dataset
GROUP BY category
ORDER BY total_revenue DESC;

# Profit Margin (Assuming of 30% Cost)
SELECT category,
    SUM(quantity * price) AS total_revenue,
    SUM(quantity * price) * 0.30 AS estimated_cost,
    SUM(quantity * price) * 0.70 AS estimated_profit,
    70 AS profit_margin_percent
FROM shopping_mall.customer_shopping_dataset
GROUP BY category
ORDER BY profit_margin_percent DESC;

# Top 5 Revenue Generating Categories
SELECT category,
    SUM(quantity * price) AS total_revenue
FROM shopping_mall.customer_shopping_dataset
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 5;

# Revenue by Shopping Mall Location
SELECT shopping_mall,
    SUM(quantity * price) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM shopping_mall.customer_shopping_dataset
GROUP BY shopping_mall
ORDER BY total_revenue DESC;

# Mall-wise Category Performance
SELECT 
    shopping_mall,
    category,
    SUM(quantity * price) AS total_revenue
FROM
    shopping_mall.customer_shopping_dataset
GROUP BY shopping_mall , category
ORDER BY shopping_mall , total_revenue DESC;

# Gender-wise Revenue Analysis
SELECT 
    gender,
    SUM(quantity * price) AS total_revenue,
    COUNT(DISTINCT customer_id) AS total_customers
FROM shopping_mall.customer_shopping_dataset
GROUP BY gender;


# 