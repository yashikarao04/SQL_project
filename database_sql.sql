CREATE DATABASE zara_sale;

CREATE TABLE sales (
product_id INT NOT NULL,
product_position TEXT,
promotion BOOLEAN,
product_category VARCHAR(255),
seasonal BOOLEAN,
sales_volume INT,
url TEXT,
sku VARCHAR(255),
name VARCHAR(255),
description TEXT,
price DECIMAL(10, 2),
currency TEXT,
scraped_at TIMESTAMP,
terms TEXT,
section VARCHAR(50),
primary key (product_id)
);

