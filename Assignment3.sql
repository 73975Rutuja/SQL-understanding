/* Assignment 3: SQL Practice questions.
Submitted by: Rutuja Bhairawakar 

All the below questions are solved with corelated or SQL Sub queries concept*/

USE sakila;
SHOW TABLES;

-- 1. display all customer details who have made more than 5 payments.

-- SELECT * FROM payment;  -- (it has payment_id and customer_id)

SELECT * FROM customer     -- (it has customer_id)
WHERE customer_id IN (
    SELECT customer_id FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) > 5
);
-- ----------------------------------------------------------------------------------------------------------------
-- 2. Find the names of actors who have acted in more than 10 films.

-- SELECT * FROM actor;  -- (it has actor_id)
-- SELECT * FROM film_actor;  -- (it has film_id and actor_id)

SELECT * FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(*) > 10
);

-- ----------------------------------------------------------------------------------------------------------------
-- 3. Find the names of customers who never made a payment.

SELECT * FROM customer
WHERE customer_id NOT IN(
	SELECT customer_id FROM payment
);										-- ideal answer for this should be NULL and we got the output as NULL too.

-- ----------------------------------------------------------------------------------------------------------------
-- 4. List all films whose rental rate is higher than the average rental rate of all films.

-- SELECT AVG(rental_rate) FROM film;    -- it is '2.980000', so we need to see the entries, which is greater than this value as output

SELECT film_id, rental_rate
FROM film
WHERE rental_rate > 
	(SELECT AVG(rental_rate)
    FROM film
);
-- ----------------------------------------------------------------------------------------------------------------
-- 5. List the titles of films that were never rented.

-- SELECT * FROM film;   -- it gives us film_id
-- SELECT * FROM inventory; -- it gives info on inventory_id, film_id
-- SELECT * FROM rental;   -- it gives info on rental_id, inventory_id
-- thus we need to check the film_id not present in the rest of the 2 tables, to get the output for the question

SELECT title FROM film  -- since the question asks for only title, so selecting only title from film
WHERE film_id NOT IN (
    SELECT film_id FROM inventory
    WHERE inventory_id IN (
        SELECT inventory_id FROM rental)
);
-- ----------------------------------------------------------------------------------------------------------------

-- 6. Display the customers who rented films in the same month as customer with ID 5.

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT DISTINCT customer_id FROM rental
    WHERE MONTH(rental_date) IN (
        SELECT MONTH(rental_date) FROM rental
        WHERE customer_id = 5
    )
    AND customer_id != 5
);

-- ----------------------------------------------------------------------------------------------------------------
-- 7. Find all staff members who handled a payment greater than the average payment amount.

-- SELECT * FROM payment;     -- it has customer_id, payment_id, staff_id and rental_id, amount
-- SELECT * FROM staff;	   -- staff_id
-- SELECT * FROM rental;	   -- staff_id, etc
-- As there are only 2 staffs, so there are pretty high chances that both will be displayed.

SELECT * FROM staff
WHERE staff_id IN (
    SELECT staff_id FROM payment     -- Checking from the payment table
    WHERE amount > (SELECT AVG(amount) AS average FROM payment)
);
-- ----------------------------------------------------------------------------------------------------------------
-- 8. Show the title and rental duration of films whose rental duration is greater than the average.

SELECT title, rental_duration FROM film
WHERE rental_duration > (
    SELECT AVG(rental_duration) FROM film
);
-- ----------------------------------------------------------------------------------------------------------------
-- 9. Find all customers who have the same address as customer with ID 1.

SELECT * FROM customer
WHERE address_id = (
    SELECT address_id FROM customer
    WHERE customer_id = 1
)
AND customer_id != 1;
-- ----------------------------------------------------------------------------------------------------------------
-- 10. List all payments that are greater than the average of all payments.

SELECT * FROM payment
WHERE amount > (
    SELECT AVG(amount) FROM payment
);
-- ----------------------------------------------------------------------------------------------------------------
