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

/*8- write a query to find top 5 orders with highest sales in furniture category*/

SELECT 
    *
FROM
    orders
WHERE
    category = 'Furniture'
order by sales desc
LIMIT 5; 

/*9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only*/

SELECT 
    *
FROM
    orders
WHERE
    category IN ('Technology' , 'Furniture')
        AND order_date BETWEEN '01-01-2020' AND '31-12-2020';

/* 10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 */

SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2020'
        AND ship_date > '01-01-2021';

/*11- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909*/

SELECT 
    *
FROM
    orders;
    
UPDATE orders 
SET 
    city = NULL
WHERE
    order_id IN ('CA-2020-161389' , 'US-2021-156909');
    
/*12- write a query to find orders where city is null (2 rows)*/

SELECT 
    *
FROM
    orders
WHERE
    city IS NULL; 

/*13- write a query to get total profit, first order date and latest order date for each category*/

SELECT 
    category,
    SUM(profit) AS profit,
    MIN(order_date) AS first_order,
    MAX(order_date) AS latest_order
FROM
    orders
GROUP BY category;

/*14- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category*/

SELECT 
    sub_category
FROM
    orders
GROUP BY sub_category
HAVING AVG(profit) > MAX(profit) / 2;

/*15- create the exams table with below script; and write a query to find students who have got same marks in Physics and Chemistry.*/

CREATE TABLE exams (
    student_id INT,
    subject VARCHAR(20),
    marks INT
);

INSERT INTO exams VALUES 
(1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

SELECT 
    *
FROM
    exams;

SELECT 
    student_id, subject, marks
FROM
    exams
WHERE
    subject IN ('Physics' , 'Chemistry')
GROUP BY student_id , marks
HAVING COUNT(*) = 2;

SELECT 
    student_id,
    COUNT(*) AS total_records,
    COUNT(DISTINCT marks) AS distinct_marks
FROM
    exams
WHERE
    subject IN ('Physics' , 'Chemistry')
GROUP BY student_id
HAVING COUNT(*) = 2
    AND COUNT(DISTINCT marks) = 1;

/*16. Write a query to findout the all the students marks in chemistry subject?*/

SELECT 
    student_id, subject, marks
FROM
    exams
WHERE
    subject = 'Chemistry'
GROUP BY student_id, marks;

/*17- write a query to find total number of products in each category.*/

select * from orders;

SELECT 
    category, COUNT(DISTINCT prodcut_name) AS no_of_products
FROM
    orders
GROUP BY category;

SELECT 
    category, COUNT(DISTINCT product_id) AS no_of_products
FROM
    orders
GROUP BY category;

/* 18- write a query to find top 5 sub categories in west region by total quantity sold*/

SELECT 
    sub_category, SUM(quantity) AS total_quantity
FROM
    orders
WHERE
    region = 'West'
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;

/*19. Write a query to find total sales for each region and ship mode combination for orders in year 2020*/

SELECT 
    region, ship_mode, SUM(sales) AS total_sales
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2021'
GROUP BY region , ship_mode
ORDER BY region , ship_mode;

/*20. Write a query to find total sales for each region*/

SELECT 
    region, SUM(sales) AS total_sales
FROM
    orders
GROUP BY region; 

/*21- write a query to get region wise count of return orders*/

SELECT 
    *
FROM
    orders;
    
SELECT 
    *
FROM
    returns;

SELECT 
    o.region, COUNT(DISTINCT o.order_id) AS no_of_items_returned
FROM
    orders AS o
        INNER JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY o.region;

/*22- write a query to get category wise sales of orders that were not returned*/

SELECT 
    o.category,
    sum(o.sales) as total_sales
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
WHERE
    o.order_id != r.order_id
GROUP BY o.category;

SELECT 
    o.category, SUM(o.sales) AS total_sales
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
WHERE
    o.order_id IS NULL
GROUP BY o.category;

/*23- write a query to print dep name and average salary of employees in that dep .*/

select * from employee;
select * from dept;

SELECT 
    d.dep_name, AVG(salary) AS salary
FROM
    dept AS d
        INNER JOIN
    employee AS e ON d.dep_id = e.dept_id
GROUP BY d.dep_name;

/*24- write a query to print dep names where none of the employees have same salary.*/

SELECT 
    *
FROM
    employee;
    
SELECT 
    *
FROM
    dept;

SELECT 
    e.dept_id, d.dep_name
FROM
    employee e
        INNER JOIN
    dept d ON e.dept_id = d.dep_id
GROUP BY e.dept_id , d.dep_name
HAVING COUNT(e.emp_id) = COUNT(DISTINCT e.salary)

/*25- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)*/

SELECT 
    *
FROM
    orders;
    
SELECT 
    *
FROM
    returns;

SELECT 
    o.sub_category, COUNT(DISTINCT r.return_reason) as return_reason
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY o.sub_category
HAVING COUNT(DISTINCT r.return_reason) = 3
ORDER BY o.sub_category;

/*26- write a query to find cities where not even a single order was returned.*/

SELECT 
    *
FROM
    orders;
    
SELECT 
    *
FROM
    returns;

SELECT 
    o.order_id, o.city
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY city
HAVING COUNT(r.order_id) = 0;

SELECT 
    o.order_id,o.city
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY city
HAVING COUNT(r.return_reason) = 0

/*27- write a query to find top 3 subcategories by sales of returned orders in east region*/

SELECT 
    *
FROM
    orders;
    
SELECT 
    *
FROM
    returns;

SELECT 
    o.sub_category, SUM(o.sales) AS total_return_sales
FROM
    orders AS o
        INNER JOIN
    returns AS r ON o.order_id = r.order_id
WHERE
    o.region = 'east'
GROUP BY o.sub_category
ORDER BY total_return_sales DESC
LIMIT 3;

/*28- write a query to print dep name for which there is no employee*/

SELECT 
    *
FROM
    employee;
SELECT 
    *
FROM
    dept;

SELECT 
    d.dep_id, d.dep_name
FROM
    dept AS d
        LEFT JOIN
    employee AS e ON d.dep_id = e.dept_id
GROUP BY d.dep_id
HAVING COUNT(e.emp_id) = 0; 

/*29- write a query to print employees name for dep id is not avaiable in dept table*/

SELECT 
    *
FROM
    employee;
SELECT 
    *
FROM
    dept;

SELECT 
    e.emp_id, e.emp_name
FROM
    employee AS e
        LEFT JOIN
    dept AS d ON e.dept_id = d.dep_id
WHERE
    d.dep_id IS NULL;

-- SELECT 
--     e.emp_id, e.emp_name
-- FROM
--     employee AS e
--         LEFT JOIN
--     dept AS d ON e.dept_id = d.dep_id
-- GROUP BY e.emp_id
-- HAVING COUNT(d.dep_id) = 0

/*31- write a query to print emp name , their manager name joining the same table (self join)*/

SELECT 
    *
FROM
    employee;
SELECT 
    *
FROM
    dept;

SELECT 
    e1.emp_name, e2.emp_name AS manager_name
FROM
    employee AS e1
        JOIN
    employee AS e2 ON e1.manager_id = e2.emp_id;

/*32- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)*/

SELECT 
    *
FROM
    orders;

SELECT 
    o.sub_category
FROM
    orders AS o
        INNER JOIN
    returns AS r ON o.order_id = r.order_id
WHERE
    MONTH(o.order_Date) = '11'
GROUP BY o.sub_category
HAVING COUNT(r.order_id) = 0;

/*33- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
write a query to find order ids where there is only 1 product bought by the customer.*/

SELECT 
    *
FROM
    orders;
    
SELECT 
    order_id
FROM
    orders
GROUP BY order_id
HAVING COUNT(order_id) = 1;

/*34- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly 
reporting to him.*/

select * from employee;
select * from dept;

SELECT 
    e2.emp_name AS manager_name,
    GROUP_CONCAT(e1.emp_name
        ORDER BY e1.salary DESC
        SEPARATOR ',') AS emp_list
FROM
    employee AS e1
        INNER JOIN
    employee AS e2 ON e1.manager_id = e2.emp_id
GROUP BY e2.emp_name;

/*35- write a query to get number of business days between order_date and ship_date (exclude weekends). Assume that all order date 
and ship date are on weekdays only */

SELECT 
    DATEDIFF(ship_date, order_date) - FLOOR(DATEDIFF(ship_date, order_date) / 7) * 2 AS business_days
FROM
    orders;

/*36- write a query to print 3 columns : category, total_sales and (total sales of returned orders)*/

SELECT 
    *
FROM
    orders;
SELECT 
    *
FROM
    returns;

SELECT 
    o.category,
    SUM(o.sales) AS total_sales,
    SUM(CASE
        WHEN r.order_id IS NOT NULL THEN sales
    END) AS return_orders_sales
FROM
    orders o
        LEFT JOIN
    returns r ON o.order_id = r.order_id
GROUP BY category

/*37- write a query to print 3 columns category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)*/

SELECT 
    category,
    SUM(CASE
        WHEN YEAR(order_Date) = 2019 THEN sales
    END) AS total_sales_2019,
    SUM(CASE
        WHEN YEAR(order_Date) = 2020 THEN sales
    END) AS total_sales_2020
FROM
    orders
GROUP BY category;

/*38- write a query print top 5 cities in west region by average no of days between order date and ship date.*/

SELECT 
    city, region, avg(DATEDIFF(ship_date, order_date)) as avg_days
FROM
    orders
WHERE
    region = 'West'
GROUP BY city
LIMIT 5; 

/*39- write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)*/

SELECT 
    *
FROM
    employee;

SELECT 
    e1.emp_name,
    e2.emp_name AS manager_name,
    e3.emp_name AS senior_manager
FROM
    employee as e1
        INNER JOIN
    employee AS e2 ON e1.manager_id = e2.emp_id
        INNER JOIN
    employee AS e3 ON e2.manager_id = e3.emp_id

/*41. Create this table and Execute the Question*/

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

/*write a query to produce team_name, no_of_matches_played , no_of_wins , no_of_losses this output from icc_world_cup table. */

select * from icc_world_cup;

WITH all_teams AS (
  SELECT 
    Team_1 AS team, 
    CASE WHEN Team_1 = winner THEN 1 ELSE 0 END AS win_flag 
  FROM icc_world_cup
  UNION ALL 
  SELECT 
    Team_2 AS team, 
    CASE WHEN Team_2 = winner THEN 1 ELSE 0 END AS win_flag 
  FROM icc_world_cup
)
SELECT 
  team, 
  COUNT(*) AS matches_played, 
  SUM(win_flag) AS matches_won, 
  COUNT(*) - SUM(win_flag) AS matches_lost
FROM all_teams
GROUP BY team;

/*42- write a query to print first name and last name of a customer using orders table(everything after first space can be considered 
as last name) customer_name, first_name,last_name*/

select * from orders;

SELECT 
	customer_name,
    SUBSTRING(customer_name,
        1,
        LOCATE(' ', customer_name) - 1) AS first_name,
    SUBSTRING(customer_name,
        LOCATE(' ', customer_name) + 1) AS last_name
FROM
    orders;