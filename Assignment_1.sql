/* Assignment 1: SQL Practice Questions
Submitted by: Rutuja Bhairawakar */
-- ---------------------------------------------------------------------------------------------------------

USE sakila;
SHOW TABLES;

-- 1. Get all customers whose first name starts with 'J' and who are active.

SELECT * FROM customer
WHERE first_name LIKE "J%" AND active = 1;
-- --------------------------------------------------------------------------------------------------------------------------

-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.

SELECT * FROM film
WHERE title LIKE "%ACTION%" OR description LIKE "%WAR%";
-- --------------------------------------------------------------------------------------------------------------------------

-- 3. List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.

SELECT * FROM customer
WHERE RIGHT(first_name, 1) = "a" AND last_name != "SMITH";
-- --------------------------------------------------------------------------------------------------------------------------

-- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.

SELECT * FROM film
WHERE rental_rate > 3.00 AND replacement_cost IS NOT NULL;
-- --------------------------------------------------------------------------------------------------------------------------

-- 5. Count how many customers exist in each store who have active status = 1.

SELECT store_id, COUNT(*) AS active_cust
FROM customer
WHERE active = 1
GROUP BY store_id;
-- --------------------------------------------------------------------------------------------------------------------------

-- 6. Show distinct film ratings available in the film table.

SELECT DISTINCT rating FROM film;
-- --------------------------------------------------------------------------------------------------------------------------

-- 7. Find the number of films for each rental duration where the average length is more than 100 minutes.

SELECT rental_duration, COUNT(*) AS total_num
FROM film
WHERE length > 100
GROUP BY rental_duration;
-- --------------------------------------------------------------------------------------------------------------------------

-- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.

-- SELECT * from payment;

SELECT payment_date, 
	SUM(amount) AS total_amt, 
	EXTRACT(DAY FROM payment_date) AS only_date,
    COUNT(*) AS count_of_payments
FROM payment
GROUP BY DATE(payment_date)
HAVING COUNT(*) > 100
ORDER BY only_date;
-- --------------------------------------------------------------------------------------------------------------------------

-- 9. Find customers whose email address is null or ends with '.org'.

SELECT * FROM customer
WHERE email IS NULL OR RIGHT(email, 4) = ".org";
-- --------------------------------------------------------------------------------------------------------------------------

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.

SELECT * FROM film
WHERE rating = "PG" OR rating = "G"
ORDER BY rental_rate DESC;
-- --------------------------------------------------------------------------------------------------------------------------

-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.

SELECT length, COUNT(*) AS film_count
FROM film
WHERE LEFT(title,1) = "T"
GROUP BY length
HAVING COUNT(*) > 5
ORDER BY length;
-- --------------------------------------------------------------------------------------------------------------------------

-- 12. List all actors who have appeared in more than 10 films.(not done)

-- SELECT * FROM film_actor; -- ( IT has actor_id, film_id)
-- SELECT * FROM film;  -- ( IT has film_id)
-- SELECT * FROM actor;  -- (It has actor_id)

SELECT actor_id,
       first_name,
       last_name
FROM actor
WHERE actor_id IN (SELECT actor_id FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(*) > 10
);

-- Further to check how many films they did, I would like to add some improvement

SELECT actor_id, first_name, last_name,
( SELECT COUNT(*) FROM film_actor WHERE film_actor.actor_id = actor.actor_id) AS total_filmCount
FROM actor
WHERE actor_id IN (SELECT actor_id FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(*) > 10
);
-- --------------------------------------------------------------------------------------------------------------------------

-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.

SELECT title, MAX(rental_rate) AS highest_rrate, MAX(length) AS longest_len
FROM film
ORDER BY rental_rate, length DESC
LIMIT 5;
-- --------------------------------------------------------------------------------------------------------------------------

-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.

-- SELECT * FROM customer;   -- (It has customer_id, store_id) 
-- SELECT * FROM rental;     -- (It has customer_id, rental_id)
-- SELECT * FROM payment;    -- (It has customer_id, rental_id, payment_id)

SELECT customer_id, first_name, last_name,
(SELECT COUNT(*) FROM rental WHERE rental.customer_id = customer.customer_id) AS rental_count
FROM customer
ORDER BY rental_count DESC;
-- --------------------------------------------------------------------------------------------------------------------------

-- 15. List the film titles that have never been rented.

SELECT title FROM film
WHERE rental_rate IS NULL;
-- --------------------------------------------------------------------------------------------------------------------------
