--Ranks accounts from highest to lowest balance within each currency category using window functions (ROW_NUMBER & PARTITION BY).

SELECT 
    account_id, 
    currency, 
    balance,
    ROW_NUMBER() OVER(PARTITION BY currency ORDER BY balance DESC) AS ranking
FROM accounts;
