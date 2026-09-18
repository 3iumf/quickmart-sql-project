CREATE DATABASE quickmart;

CUSTOMERS
---------
PK customer_id
     |
     | 1
     |
     | many
SALES
---------
PK sale_id
FK customer_id
FK product_id
     |
     | many
     |
     | 1
PRODUCTS
---------
PK product_id

-- =====================================
-- CREATE CUSTOMERS TABLE
-- =====================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20)
);


-- =====================================
-- CREATE PRODUCTS TABLE
-- =====================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    quantity_in_stock INT NOT NULL
);


-- =====================================
-- CREATE SALES TABLE
-- =====================================

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- =====================================
-- INSERT CUSTOMER DATA
-- =====================================

INSERT INTO customers
    (customer_id, customer_name, email, city, phone_number)
VALUES
    (1, 'Amina Yusuf', 'amina@gmail.com', 'Lagos', '08031234567'),
    (2, 'Brian Okafor', 'brian@gmail.com', 'Abuja', '08142345678'),
    (3, 'Chidinma Eze', NULL, 'Port Harcourt', '07053456789'),
    (4, 'Daniel Adeyemi', 'daniel@gmail.com', 'Ibadan', '09064567890'),
    (5, 'Fatima Musa', 'fatima@gmail.com', 'Kano', '08075678901'),
    (6, 'Grace Johnson', 'grace@gmail.com', 'Lagos', '08186789012'),
    (7, 'Ahmed Bello', 'ahmed@gmail.com', 'Abuja', '07097890123'),
    (8, 'Ada Nwosu', 'ada@gmail.com', 'Port Harcourt', '09018901234');

select * from customers;

-- =====================================
-- INSERT PRODUCT DATA
-- =====================================

INSERT INTO products
    (product_id, product_name, category, unit_price, quantity_in_stock)
VALUES
    (1, 'Laptop', 'Electronics', 450000.00, 15),
    (2, 'Smartphone', 'Electronics', 280000.00, 25),
    (3, 'Tablet', 'Electronics', 180000.00, 18),
    (4, 'Office Chair', 'Furniture', 85000.00, 35),
    (5, 'Monitor', 'Electronics', 150000.00, 12),
    (6, 'Keyboard', 'Accessories', 35000.00, 50),
    (7, 'Mouse', 'Accessories', 20000.00, 60),
    (8, 'Air Conditioner', 'Appliances', 320000.00, 10),
    (9, 'Office Desk', 'Furniture', 120000.00, 22),
    (10, 'Headphones', 'Accessories', 55000.00, 28);

select * from products;

-- =====================================
-- INSERT SALES DATA
-- =====================================

INSERT INTO sales
    (sale_id, customer_id, product_id, quantity, sale_date)
VALUES
    (1, 1, 1, 1, '2026-08-01'),
    (2, 2, 2, 2, '2026-08-02'),
    (3, 3, 6, 3, '2026-08-03'),
    (4, 4, 4, 1, '2026-08-05'),
    (5, 5, 8, 1, '2026-08-07'),
    (6, 6, 5, 2, '2026-08-10'),
    (7, 7, 3, 1, '2026-08-12'),
    (8, 8, 10, 2, '2026-08-14'),
    (9, 1, 7, 4, '2026-08-15'),
    (10, 2, 9, 1, '2026-08-17'),
    (11, 3, 2, 1, '2026-08-20'),
    (12, 4, 6, 5, '2026-08-22'),
    (13, 6, 1, 1, '2026-08-25'),
    (14, 7, 5, 2, '2026-08-27'),
    (15, 8, 4, 2, '2026-08-30');

select * from sales

-- =====================================
-- TASK 8.1: DISPLAY ALL CUSTOMERS
-- =====================================

SELECT * FROM customers;

-- =====================================
-- TASK 8.2: DISPLAY ALL PRODUCTS
-- =====================================

SELECT * FROM products;

-- =====================================
-- TASK 8.3: DISPLAY PRODUCT NAME AND PRICE
-- =====================================

SELECT product_name, unit_price
FROM products;

-- =====================================
-- TASK 8.4: DISPLAY CUSTOMER NAMES AND CITIES
-- =====================================

SELECT customer_name, city
FROM customers;

-- =====================================
-- TASK 9.1: CUSTOMERS FROM LAGOS
-- =====================================

SELECT *
FROM customers
WHERE city = 'Lagos';

-- =====================================
-- TASK 9.2: ELECTRONICS PRODUCTS
-- =====================================

SELECT *
FROM products
WHERE category = 'Electronics';

-- =====================================
-- TASK 9.3: PRODUCTS ABOVE ₦100,000
-- =====================================

SELECT *
FROM products
WHERE unit_price > 100000;

-- =====================================
-- TASK 9.4: PRODUCTS WITH LOW STOCK
-- =====================================

SELECT *
FROM products
WHERE quantity_in_stock < 20;

-- =====================================
-- TASK 10.1: ELECTRONICS ABOVE ₦200,000
-- =====================================

SELECT *
FROM products
WHERE category = 'Electronics'
AND unit_price > 200000;

-- =====================================
-- TASK 10.2: CUSTOMERS FROM LAGOS OR ABUJA
-- =====================================

SELECT *
FROM customers
WHERE city = 'Lagos'
OR city = 'Abuja';

-- =====================================
-- TASK 10.3: CUSTOMERS NOT FROM LAGOS
-- =====================================

SELECT *
FROM customers
WHERE NOT city = 'Lagos';

-- =====================================
-- TASK 11: CUSTOMERS IN SELECTED CITIES
-- =====================================

SELECT *
FROM customers
WHERE city IN ('Lagos', 'Abuja', 'Port Harcourt');

-- =====================================
-- TASK 12.1: PRODUCTS BETWEEN ₦50,000 AND ₦300,000
-- =====================================

SELECT *
FROM products
WHERE unit_price BETWEEN 50000 AND 300000;

-- =====================================
-- TASK 12.2: SALES BETWEEN TWO DATES
-- =====================================

SELECT *
FROM sales
WHERE sale_date BETWEEN '2026-08-10' AND '2026-08-25';

-- =====================================
-- TASK 13.1: NAMES STARTING WITH A
-- =====================================

SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

-- =====================================
-- TASK 13.2: NAMES ENDING WITH A
-- =====================================

SELECT *
FROM customers
WHERE customer_name LIKE '%a';

-- =====================================
-- TASK 13.3: GMAIL CUSTOMERS
-- =====================================

SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

-- =====================================
-- TASK 14.1: CUSTOMERS WITHOUT EMAIL
-- =====================================

SELECT *
FROM customers
WHERE email IS NULL;

-- =====================================
-- TASK 14.2: CUSTOMERS WITH EMAIL
-- =====================================

SELECT *
FROM customers
WHERE email IS NOT NULL;

-- =====================================
-- TASK 15: DISTINCT CITIES
-- =====================================

SELECT DISTINCT city
FROM customers;

-- =====================================
-- TASK 16.1: PRODUCTS CHEAPEST TO MOST EXPENSIVE
-- =====================================

SELECT *
FROM products
ORDER BY unit_price ASC;

-- =====================================
-- TASK 16.2: PRODUCTS MOST EXPENSIVE TO CHEAPEST
-- =====================================

SELECT *
FROM products
ORDER BY unit_price DESC;

-- =====================================
-- TASK 16.3: CUSTOMERS ALPHABETICALLY BY NAME
-- =====================================

SELECT *
FROM customers
ORDER BY customer_name ASC;

-- =====================================
-- TASK 17: TOP 5 MOST EXPENSIVE PRODUCTS
-- =====================================

SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- =====================================
-- TASK 18: CUSTOMER UPDATE (LAGOS -> ABUJA)
-- =====================================

-- Confirm the customer before updating
SELECT *
FROM customers
WHERE customer_id = 1;

UPDATE customers
SET city = 'Abuja'
WHERE customer_id = 1;

-- Confirm the update
SELECT *
FROM customers
WHERE customer_id = 1;

-- =====================================
-- TASK 19: PRODUCT PRICE UPDATE
-- =====================================

-- Confirm the product before updating
SELECT *
FROM products
WHERE product_id = 5;

UPDATE products
SET unit_price = 165000.00
WHERE product_id = 5;

-- Confirm the update
SELECT *
FROM products
WHERE product_id = 5;

-- =====================================
-- TASK 20: STOCK UPDATE
-- =====================================

-- Confirm the product before updating
SELECT *
FROM products
WHERE product_id = 7;

UPDATE products
SET quantity_in_stock = 45
WHERE product_id = 7;

-- Confirm the update
SELECT *
FROM products
WHERE product_id = 7;

-- =====================================
-- TASK 21: DELETE A RECORD
-- =====================================

-- A new customer is added here specifically to demonstrate a safe delete,
-- since customers 1-8 already have sales tied to them through the
-- foreign key in the sales table and cannot be deleted without first
-- removing their sales records.

INSERT INTO customers
    (customer_id, customer_name, email, city, phone_number)
VALUES
    (9, 'Tunde Bakare', 'tunde@gmail.com', 'Ibadan', '08023456789');

-- Step 1: SELECT the customer
SELECT *
FROM customers
WHERE customer_id = 9;

-- Step 2: Confirm the correct customer was selected (above)

-- Step 3: DELETE the customer
DELETE FROM customers
WHERE customer_id = 9;

-- Step 4: SELECT again to confirm the deletion
SELECT *
FROM customers
WHERE customer_id = 9;

-- =====================================
-- TASK 22: ALTER TABLE - ADD REGISTRATION_DATE
-- =====================================

ALTER TABLE customers
ADD COLUMN registration_date DATE;

SELECT *
FROM customers;

-- =====================================
-- TASK 23: ALTER TABLE - ADD BRAND
-- =====================================

ALTER TABLE products
ADD COLUMN brand VARCHAR(50);

UPDATE products
SET brand = 'Dell'
WHERE product_id = 1;

UPDATE products
SET brand = 'Samsung'
WHERE product_id = 2;

UPDATE products
SET brand = 'HP'
WHERE product_id = 5;

SELECT *
FROM products;

-- =====================================
-- TASK 25: UPSERT
-- =====================================

INSERT INTO products
    (product_id, product_name, category, unit_price, quantity_in_stock, brand)
VALUES
    (1, 'Laptop', 'Electronics', 470000.00, 10, 'Dell')
ON CONFLICT (product_id)
DO UPDATE SET
    unit_price = EXCLUDED.unit_price,
    quantity_in_stock = EXCLUDED.quantity_in_stock;

-- Confirm the result
SELECT *
FROM products
WHERE product_id = 1;

-- =====================================
-- FINAL CHALLENGE 1: TOP 3 MOST EXPENSIVE ELECTRONICS
-- =====================================

SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY unit_price DESC
LIMIT 3;

-- =====================================
-- FINAL CHALLENGE 2: CUSTOMERS WITH EMAIL IN SELECTED CITIES
-- =====================================

SELECT *
FROM customers
WHERE city IN ('Lagos', 'Abuja', 'Port Harcourt')
AND email IS NOT NULL;

-- =====================================
-- FINAL CHALLENGE 3: LOW STOCK, HIGH VALUE PRODUCTS
-- =====================================

SELECT *
FROM products
WHERE unit_price > 50000
AND quantity_in_stock < 30
ORDER BY quantity_in_stock ASC;

-- =====================================
-- FINAL CHALLENGE 4: SALES WITHIN A DATE RANGE
-- =====================================

SELECT *
FROM sales
WHERE sale_date BETWEEN '2026-08-01' AND '2026-08-15';

-- =====================================
-- FINAL CHALLENGE 5: UPDATE PHONE AND CITY IN ONE STATEMENT
-- =====================================
-- Confirm the customer before updating
SELECT *
FROM customers
WHERE customer_id = 4;

UPDATE customers
SET city = 'Kano',
    phone_number = '08099887766'
WHERE customer_id = 4;

-- Confirm the update
SELECT *
FROM customers
WHERE customer_id = 4;
