/*1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character*/

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
    
/*3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020*/

SELECT 
    *
FROM
    orders
WHERE
    ship_mode NOT IN ('Standard Class' , 'First Class')
        AND ship_date > '30-11-2020';

/*4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" */

SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name NOT LIKE 'A%n'

/*5- write a query to get all the orders where profit is negative */

SELECT 
    *
FROM
    orders
WHERE
    profit < 0;

/* 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 */

SELECT 
    *
FROM
    orders
WHERE
    quantity < 3 OR profit = 0;

/* 7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers*/

SELECT 
    *
FROM
    orders
WHERE
    region = 'South' AND discount > 0; 
