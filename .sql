-- ======================================================
-- Week 1 Database Assignment: Online Shop System
-- Author: Mayen Sarr
-- ======================================================

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS online_shop_db;

-- 2. Select the database
USE online_shop_db;

-- 3. Create Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

-- 5. Create Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 6. Insert sample records to verify structure
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Ayiik', 'Mayen', 'ayiik.mayen@example.com', '+254700123456'),
('Amara', 'Diallo', 'amara.diallo@example.com', '+254711987654');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mechanical Keyboard', 'Electronics', 85.00, 25),
('USB-C Docking Station', 'Accessories', 49.99, 40),
('Ergonomic Laptop Stand', 'Office', 32.50, 15);

-- 7. Verify database, tables, and data
SHOW DATABASES;
SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM products;
