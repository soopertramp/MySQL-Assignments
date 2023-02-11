# MySQL-Assignments
MySQL exercises on the famous superstore dataset

## :cherry_blossom: Superstore Dataset

### Find it [here](https://github.com/soopertramp/MySQL-Assignments/tree/main/Dataset)

### If you need queries in MySQL style you can find it [here](https://github.com/soopertramp/MySQL-Assignments/blob/main/Queries.sql)

<br>
<br>
<br>

<p align="left">
  <img src="https://github.com/soopertramp/MySQL-Assignments/blob/main/dataset-cover.jpg">
  
<br>
  <br>
  <br>

### 1. Write an sql query to get all the orders where customers name has "a" as second character and "d" as fourth character :question:
<details><summary>
:arrow_forward: View Answer
</summary>
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

</details>
<br>  
  
### 2. write a sql to get all the orders placed in the month of dec 2020:question:
  
<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-12-2020' AND '31-12-2020';
  
</details>
<br>
  
### 3. write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020:question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    ship_mode NOT IN ('Standard Class' , 'First Class')
        AND ship_date > '30-11-2020';  
 
</details>
<br>
  
### 4. write a query to get all the orders where customer name neither start with "A" and nor ends with "n":question: 

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name NOT LIKE 'A%n'

  </details>
<br>
  
### 5. write a query to get all the orders where profit is negative:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

SELECT 
    *
FROM
    orders
WHERE
    profit < 0;

</details>
<br>
  
### 6. write a query to get all the orders where either quantity is less than 3 or profit is 0:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

SELECT 
    *
FROM
    orders
WHERE
    quantity < 3 OR profit = 0;
                
</details>
<br>
  
### 7. your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers:question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    region = 'South' AND discount > 0; 
  
</details>
<br>
  
### 8. write a query to find top 5 orders with highest sales in furniture category:question:

<details><summary>
:arrow_forward: View Answer
</summary>  
 
SELECT 
    *
FROM
    orders
WHERE
    category = 'Furniture'
order by sales desc
LIMIT 5;
 
</details>
<br>
  
### 9. write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

SELECT 
    *
FROM
    orders
WHERE
    category IN ('Technology' , 'Furniture')
        AND order_date BETWEEN '01-01-2020' AND '31-12-2020';

</details>
<br>
  
### 10. write a query to find all the orders where order date is in year 2020 but ship date is in 2021:question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2020'
        AND ship_date > '01-01-2021';
  

</details>
<br>
  
### 11. write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909 :question:

<details><summary>
:arrow_forward: View Answer
</summary>

SELECT 
    *
FROM
    orders;
    
UPDATE orders 
SET 
    city = NULL
WHERE
    order_id IN ('CA-2020-161389' , 'US-2021-156909');
    
</details>
<br>

### 12. write a query to find orders where city is null (2 rows) :question:

<details><summary>
:arrow_forward: View Answer
</summary>  
  
SELECT 
    *
FROM
    orders
WHERE
    city IS NULL; 

</details>
<br>

### 13. write a query to get total profit, first order date and latest order date for each category :question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    category,
    SUM(profit) AS profit,
    MIN(order_date) AS first_order,
    MAX(order_date) AS latest_order
FROM
    orders
GROUP BY category;
</details>
<br>

### 14. write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category :question:

<details><summary>
:arrow_forward: View Answer
</summary>  
  
SELECT 
    sub_category
FROM
    orders
GROUP BY sub_category
HAVING AVG(profit) > MAX(profit) / 2;
  
</details>
<br>

### 15. create the exams table with below script; and write a query to find students who have got same marks in Physics and Chemistry. :question:

<details><summary>
:arrow_forward: View Answer
</summary> 
  
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

</details>
<br>

### 16. Write a query to findout the all the students marks in chemistry subject? :question:
<details><summary>
:arrow_forward: View Answer
</summary> 
SELECT 
    student_id, subject, marks
FROM
    exams
WHERE
    subject = 'Chemistry'
GROUP BY student_id, marks;
  
</details>
<br>

### 17. write a query to find total number of products in each category. :question:
<details><summary>
:arrow_forward: View Answer
</summary>
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
 </details>
<br>

### 18. write a query to find top 5 sub categories in west region by total quantity sold. :question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
SELECT 
    sub_category, SUM(quantity) AS total_quantity
FROM
    orders
WHERE
    region = 'West'
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;
  
</details>
<br>

### 19. Write a query to find total sales for each region and ship mode combination for orders in year 2020 :question:
<details><summary>
:arrow_forward: View Answer
</summary>
SELECT 
    region, ship_mode, SUM(sales) AS total_sales
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2021'
GROUP BY region , ship_mode
ORDER BY region , ship_mode;
  </details>
<br>

### 20. Write a query to find total sales for each region :question:
<details><summary>
:arrow_forward: View Answer
</summary>
SELECT 
    region, SUM(sales) AS total_sales
FROM
    orders
GROUP BY region; 
    </details>
<br>

### 21. write a query to get region wise count of return orders

<details><summary>
:arrow_forward: View Answer
</summary>

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
</details>
<br>

### 22- write a query to get category wise sales of orders that were not returned

<details><summary>
:arrow_forward: View Answer
</summary>

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

</details>
<br>

### 23- write a query to print dep name and average salary of employees in that dep .

<details><summary>
:arrow_forward: View Answer
</summary>

select * from employee;
select * from dept;

SELECT 
    d.dep_name, AVG(salary) AS salary
FROM
    dept AS d
        INNER JOIN
    employee AS e ON d.dep_id = e.dept_id
GROUP BY d.dep_name;

</details>
<br>

### 24- write a query to print dep names where none of the employees have same salary.*/

<details><summary>
:arrow_forward: View Answer
</summary>

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

</details>
<br>