--Filters user login events between 00:00 and 06:00 for fraud detection.

SELECT 
    user_id, 
    event_timestamp, 
    ip_address 
FROM audit_logs 
WHERE event_type = 'login' 
  AND EXTRACT(HOUR FROM event_timestamp) <= 6;
