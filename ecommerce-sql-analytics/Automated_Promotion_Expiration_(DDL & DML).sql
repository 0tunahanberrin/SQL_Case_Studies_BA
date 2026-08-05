--Creates a promotions table, populates it with test data, and automatically updates expired campaigns using condition-based DML operations.

CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    promotion_code VARCHAR(50) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    end_date TIMESTAMP NOT NULL
);

INSERT INTO promotions (promotion_id, promotion_code, discount_percentage, status, end_date) 
VALUES 
(1, 'SUMMER2026', 15.00, 'active', '2026-08-31 23:59:59'),
(2, 'WELCOME10', 10.00, 'active', '2026-07-01 00:00:00');

UPDATE promotions 
SET status = 'expired' 
WHERE end_date < CURRENT_TIMESTAMP;


/*
SELECT promotion_code, status, end_date 
FROM promotions 
WHERE status = 'expired';
*/
