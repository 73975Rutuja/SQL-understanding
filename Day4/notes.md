### JOINS:

- JOIN() is use to combine rows from two or multiple tables, based on the related columns between them. For example, we are using sakila  database so in that we have multiple tables and using different joins type we can try to combine these tables to retrieve it's information. 
- That is one of the use cases of join, basically if we have multiple tables and wanted to retrieve information from them, we need to use joins.
- The types of joins are:
    1. Inner Join
    2. Left Join
    3. Right Join
    4. Full Outer Join
    5. Cross Join
    6. Self Join
    
- Class notes:

* Cardinality:
- In database management, cardinality represents the number of times an entity of an entity set participates in a relationship set.
There can be different types of cardinality between the tables:

1. One-to-many
2. Many-to-one
3. Many-to-many
4. One-to-one

- As we are working on the sakila database, let's try to understand this relationship using the tables in them.
- We have customer, payment, film, film_actor, inventory, rental as the tables.
- If we explore or check the columns in them, we can understand the relationship here.
1. One-to-many:
    - We have customer and payment tables, so it is one of the example of that relationship as each customers(customer_id) can have records many payments (payment_ids).
    - The other table can be considered here is actor and film_actor. One actor (actor_id) can appear in many films (film_id)
    - The film and film_actor is another example, as one film (film_id) can have many actors (actor_id) in them.

2. Many-to-one:
    - The same customer and payment relationship, if we see from the payment side, then it can be considered as many-to-one, as many payment (payment_id) belongs to each customers (customer_id)

3. Many-to-many:
    - Here we can consider the example of actor and film table, because one actor (actor_id) can act in many films (film_id) and many actors (actor_id) can act in one film (film_id)

4. One-to-one:
    - Consider the below friends table (friends_table.png) which has friend_id as one of it's column and the other column is about the ids with which one person can be friends. 
    - One person can has many friends. It is like a self join because it is joined with the self table using a bridge table called as friendship.


### CTE (Common Table Expressions):

- Q. What is a CTE?
A Common Table Expression (CTE) is a temporary named result set that exists only for the duration of a single SQL query. It helps make complex queries easier to read, write, and maintain.

- A CTE is defined using the WITH keyword and can be referenced just like a table in the main query.

- Syntax:
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;  

* Advantages of CTE:

1. Improves query readability.
2. Breaks complex queries into smaller logical parts.
3. Avoids writing the same subquery multiple times.
4. Makes debugging easier.
5. Can be used with SELECT, INSERT, UPDATE, and DELETE.
6. Supports recursion through Recursive CTEs.

### Recursive CTE

- Q. What is a Recursive CTE?
A Recursive Common Table Expression is a CTE that references itself. It is used to solve problems involving hierarchical or sequential data, such as:
- Employee-manager hierarchies
- Folder structures
- Organizational charts
- Parent-child relationships
- Generating sequences of numbers

A recursive CTE has two parts:
1. Anchor Query – Produces the initial result.
2. Recursive Query – References the CTE itself and continues generating rows until no more rows are returned.

- Syntax:
WITH RECURSIVE cte_name AS
(
    -- Anchor Query

    UNION ALL

    -- Recursive Query
)
SELECT *
FROM cte_name;
