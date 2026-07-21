--Foreign currency (EUR & GBP) account filter

SELECT 
    account_id, 
    user_id, 
    balance
FROM accounts
WHERE currency IN ('EUR', 'GBP');

/* 
SELECT 
    account_id, 
    user_id, 
    balance
FROM accounts
WHERE currency = 'EUR' OR currency = 'GBP';*/
