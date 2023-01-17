# MySQL-Assignments
MySQL exercises on the famous superstore dataset

## :bank: Superstore Dataset

### Find it [here](https://github.com/soopertramp/MySQL-Assignments/tree/main/Dataset)

<p align="left">
  <img src="https://github.com/soopertramp/MySQL-Assignments/blob/main/dataset-cover.jpg">

### 1. Write an sql query to get all the orders where customers name has "a" as second character and "d" as fourth character.
<details><summary>
View Answer
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

### 2. write a sql to get all the orders placed in the month of dec 2020
  
<details><summary>
View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    order_Date BETWEEN '01-12-2020' AND '31-12-2020';
  
</details>

### 3. write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)

<details><summary>
View Answer
</summary>
  
SELECT 
    *
FROM
    orders
WHERE
    ship_mode NOT IN ('Standard Class' , 'First Class')
        AND ship_date > '30-11-2020';  
 
</details>

  
### 4. write a query to get all the orders where customer name neither start with "A" and nor ends with "n" 

<details><summary>
View Answer
</summary>
  
SELECT 
    customer_name
FROM
    orders
WHERE
    customer_name NOT LIKE 'A%n'

  </details>
