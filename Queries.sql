/*1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)*/

SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name LIKE '_a%'
        AND customer_name LIKE '___d%'; 
        
SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name LIKE '_a_d%';
