/*SECOND TOPIC: STRINGS- Built in functions under Strings
11. Regular expression (explained using example as don't have vowels and all) and NOT REGEXP
	- ^ will represent that it has or it contains and if there is no ^ then it means, it does not contain
12. COUNT */

USE sakila;

SELECT * FROM actor;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM address;
SELECT * FROM country;
SELECT * FROM film;
SELECT * FROM payment;
SELECT * FROM film_actor;
SELECT * FROM rental;
SELECT * FROM customer;
SELECT * FROM language;

-- 1.  The below query will return the ASCII code of the first character in the last name:
SELECT actor_id, ASCII(last_name) AS Asciicodelast
FROM actor
ORDER BY actor_id;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 2. CHAR_LENGTH will return the length of characters. Here we are applying it on first_name. It is similar to CHARACTER_LENGTH:
SELECT actor_id, CHAR_LENGTH(first_name) AS character_len
FROM actor;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Concatination:
-- Here are concatinating 2 columns as address, with comma and space with district column of address table

SELECT address_id, CONCAT(address, ", " ,district) AS New_add
FROM address;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 4. CONCAT_WS:
-- with the above function, we can specify the type of separater we want between address (here)

SELECT address_id, CONCAT_WS(" ", address, district) AS Updated_add
FROM address;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 5. INSTR:
-- This function returns the position of the character, if present in the first_name (for our example)
SELECT INSTR(first_name, "r")
FROM actor;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 6. LCASE: It'll convert the string to lowercase:
-- It is similar to LOWER()

SELECT city_id, LCASE(city) AS lowercase_cityname
FROM city;
-- or
SELECT city_id, LOWER(city) AS lowercase_cityname
FROM city;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 7. LEFT: It take string and a number as parameter. Later extracts that number character from left side of the given string

SELECT actor_id, LEFT(first_name, 5) AS Short_firstname
FROM actor;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 8. LENGTH will return the length of string in bytes:

SELECT title, LENGTH(description) AS Len_inbytes
FROM film;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 9. LOCATE will take 2 parameters, string and subsctring (it can be special characters too) and returns position of it:
-- It is similar to POSITION()

SELECT customer_id, LOCATE("@", email) AS Domain
FROM customer;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 10. LPAD: It is used to add padding on the left side. We need to give string, length of string we want after padding, string to left-pad the string:

SELECT actor_id, LPAD(first_name, 10, "New ") AS first_name1
FROM actor;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 11. The LTRIM(): It is used to remove the spaces from the start of the string
-- 12. UPPER(): It'll convert the complete string to uppercase

SELECT UPPER ("     Hi! There are no spaces now ") AS Originalstring;	-- Just to display the original content and show it in uppercase
SELECT LTRIM("     Hi! There are no left spaces now ") AS Removedspaces;

-- 13. RTRIM(): It'll remove the spaces from the right side
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- 14. COUNT(): It returns the number of records returned by a select query. NULL values won't be count here.

SELECT COUNT(city_id) AS count_of_city
FROM city;