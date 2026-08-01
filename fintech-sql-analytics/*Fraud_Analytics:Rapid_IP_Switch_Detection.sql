--Utilizes CTEs and the LAG() window function to identify suspicious transactions where the same account initiates consecutive transactions from different IP addresses within a 60-second window.

WITH IpAndTimeAnalysis AS ( 
    SELECT 
        transaction_id, 
        sender_account_id, 
        ip_address, 
        transaction_date, 
        LAG(ip_address) OVER (PARTITION BY sender_account_id ORDER BY transaction_date) AS previous_ip, 
        LAG(transaction_date) OVER (PARTITION BY sender_account_id ORDER BY transaction_date) AS previous_transaction_time 
    FROM transactions 
) 
SELECT 
    transaction_id, 
    sender_account_id, 
    ip_address, 
    transaction_date, 
    previous_ip, 
    previous_transaction_time
FROM IpAndTimeAnalysis 
WHERE ip_address != previous_ip 
  AND EXTRACT(EPOCH FROM (transaction_date - previous_transaction_time)) < 60;
