-- ─────────────────────────────────────────
--  RETAIL SALES & CUSTOMER ANALYTICS
--  Analysis Queries (this is your project's main work)
-- ─────────────────────────────────────────

USE retail_sales;

-- ─────────────────────────────────────────
--  1. TOTAL REVENUE
-- ─────────────────────────────────────────
SELECT SUM(amount) AS total_revenue
FROM payments;

-- ─────────────────────────────────────────
--  2. MONTHLY REVENUE TREND
-- ─────────────────────────────────────────
SELECT 
    MONTHNAME(payment_date) AS month,
    MONTH(payment_date)     AS month_num,
    SUM(amount)             AS monthly_revenue
FROM payments
GROUP BY MONTHNAME(payment_date), MONTH(payment_date)
ORDER BY month_num;

-- ─────────────────────────────────────────
--  3. TOP 5 HIGH-VALUE CUSTOMERS
-- ─────────────────────────────────────────
SELECT 
    c.customer_id,
    c.name,
    c.city,
    SUM(p.amount) AS total_spent
FROM customers c
JOIN orders   o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id    = p.order_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- ─────────────────────────────────────────
--  4. CATEGORY-WISE REVENUE
-- ─────────────────────────────────────────
SELECT 
    pr.category,
    SUM(pr.price * oi.quantity) AS category_revenue,
    COUNT(oi.item_id)           AS total_items_sold
FROM products    pr
JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.category
ORDER BY category_revenue DESC;

-- ─────────────────────────────────────────
--  5. BEST SELLING PRODUCTS
-- ─────────────────────────────────────────
SELECT 
    pr.product_name,
    pr.category,
    SUM(oi.quantity)            AS total_quantity_sold,
    SUM(pr.price * oi.quantity) AS total_revenue
FROM products    pr
JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_name, pr.category
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- ─────────────────────────────────────────
--  6. CUSTOMERS WHO ORDERED MORE THAN ONCE
-- ─────────────────────────────────────────
SELECT 
    c.name,
    c.email,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

-- ─────────────────────────────────────────
--  7. MOST PREFERRED PAYMENT METHOD
-- ─────────────────────────────────────────
SELECT 
    payment_method,
    COUNT(*)    AS total_transactions,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- ─────────────────────────────────────────
--  8. CITY-WISE REVENUE
-- ─────────────────────────────────────────
SELECT 
    c.city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    SUM(p.amount)                 AS total_revenue
FROM customers c
JOIN orders   o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id    = p.order_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- ─────────────────────────────────────────
--  9. AVERAGE ORDER VALUE PER CUSTOMER
-- ─────────────────────────────────────────
SELECT 
    c.name,
    COUNT(o.order_id)             AS total_orders,
    SUM(p.amount)                 AS total_spent,
    ROUND(AVG(p.amount), 2)       AS avg_order_value
FROM customers c
JOIN orders   o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id    = p.order_id
GROUP BY c.customer_id, c.name
ORDER BY avg_order_value DESC;

-- ─────────────────────────────────────────
--  10. FULL ORDER DETAILS REPORT (4-table JOIN)
-- ─────────────────────────────────────────
SELECT 
    o.order_id,
    c.name              AS customer_name,
    c.city,
    pr.product_name,
    pr.category,
    oi.quantity,
    pr.price,
    (pr.price * oi.quantity) AS item_total,
    p.payment_method,
    p.payment_date
FROM orders      o
JOIN customers   c  ON o.customer_id  = c.customer_id
JOIN order_items oi ON o.order_id     = oi.order_id
JOIN products    pr ON oi.product_id  = pr.product_id
JOIN payments    p  ON o.order_id     = p.order_id
ORDER BY o.order_id;
