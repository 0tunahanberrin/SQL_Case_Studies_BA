--Aggregates transaction records by status to evaluate gateway performance, calculating total transaction counts and monetary volumes.

SELECT 
    status,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_volume
FROM transactions
GROUP BY status;
