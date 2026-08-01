--Utilizes Common Table Expressions (CTE) and the ROW_NUMBER() window function partitioned by customer and amount to identify and isolate duplicate transactions chronologically.

WITH OrderedTransactions AS (
    SELECT 
        transaction_id, 
        sender_account_id, 
        amount, 
        transaction_date, 
        ROW_NUMBER() OVER (
            PARTITION BY sender_account_id, amount 
            ORDER BY transaction_date
        ) AS row_num
    FROM transactions
) 
SELECT 
    transaction_id, 
    sender_account_id, 
    amount, 
    transaction_date
FROM OrderedTransactions 
WHERE row_num > 1;
