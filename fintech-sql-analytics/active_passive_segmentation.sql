--A query that categorizes customers as 'Active' or 'Passive' based on their transaction history over the last 6 months using CASE WHEN.

SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name,
    MAX(t.transaction_date) AS last_transaction_date, 
    CASE 
        WHEN MAX(t.transaction_date) IS NULL OR CURRENT_DATE - MAX(t.transaction_date)::DATE > 180 THEN 'Passive' 
        ELSE 'Active' 
    END AS customer_status
FROM users u
LEFT JOIN accounts a ON u.user_id = a.user_id
LEFT JOIN transactions t ON a.account_id = t.sender_account_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY 
    u.user_id;
