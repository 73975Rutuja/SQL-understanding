-- Examples of CASE Statements:

USE sakila;
SHOW tables;

SELECT * FROM film;

-- 1.
SELECT first_name, last_name,
CASE
WHEN customer_id < 50 THEN "Initial fifty"
WHEN customer_id < 100 THEN "BETWEEN 51 and 100"
ELSE "Above 101"
END AS new_customerid_category
FROM customer;
-- ------------------------------------------------------------------------------------------------------------------------------------------

-- 2.
SELECT film_id, title,
CASE
WHEN rental_rate < 1.00 THEN "Below $ 1"
WHEN rental_rate < 3.00 THEN "Below $ 3"
ELSE "Below $ 5"
END AS rate_words
FROM film;
-- ------------------------------------------------------------------------------------------------------------------------------------------

-- 3. 
-- USE EXAM;
-- SHOW TABLES;
-- SELECT * FROM student;

SELECT sID, sName,
CASE
WHEN sizeHS <= 500 THEN "size below 500 units"
WHEN (sizeHS <= 1000 or sizeHS <= 1500 ) THEN "size between 1000 units and 1500 units"
ELSE "Above 1501 units"
END AS capacity
FROM student;
-- ------------------------------------------------------------------------------------------------------------------------------------------

-- Examples on REGEX (Regular expressions):

-- 1. To check any language name is ending with n:
SELECT name FROM language
WHERE name REGEXP "n$" ;
-- ------------------------------------------------------------------------------------------------------------------------------------------

-- 2. We'll check only the film titles starting with BE..

SELECT title FROM film
WHERE title REGEXP "^BE";
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- 3. To check in customer last_name does not contains 3 consecutive vowels:

SELECT customer_id, last_name
FROM customer
WHERE last_name  not REGEXP '[^aeiouAEIOU]{3}'; 
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- 4. To check in the title column of film, the title ends with vowel:

SELECT lower(title)
FROM film
WHERE title REGEXP '[aeiouAEIOU]$';
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Checking the 2 digits of title from right side ends with E or e:

select title, right(title,2)
FROM film
WHERE title REGEXP '[eE]$'