-- Examples:
-- 1. CTE (Common Table Expressions):

/* 1. Find customers from a specific city. The CTE stores all active customers. The main query simply retrieves the results from the CTE. */

USE sakila;

WITH customer_details AS (
    SELECT customer_id, first_name, last_name
    FROM customer
    WHERE active = 1
)
SELECT *
FROM customer_details;

/* 2. Customers who paid more than the average payment. The CTE calculates the average payment. 
The main query returns all payments greater than the average. */

WITH avg_payment AS (
    SELECT AVG(amount) AS average_amount
    FROM payment
)
SELECT payment_id, customer_id, amount
FROM payment
WHERE amount >
(
    SELECT average_amount
    FROM avg_payment
);

/* 3. Count rentals for each customer. The CTE calculates the total rentals for each customer. 
The main query displays the results in descending order.*/

WITH rental_count AS (
    SELECT customer_id,
           COUNT(*) AS total_rentals
    FROM rental
    GROUP BY customer_id
)
SELECT *
FROM rental_count
ORDER BY total_rentals DESC;

-- 2. Recursive CTEs:

/* 1. Generate numbers from 1 to 10. */

WITH RECURSIVE numbers AS
(
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT *
FROM numbers;

/* 2. Generate multiplication table of 5 */

WITH RECURSIVE multiplication AS
(
    SELECT
        1 AS n,
        5 AS number

    UNION ALL

    SELECT
        n + 1,
        number
    FROM multiplication
    WHERE n < 10
)
SELECT
    n,
    number,
    n * number AS result
FROM multiplication;