-- Joins (part1): Let's explore some of the joins types

-- 1. Inner join(): Returns only rows that have matching values in both tables

/* Let's understand with the below example, suppose we wanted to know the customer name along with their payment amounts, however customer name 
and payment amount is available into different table, so we'll just join those table.
We can see here, we are joining customer table to retrieve the name of the customer along with payment for the amount value.*/

USE sakila;

SELECT c.first_name,
       c.last_name,
       p.amount
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id;
-- ----------------------------------------------------------------------------------------------------------------

-- 2. LEFT JOIN(): Returns all rows from the left table, and only the matched rows from the right table
/* To explain LEFT and RIGHT JOIN, we'll try to use same two table, however how the all data is displayed when from one table (left or right side)
even if the other is missing some data.
In the below example we are trying to display all the payments and corresponding customers name. We can see even if there are customers with
no payment*/

SELECT c.first_name,
       c.last_name,
       p.amount
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id;

-- ----------------------------------------------------------------------------------------------------------------
-- 3. RIGHT JOIN(): Returns all rows from the right table, and only the matched rows from the left table
/* In the below example we are trying to display all the payments and corresponding customers name. We can see All the payment entries
will appear even if some of the customer data is missing in them.*/

SELECT c.first_name,
       c.last_name,
       p.amount
FROM customer c
RIGHT JOIN payment p
ON c.customer_id = p.customer_id;

-- ----------------------------------------------------------------------------------------------------------------
-- 4. CROSS JOIN(): all the elements of the table 1 should match with the table 2
/* In the below example we are trying to work on store and customer tables. The goal here is to match each customer with each store*/

SELECT c.first_name,
       s.store_id
FROM customer c
CROSS JOIN store s;
-- ----------------------------------------------------------------------------------------------------------------
-- 5. SELF JOIN(): It'll a join operation used to join a table with itself. 
/* sakila database for the self join. So we are trying to find the customer who stays in the same addresses.
So the only table we'll work on is customers, however we are considering different columns of it and trying to combine them to get the 
information we want*/

SELECT c1.first_name AS customer1,
       c2.first_name AS customer2,
       c1.address_id
FROM customer c1
JOIN customer c2
ON c1.address_id = c2.address_id
AND c1.customer_id != c2.customer_id;

-- 6. UNION or FULL OUTER JOIN(): 
/*One important thing to know is that MySQL (including the Sakila database) does not support FULL OUTER JOIN directly.
To achieve a full outer join in MySQL, you combine a LEFT JOIN and a RIGHT JOIN using UNION.
For example, to display all customers and all payments (including customers with no payments and any payments without a matching customer):*/

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id

UNION

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount
FROM customer c
RIGHT JOIN payment p
ON c.customer_id = p.customer_id;