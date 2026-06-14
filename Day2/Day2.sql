-- All the examples of SELECT query, using different scenarios:

USE sakila;
SELECT * FROM actor;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM film;
SELECT * FROM payment;
SELECT * FROM language;

-- to check unique entries, we use distinct keyword:
SELECT DISTINCT name FROM category; 
-- -----------------------------------------------------------------------------------------------------

-- using count we are checking the total number of entries in language table:
SELECT COUNT(*) FROM language;
-- -----------------------------------------------------------------------------------------------------------

-- distinct and count: combine will give us information on duplicates:
SELECT COUNT(DISTINCT country) FROM country;
-- ----------------------------------------------------------------------------------------------------------------

-- it'll only give the output with only the columns selected and using with LIMIT it'll give us only the number of enteries we entered:
SELECT name from category
LIMIT 15;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- We are doing filtering here using DISTINCT and WHERE condition:
SELECT DISTINCT(customer_id) FROM payment
WHERE amount = 5.99; 
-- ------------------------------------------------------------------------------------------------------------------------------

-- We are displaying the actor names in descending order, by default the ORDER BY will always order it in ascending order
--  Sorting of the data, we can also use Order by and then we can add ascending and descening:
SELECT * FROM actor
ORDER BY first_name DESC; 
-- ---------------------------------------------------------------------------------------------------------------------

-- -- Below is the representation of all the AND, OR and NOT operators: ------------------------------------------------
SELECT * FROM film
WHERE length >= 95 AND rating = 'PG';
-- LIMIT 10; -- This is optional however the data was too much, so added the limit.
-- --------------------------------------------------------------------------------------------------------------------------
--  Like using Where clause:
--  	- It can be done using Wildcards using percent % and underscore_ sign
-- 		- Each _ will represent a single character

SELECT * FROM film
WHERE title LIKE '_CA%' OR rental_duration >= 4; -- use of wildcard _, % and LIKE keyword
-- ----------------------------------------------------------------------------------------------------------------
SELECT * FROM language
WHERE name != 'English';
-- ----------------------------------------------------------------------------------------------------------------

-- use of BETWEEN Keyword:
SELECT * FROM film
WHERE rental_duration BETWEEN 5 AND 8; 
-- ----------------------------------------------------------------------------------------------------------------

-- -- below is the use of all the keywords like group by, order by, limit, having, where:

SELECT film_id, title, COUNT(*) AS total_film
FROM film
WHERE rental_rate > 3.00
GROUP BY film_id, title
HAVING COUNT(*) >= 1
ORDER BY total_film DESC
LIMIT 10;
-- ----------------------------------------------------------------------------------------------------------------