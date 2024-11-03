SELECT * FROM zara_sale.sales;

SELECT * 
FROM sales;

-- Retrive the total no. of orders placed. 

SELECT COUNT(product_id) AS total_orders
FROM sales;

-- Determine the range of product prices 

SELECT price, count(*) AS product_count 
FROM sales
GROUP BY price 
ORDER BY product_count DESC;

- Identify the top-selling products in terms of sales volume.

SELECT name, sales_volume, price
FROM sales 
ORDER BY sales_volume desc
LIMIT 10;

-- Understand which section performs best in terms of sales.

SELECT section, SUM(sales_volume) AS total_sales
FROM sales 
GROUP BY section 
ORDER BY total_sales;

-- Compare sales between seasonal and non-seasonal products.

SELECT seasonal, SUM(sales_volume) AS total_sales
FROM sales
GROUP BY seasonal 
ORDER BY total_sales;

-- Analyze whether promotional products generate more sales.

SELECT promotion, SUM(sales_volume) AS total_sales
FROM sales
GROUP BY promotion;

-- Sales by Price Range: Analyze how products at different price ranges perform.

SELECT 
	CASE 
		WHEN price < 20 THEN 'Under $20'
        WHEN price BETWEEN 20 AND 50 THEN '$20-$50'
        WHEN price BETWEEN 51 AND 100 THEN '$51-$100'
		ELSE 'OVER $100'
    END AS price_range,
    SUM(sales_volume) AS total_sales
    FROM sales
    GROUP BY price_range
    ORDER BY total_sales DESC;
    
-- Promotion Success by Category: Find out if promotions in certain categories are more effective.

SELECT product_category, 
	SUM(sales_volume) AS total_sales, 
	SUM(CASE WHEN promotion = 1 THEN sales_volume ELSE 0 END) AS promotion_sales
FROM sales 
GROUP BY product_category
ORDER BY promotion_sales DESC;        

-- No. of sales with or without promotion 

SELECT SUM(sales_volume) AS total_sales, promotion
FROM sales
GROUP BY promotion;



