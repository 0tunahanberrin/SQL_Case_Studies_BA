-- ============================================================
-- 1. TABLE CREATION (DDL)
-- ============================================================

-- Users / Customers Table (Scenario 1 & 12)
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP
);

-- iOS Platform Users Table (Scenario 2)
CREATE TABLE ios_users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100)
);

-- Web Platform Users Table (Scenario 2)
CREATE TABLE web_users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100)
);

-- Product Categories Table (Scenario 6)
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Products Table (Scenario 6)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT REFERENCES categories(category_id),
    price DECIMAL(10, 2)
);

-- Orders Table (Scenario 7, 8 & 12)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date TIMESTAMP,
    total_amount DECIMAL(10, 2)
);

-- Invoices / Transaction Records Table (Scenario 13 - For identifying skipped sequence IDs)
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    issued_at TIMESTAMP
);


-- ============================================================
-- 2. MOCK DATA INSERTION (DML)
-- ============================================================

-- Inserting Users (Contains duplicate email records)
INSERT INTO users (user_id, full_name, email, created_at) VALUES
(1, 'Ahmet Yılmaz', 'ahmet.yilmaz@gmail.com', '2025-01-10 10:00:00'),
(2, 'Ahmet Yılmaz', 'ahmet.yilmaz@gmail.com', '2025-01-15 11:00:00'), -- Duplicate email
(3, 'Ayşe Kaya', 'ayse.kaya@hotmail.com', '2025-01-20 14:30:00'),
(4, 'Mehmet Demir', 'mehmet.demir@yahoo.com', '2025-02-01 09:15:00'),
(5, 'Mehmet Demir', 'mehmet.demir@yahoo.com', '2025-02-10 12:00:00'), -- Duplicate email
(6, 'Mehmet Demir', 'mehmet.demir@yahoo.com', '2025-02-12 16:45:00'), -- Duplicate email (3rd entry)
(7, 'Zeynep Çelik', 'zeynep.celik@gmail.com', '2025-02-15 18:00:00'),
(8, 'Caner Şahin', 'caner.sahin@outlook.com', '2025-03-01 08:00:00');

-- Inserting iOS Platform Users
INSERT INTO ios_users (user_id, full_name, email) VALUES
(101, 'Ahmet Yılmaz', 'ahmet.yilmaz@gmail.com'),
(102, 'Selin Aydın', 'selin.aydin@gmail.com'),
(103, 'Burak Öztürk', 'burak.ozturk@gmail.com');

-- Inserting Web Platform Users
INSERT INTO web_users (user_id, full_name, email) VALUES
(201, 'Selin Aydın', 'selin.aydin@gmail.com'), -- User existing in both iOS & Web
(202, 'Deniz Arslan', 'deniz.arslan@gmail.com'),
(203, 'Ece Yılmaz', 'ece.yilmaz@gmail.com');

-- Inserting Product Categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Apparel'),
(3, 'Home & Living');

-- Inserting Products
INSERT INTO products (product_id, product_name, category_id, price) VALUES
(10, 'Headphones', 1, 1500.00),
(11, 'Smartwatch', 1, 4500.00), -- Above category average price
(12, 'Wireless Mouse', 1, 800.00),
(13, 'T-Shirt', 2, 400.00),
(14, 'Jacket', 2, 2200.00),      -- Above category average price
(15, 'Jeans', 2, 900.00),
(16, 'Coffee Maker', 3, 3500.00), -- Above category average price
(17, 'Coffee Mug', 3, 150.00);

-- Inserting Orders (Spanning different months and spending amounts)
INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(1001, 1, '2025-01-05 10:00:00', 1500.00),
(1002, 1, '2025-03-12 11:30:00', 3000.00),
(1003, 1, '2025-05-20 16:00:00', 500.00),  -- Ahmet Yılmaz first: Jan, last: May
(1004, 3, '2025-01-15 09:00:00', 12000.00), -- Ayşe Kaya (High Spender - Top 25%)
(1005, 3, '2025-04-10 14:00:00', 8000.00),
(1006, 4, '2025-02-01 10:00:00', 2500.00),
(1007, 7, '2025-02-15 15:00:00', 150.00),  -- Zeynep Çelik (Lowest Spender)
(1008, 8, '2025-03-01 12:00:00', 4500.00),
(1009, 8, '2025-03-25 18:00:00', 1200.00);

-- Inserting Invoices (Skipped/Missing IDs: 3, 6, 7, 9 do not exist)
INSERT INTO invoices (invoice_id, amount, issued_at) VALUES
(1, 150.00, '2025-01-01 09:00:00'),
(2, 300.00, '2025-01-02 10:00:00'),
-- ID 3 Skipped (Missing)
(4, 500.00, '2025-01-04 11:00:00'),
(5, 250.00, '2025-01-05 12:00:00'),
-- IDs 6 and 7 Skipped (Missing)
(8, 900.00, '2025-01-08 15:00:00'),
-- ID 9 Skipped (Missing)
(10, 1200.00, '2025-01-10 17:00:00');
