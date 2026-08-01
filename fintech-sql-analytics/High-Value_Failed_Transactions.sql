SELECT 
    transaction_id, 
    sender_account_id, 
    amount
FROM transactions
WHERE status = 'failed'
ORDER BY amount DESC;
