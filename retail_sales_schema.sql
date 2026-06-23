-- ─────────────────────────────────────────
--  RETAIL SALES & CUSTOMER ANALYTICS
--  Schema: Create Tables
-- ─────────────────────────────────────────

CREATE DATABASE IF NOT EXISTS retail_sales;
USE retail_sales;

-- 1. Customers
CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    city          VARCHAR(50),
    join_date     DATE
);

-- 2. Products
CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    price         DECIMAL(10, 2) NOT NULL
);

-- 3. Orders
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT NOT NULL,
    order_date    DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items (links orders to products)
CREATE TABLE order_items (
    item_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 5. Payments
CREATE TABLE payments (
    payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_id       INT NOT NULL,
    payment_date   DATE NOT NULL,
    amount         DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
