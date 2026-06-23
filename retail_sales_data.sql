-- ─────────────────────────────────────────
--  RETAIL SALES & CUSTOMER ANALYTICS
--  Sample Data
-- ─────────────────────────────────────────

USE retail_sales;

-- Customers
INSERT INTO customers (name, email, city, join_date) VALUES
('Stuti Maheska',   'stuti@gmail.com',   'Patna',     '2023-01-15'),
('Aman Verma',      'aman@gmail.com',    'Delhi',     '2023-02-10'),
('Priya Sharma',    'priya@gmail.com',   'Mumbai',    '2023-03-05'),
('Rohit Singh',     'rohit@gmail.com',   'Kolkata',   '2023-04-20'),
('Neha Gupta',      'neha@gmail.com',    'Bangalore', '2023-05-18'),
('Karan Mehta',     'karan@gmail.com',   'Chennai',   '2023-06-22'),
('Pooja Jain',      'pooja@gmail.com',   'Hyderabad', '2023-07-11'),
('Arjun Das',       'arjun@gmail.com',   'Pune',      '2023-08-30'),
('Sneha Mishra',    'sneha@gmail.com',   'Jaipur',    '2023-09-14'),
('Vikram Nair',     'vikram@gmail.com',  'Surat',     '2023-10-03');

-- Products
INSERT INTO products (product_name, category, price) VALUES
('Laptop',           'Electronics',  55000.00),
('Smartphone',       'Electronics',  20000.00),
('Headphones',       'Electronics',   3500.00),
('Desk Chair',       'Furniture',    12000.00),
('Study Table',      'Furniture',     8000.00),
('Python Book',      'Books',          600.00),
('SQL Guide',        'Books',          450.00),
('Backpack',         'Accessories',   1500.00),
('Water Bottle',     'Accessories',    300.00),
('Notebook Set',     'Stationery',     250.00);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1,  '2024-01-10'),
(2,  '2024-01-15'),
(3,  '2024-02-01'),
(4,  '2024-02-14'),
(5,  '2024-03-05'),
(1,  '2024-03-20'),
(6,  '2024-04-02'),
(7,  '2024-04-18'),
(2,  '2024-05-07'),
(8,  '2024-05-25'),
(9,  '2024-06-10'),
(10, '2024-06-30'),
(3,  '2024-07-15'),
(5,  '2024-07-28'),
(1,  '2024-08-05');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,  1, 1),   -- Laptop
(1,  3, 2),   -- Headphones x2
(2,  2, 1),   -- Smartphone
(3,  4, 1),   -- Desk Chair
(3,  6, 2),   -- Python Book x2
(4,  5, 1),   -- Study Table
(5,  2, 1),   -- Smartphone
(5,  8, 1),   -- Backpack
(6,  7, 3),   -- SQL Guide x3
(7,  1, 1),   -- Laptop
(8,  3, 1),   -- Headphones
(9,  9, 4),   -- Water Bottle x4
(10, 10, 5),  -- Notebook Set x5
(11, 2, 1),   -- Smartphone
(12, 4, 1),   -- Desk Chair
(13, 6, 1),   -- Python Book
(14, 8, 2),   -- Backpack x2
(15, 1, 1);   -- Laptop

-- Payments
INSERT INTO payments (order_id, payment_date, amount, payment_method) VALUES
(1,  '2024-01-10', 62000.00, 'UPI'),
(2,  '2024-01-15', 20000.00, 'Credit Card'),
(3,  '2024-02-01', 13200.00, 'Debit Card'),
(4,  '2024-02-14',  8000.00, 'UPI'),
(5,  '2024-03-05', 21500.00, 'Net Banking'),
(6,  '2024-03-20',  1350.00, 'UPI'),
(7,  '2024-04-02', 55000.00, 'Credit Card'),
(8,  '2024-04-18',  3500.00, 'UPI'),
(9,  '2024-05-07',  1200.00, 'Cash'),
(10, '2024-05-25',  1250.00, 'UPI'),
(11, '2024-06-10', 20000.00, 'Debit Card'),
(12, '2024-06-30', 12000.00, 'Credit Card'),
(13, '2024-07-15',   600.00, 'UPI'),
(14, '2024-07-28',  3000.00, 'Net Banking'),
(15, '2024-08-05', 55000.00, 'Credit Card');
