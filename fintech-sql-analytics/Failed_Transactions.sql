--Filters failed transactions by amount in descending order to prioritize high-value payment errors.

SELECT 
    transaction_id, 
    sender_account_id, 
    amount,
	status
FROM transactions
WHERE status = 'failed'
ORDER BY amount DESC;
