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

```sql
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
```
</details>
<br>  
  
### 2. write a sql to get all the orders placed in the month of dec 2020:question:
  
<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-12-2020' AND '31-12-2020';
```  
</details>
<br>
	
### 3. write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020:question:

<details><summary>
:arrow_forward: View Answer
</summary>
 
```sql	
SELECT 
    *
FROM
    orders
WHERE
    ship_mode NOT IN ('Standard Class' , 'First Class')
        AND ship_date > '30-11-2020';  
```
	
</details>
<br>
  
### 4. write a query to get all the orders where customer name neither start with "A" and nor ends with "n":question: 

<details><summary>
:arrow_forward: View Answer
</summary>
 
```sql	
SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name NOT LIKE 'A%n'
```
	
</details>
<br>
  
### 5. write a query to get all the orders where profit is negative:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    *
FROM
    orders
WHERE
    profit < 0;
```
	      
</details>
<br>
  
### 6. write a query to get all the orders where either quantity is less than 3 or profit is 0:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    *
FROM
    orders
WHERE
    quantity < 3 OR profit = 0;

```
		
</details>
<br>
  
### 7. your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers:question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders
WHERE
    region = 'South' AND discount > 0; 
```
	
</details>
<br>
  
### 8. write a query to find top 5 orders with highest sales in furniture category:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    *
FROM
    orders
WHERE
    category = 'Furniture'
order by sales desc
LIMIT 5;
``` 
</details>
<br>
  
### 9. write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only:question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    *
FROM
    orders
WHERE
    category IN ('Technology' , 'Furniture')
        AND order_date BETWEEN '01-01-2020' AND '31-12-2020';
```
</details>
<br>
  
### 10. write a query to find all the orders where order date is in year 2020 but ship date is in 2021:question:

<details><summary>
:arrow_forward: View Answer
</summary>
 
```sql	
SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2020'
        AND ship_date > '01-01-2021';
```  

</details>
<br>
  
### 11. write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909 :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
    
UPDATE orders 
SET 
    city = NULL
WHERE
    order_id IN ('CA-2020-161389' , 'US-2021-156909');
```
	
</details>
<br>

### 12. write a query to find orders where city is null (2 rows) :question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    *
FROM
    orders
WHERE
    city IS NULL; 
```
	
</details>
<br>

### 13. write a query to get total profit, first order date and latest order date for each category :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    category,
    SUM(profit) AS profit,
    MIN(order_date) AS first_order,
    MAX(order_date) AS latest_order
FROM
    orders
GROUP BY category;
```	
</details>
<br>

### 14. write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category :question:

<details><summary>
:arrow_forward: View Answer
</summary>  

```sql	
SELECT 
    sub_category
FROM
    orders
GROUP BY sub_category
HAVING AVG(profit) > MAX(profit) / 2;
```
	
</details>
<br>

### 15. create the exams table with below script; and write a query to find students who have got same marks in Physics and Chemistry. :question:

<details><summary>
:arrow_forward: View Answer
</summary> 

```sql	
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
```	

```sql	
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
```	

```sql	
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
```
</details>
<br>

### 16. Write a query to findout the all the students marks in chemistry subject? :question:
<details><summary>
:arrow_forward: View Answer
</summary>

```sql
SELECT 
    student_id, subject, marks
FROM
    exams
WHERE
    subject = 'Chemistry'
GROUP BY student_id, marks;
```  
</details>
<br>

### 17. write a query to find total number of products in each category. :question:
	
<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	

SELECT 
    category, COUNT(DISTINCT prodcut_name) AS no_of_products
FROM
    orders
GROUP BY category;
```	

```sql	
SELECT 
    category, COUNT(DISTINCT product_id) AS no_of_products
FROM
    orders
GROUP BY category;
	
```	
 </details>
<br>

### 18. write a query to find top 5 sub categories in west region by total quantity sold. :question:

<details><summary>
:arrow_forward: View Answer
</summary>
  
```sql	
SELECT 
    sub_category, SUM(quantity) AS total_quantity
FROM
    orders
WHERE
    region = 'West'
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;
```  
</details>
<br>

### 19. Write a query to find total sales for each region and ship mode combination for orders in year 2020 :question:
<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
SELECT 
    region, ship_mode, SUM(sales) AS total_sales
FROM
    orders
WHERE
    order_Date BETWEEN '01-01-2020' AND '31-12-2021'
GROUP BY region , ship_mode
ORDER BY region , ship_mode;	
```	
</details>
<br>

### 20. Write a query to find total sales for each region :question:
<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
SELECT 
    region, SUM(sales) AS total_sales
FROM
    orders
GROUP BY region; 
	
```	
</details>
<br>

### 21. write a query to get region wise count of return orders :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
    
SELECT 
    *
FROM
    returns;
```
```sql	
SELECT 
    o.region, COUNT(DISTINCT o.order_id) AS no_of_items_returned
FROM
    orders AS o
        INNER JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY o.region;
```	
</details>
<br>

### 22. write a query to get category wise sales of orders that were not returned :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql
	
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
```
	
```sql
	
SELECT 
    o.category, SUM(o.sales) AS total_sales
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
WHERE
    o.order_id IS NULL
GROUP BY o.category;
```
	
</details>
<br>

### 23. write a query to print dep name and average salary of employees in that dep :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
select * from employee;
select * from dept;
```	

```sql	
SELECT 
    d.dep_name, AVG(salary) AS salary
FROM
    dept AS d
        INNER JOIN
    employee AS e ON d.dep_id = e.dept_id
GROUP BY d.dep_name;
```
	
</details>
<br>

### 24. write a query to print dep names where none of the employees have same salary :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    employee;
```
	
```sql	
SELECT 
    *
FROM
    dept;
```	

```sql	
SELECT 
    e.dept_id, d.dep_name
FROM
    employee e
        INNER JOIN
    dept d ON e.dept_id = d.dep_id
GROUP BY e.dept_id , d.dep_name
HAVING COUNT(e.emp_id) = COUNT(DISTINCT e.salary)
```
	
</details>
<br>

### 25. write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items) :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
```
	
```sql    
SELECT 
    *
FROM
    returns;
```

```sql	
SELECT 
    o.sub_category, COUNT(DISTINCT r.return_reason) as return_reason
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY o.sub_category
HAVING COUNT(DISTINCT r.return_reason) = 3
ORDER BY o.sub_category;
```
	
</details>
<br>

### 26. write a query to find cities where not even a single order was returned :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
```
	
```sql	
SELECT 
    *
FROM
    returns;
```
	
```sql	
SELECT 
    o.order_id, o.city
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY city
HAVING COUNT(r.order_id) = 0;
```

```sql	
SELECT 
    o.order_id,o.city
FROM
    orders AS o
        LEFT JOIN
    returns AS r ON o.order_id = r.order_id
GROUP BY city
HAVING COUNT(r.return_reason) = 0;
```
	
</details>
<br>

### 27. write a query to find top 3 subcategories by sales of returned orders in east region :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
```
	
```sql	
SELECT 
    *
FROM
    returns;
```
	
```sql	
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
```
	
</details>
<br>

### 28. write a query to print dep name for which there is no employee :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    employee;
```	

```sql
SELECT 
    *
FROM
    dept;
```

```sql
SELECT 
    d.dep_id, d.dep_name
FROM
    dept AS d
        LEFT JOIN
    employee AS e ON d.dep_id = e.dept_id
GROUP BY d.dep_id
HAVING COUNT(e.emp_id) = 0; 
```
	
</details>
<br>

### 29. write a query to print employees name for dep id is not avaiable in dept table :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    employee;
```	
```sql	
SELECT 
    *
FROM
    dept;
```
```sql	
SELECT 
    e.emp_id, e.emp_name
FROM
    employee AS e
        LEFT JOIN
    dept AS d ON e.dept_id = d.dep_id
WHERE
    d.dep_id IS NULL;
```
```sql	
-- SELECT 
--     e.emp_id, e.emp_name
-- FROM
--     employee AS e
--         LEFT JOIN
--     dept AS d ON e.dept_id = d.dep_id
-- GROUP BY e.emp_id
-- HAVING COUNT(d.dep_id) = 0
```
</details>
<br>

### 31. write a query to print emp name , their manager name joining the same table (self join) :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    employee;
```
```sql	
SELECT 
    *
FROM
    dept;
```
```sql	
SELECT 
    e1.emp_name, e2.emp_name AS manager_name
FROM
    employee AS e1
        JOIN
    employee AS e2 ON e1.manager_id = e2.emp_id;
```
	
</details>
<br>

### 32. write a query to find subcategories who never had any return orders in the month of november (irrespective of years) :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
SELECT 
    *
FROM
    orders;
```
```sql	
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
```
	
</details>
<br>

### 33. orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order. write a query to find order ids where there is only 1 product bought by the customer :question:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
SELECT 
    *
FROM
    orders;
```
	
```sql	
SELECT 
    order_id
FROM
    orders
GROUP BY order_id
HAVING COUNT(order_id) = 1;
	
```
	
</details>
<br>

### 34. write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him. :question:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
select * from employee;
select * from dept;
```
```sql	
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
```
	
</details>
<br>

### 35.  write a query to get number of business days between order_date and ship_date (exclude weekends). Assume that all order dateand ship date are on weekdays only :question:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql
SELECT 
    DATEDIFF(ship_date, order_date) - FLOOR(DATEDIFF(ship_date, order_date) / 7) * 2 AS business_days
FROM
    orders;
	
```
	
</details>
<br>

### 36. write a query to print 3 columns : category, total_sales and (total sales of returned orders) :quetsion:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
SELECT 
    *
FROM
    orders;
```
	
```sql
SELECT 
    *
FROM
    returns;
```
	
```sql
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
	
```
	
</details>
<br>

### 37. write a query to print 3 columns category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020) :question:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql	
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
	
```
	
</details>
<br>

### 38. write a query print top 5 cities in west region by average no of days between order date and ship date. :question:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql
SELECT 
    city, region, avg(DATEDIFF(ship_date, order_date)) as avg_days
FROM
    orders
WHERE
    region = 'West'
GROUP BY city
LIMIT 5; 
	
```
</details>
<br>

### 39. write a query to print emp name, manager name and senior manager name (senior manager is manager's manager) :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql	
	
SELECT 
    *
FROM
    employee;
```
	
```sql	
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
```
	
</details>
<br>

### 41. Create this table and Execute the Question 

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql
	
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
INSERT INTO icc_world_cup values('Aus','India','India');</b>

```
	
### write a query to produce team_name, no_of_matches_played , no_of_wins , no_of_losses this output from icc_world_cup table. :question:

```sql
	
select * from icc_world_cup;
```	

```sql	
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
```	

</details>
<br>

### 42. write a query to print first name and last name of a customer using orders table(everything after first space can be considered  as last name) customer_name, first_name,last_name :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql
	
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
```
	
</details>
<br>

### 43. Run below script to create drivers table:

<details><summary>
:arrow_forward: View Answer
</summary>
	
```sql
	
CREATE TABLE drivers (
    id VARCHAR(10),
    start_time TIME,
    end_time TIME,
    start_loc VARCHAR(10),
    end_loc VARCHAR(10)
);

insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h'); </b>
```
	
write a query to print below output using drivers table. Profit rides are the no of rides where end location of a ride is same as start location of immediate next ride for a driver :question: </b>

| id        | total_rides | profit_rides |
------------|-------------|--------------|
| dri_1,          |  5,     |        1 |
| dri_2,       |     2,      |       0 |

```sql
	
SELECT 
    *
FROM
    drivers;
```
	
#### Using Window Function
	
```sql
SELECT id, COUNT(*) AS total_rides, SUM(CASE WHEN end_loc = next_start_location THEN 1 ELSE 0 END) AS profit_rides
FROM (
  SELECT *, LEAD(start_loc, 1) OVER (PARTITION BY id ORDER BY start_time ASC) AS next_start_location
  FROM drivers
) A
GROUP BY id;
```
	
```sql
#### Using Self Join

WITH rides AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY id ORDER BY start_time ASC) AS rn
  FROM drivers
)
SELECT r1.id, COUNT(1) total_rides, COUNT(r2.id) AS profit_rides
FROM rides r1
LEFT JOIN rides r2
ON r1.id = r2.id AND r1.end_loc = r2.start_loc AND r1.rn + 1 = r2.rn
GROUP BY r1.id;
```
	
</details>
<br>

### 44. write a query to print customer name and no of occurence of character 'n' in the customer name.customer_name , count_of_occurence_of_n :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql
	
SELECT 
    customer_name,
    LENGTH(customer_name) - LENGTH(REPLACE(LOWER(customer_name), 'n', '')) AS count_of_occurence_of_n
FROM
    orders;
```
	
</details>
<br>

### 45. write a query to print below output from orders data. 

<b>example output - hierarchy type,hierarchy name ,total_sales_in_west_region, total_sales_in_east_region

|category | Technology|
|category|Furniture|
|category|Office Supplies|
|sub_category|Art|
|sub_category|Furnishings|

--and so on all the category ,subcategory and ship_mode hierarchies :question: </b>

<details><summary>
:arrow_forward: View Answer
</summary>

```sql
	
SELECT 
    'category' AS hierarchy_type,
    category AS hierarchy_name,
    SUM(CASE
        WHEN region = 'West' THEN sales
    END) AS total_sales_in_west_region,
    SUM(CASE
        WHEN region = 'East' THEN sales
    END) AS total_sales_in_east_region
FROM
    orders
GROUP BY category 
UNION ALL SELECT 
    'sub_category' AS hierarchy_type,
    sub_category AS hierarchy_name,
    SUM(CASE
        WHEN region = 'West' THEN sales
    END) AS total_sales_in_west_region,
    SUM(CASE
        WHEN region = 'East' THEN sales
    END) AS total_sales_in_east_region
FROM
    orders
GROUP BY sub_category 
UNION ALL SELECT 
    'ship_mode' AS hierarchy_type,
    ship_mode AS hierarchy_name,
    SUM(CASE
        WHEN region = 'West' THEN sales
    END) AS total_sales_in_west_region,
    SUM(CASE
        WHEN region = 'East' THEN sales
    END) AS total_sales_in_east_region
FROM
    orders
GROUP BY ship_mode;
```
	
</details>
<br>

### 46. the first 2 characters of order_id represents the country of order placed . write a query to print total no of orders placed in each country (an order can have 2 rows in the data when more than 1 item was purchased in the order but it should be considered as 1 order) :question:

<details><summary>
:arrow_forward: View Answer
</summary>

```sql
	
SELECT 
    LEFT(order_id, 2) AS country,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    orders
GROUP BY LEFT(order_id, 2)
```
	
</details>
<br>
