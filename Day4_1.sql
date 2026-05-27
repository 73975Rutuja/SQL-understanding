-- ALL about Joins (part1):

/* JOIN() is use to combine rows from two or multiple tables, based on the related columns between them. For example, we are using sakil database
so in that we have multiple tables and using different joins type we can try to combine these tables to retrieve it's information. 
That is one of the use cases of join, basically if we have multiple tables and wanted to retrieve information from them, we need to use joins.

Class notes:
Cardinality:
In database management, cardinality represents the number of times an entity of an entity set participates in a relationship set.
There can be different types of cardinality between the tables:
1. One-to-one
2. One-to-many
3. Many-to-one
4. Many-to-many

Since, we are working on the sakila database, let's try to understand this relationship using the tables in them.
We have customer, payment, film, film_actor, inventory, rental as the tables.
If we explore or check the columns in them, we can understand the relationship here.
- One-to-many:
We have customer and payment tables, so it is one of the example of that relationship as each customers(customer_id) can have records many 
payments (payment_ids).
The other table can be considered here is actor and film_actor. One actor (actor_id) can appear in many films (film_id)
The film and film_actor is another example, as one film (film_id) can have many actors (actor_id) in them.

- Many-to-one:
The same customer and payment relationship, if we see from the payment side, then it can be considered as many-to-one, as many payment (payment_id)
belongs to each customers (customer_id)

-- Many-to-many:
Here we can consider the example of actor and film table, because one actor (actor_id) can act in many films (film_id) and many actors (actor_id)
can act in one film (film_id)

Let's explore some of the joins types*/


-- 1. Inner join(): Returns only rows that have matching values in both tables

/* Let's understand with the below example, suppose we wanted to know the customer name along with their payment amounts, however customer name 
and payment amount is available into different table, so we'll just join those table.
We can see here, we are joining customer table to retrieve the name of the customer along with payment for the amount value.
*/

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
no payment
*/
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
/* Consider we have a friends table which has friend_id as one of it's column and the other column is about the ids with which one person can be
friends. one person can has many friends. It is like a self join because it is joined with the self table using a 
bridge table called as friendship .

Let's under it related to the sakila database with below example. So we are trying to find the customer who stays in the same addresses.
So the only table we'll work on is customers, however we are considering different columns of it and trying to combine them to get the 
information we want*/

SELECT c1.first_name AS customer1,
       c2.first_name AS customer2,
       c1.address_id
FROM customer c1
JOIN customer c2
ON c1.address_id = c2.address_id
AND c1.customer_id != c2.customer_id;