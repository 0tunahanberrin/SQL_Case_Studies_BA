--Correlated subquery example finding products priced above their category average in an e-commerce database.

SELECT product_name, category_id, price 
FROM products AS main_list
WHERE price > (
    SELECT AVG(price) 
    FROM products AS calculator
    WHERE calculator.category_id = main_list.category_id
);
