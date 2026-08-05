--Utilizes CTEs and the LAG() window function partitioned by account to calculate the exact time difference (in seconds) between consecutive transactions, flagging rapid succession events under a 60-second threshold.WITH TimeAnalysis AS (
  
SELECT 
        transaction_id,
        sender_account_id,
        amount,
        transaction_date,
        LAG(transaction_date) OVER (
            PARTITION BY sender_account_id 
            ORDER BY transaction_date
        ) AS previous_transaction_time
    FROM transactions
)
SELECT
    *,
    EXTRACT(EPOCH FROM (transaction_date - previous_transaction_time)) AS seconds_difference
FROM TimeAnalysis
WHERE EXTRACT(EPOCH FROM (transaction_date - previous_transaction_time)) < 60;
