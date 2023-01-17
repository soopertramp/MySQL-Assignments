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
    
/*2- write a sql to get all the orders placed in the month of dec 2020 */

SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-12-2020' AND '31-12-2020';
