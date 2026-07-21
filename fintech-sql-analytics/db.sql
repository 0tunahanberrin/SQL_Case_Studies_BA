-- Drop existing tables to ensure the script is idempotent
DROP TABLE IF EXISTS audit_logs CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- 1. Users Table
-- Tracks customer details, KYC (Know Your Customer) status, and referral hierarchy.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    kyc_status VARCHAR(20), -- Status constraints: 'verified', 'pending', 'rejected'
    registration_date DATE,
    referred_by INT REFERENCES users(user_id) 
);

-- 2. Accounts Table
-- Manages user wallets, supporting multiple currencies and balance tracking.
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    account_type VARCHAR(20), -- Type constraints: 'checking', 'savings'
    currency VARCHAR(3),
    balance DECIMAL(15, 2),
    is_active BOOLEAN DEFAULT TRUE
);

-- 3. Transactions Table
-- Records peer-to-peer fund transfers and transaction statuses.
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    sender_account_id INT REFERENCES accounts(account_id),
    receiver_account_id INT REFERENCES accounts(account_id),
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP,
    status VARCHAR(20) -- Status constraints: 'completed', 'failed', 'pending'
);

-- 4. Audit Logs Table
-- Captures user activities for security monitoring and fraud detection.
CREATE TABLE audit_logs (
    log_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    event_type VARCHAR(50), -- Event constraints: 'login', 'transfer', 'password_change'
    ip_address VARCHAR(20),
    event_timestamp TIMESTAMP
);

-- =========================================
-- MOCK DATA INSERTION
-- =========================================

-- Insert Users
-- Establishes referral hierarchy: John -> Jane -> Emily
INSERT INTO users (first_name, last_name, kyc_status, registration_date, referred_by) VALUES 
('John', 'Doe', 'verified', '2025-01-10', NULL),
('Jane', 'Smith', 'verified', '2025-02-15', 1),
('Michael', 'Brown', 'pending', '2026-07-20', 1),
('Emily', 'Davis', 'rejected', '2026-01-05', 2);

-- Insert Accounts
INSERT INTO accounts (user_id, account_type, currency, balance) VALUES 
(1, 'checking', 'USD', 15000.00),
(1, 'savings', 'EUR', 2500.00),
(2, 'checking', 'USD', 8500.00),
(3, 'checking', 'USD', 0.00),
(4, 'checking', 'GBP', 120.00);

-- Insert Transactions
-- Simulates successful transfers and a failed transaction attempt.
INSERT INTO transactions (sender_account_id, receiver_account_id, amount, transaction_date, status) VALUES 
(1, 3, 2500.00, '2026-06-01 10:30:00', 'completed'),
(1, 3, 500.00, '2026-07-20 14:15:00', 'completed'),
(5, 1, 1000.00, '2025-11-15 09:00:00', 'failed'), 
(3, 1, 150.00, '2026-07-21 11:20:00', 'completed');

-- Insert Audit Logs
-- Simulates a rapid IP change (potential account takeover scenario).
INSERT INTO audit_logs (user_id, event_type, ip_address, event_timestamp) VALUES 
(1, 'login', '192.168.1.10', '2026-07-20 14:00:00'),
(3, 'login', '10.0.0.5', '2026-07-21 11:15:00'),
(3, 'login', '172.16.0.8', '2026-07-21 11:16:45');