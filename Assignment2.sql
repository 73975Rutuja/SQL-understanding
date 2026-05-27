/* Assignment 2: SQL practice questions.
Submitted by: Rutuja Bhairawakar */
-- ---------------------------------------------------------------------------------------------------------
USE sakila;

-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates

SELECT * FROM customer;
SELECT DISTINCT store_id, first_name, last_name, email, address_id, active, create_date, last_update
FROM customer;

-- OR (I just added the below query, in case if we want each column to check the distinct entries and keep a count of it)

SELECT COUNT(DISTINCT store_id), 
COUNT(DISTINCT first_name), 
COUNT(DISTINCT last_name), COUNT(DISTINCT email), 
COUNT(DISTINCT address_id), COUNT(DISTINCT active), 
COUNT(DISTINCT create_date), COUNT(DISTINCT last_update)
FROM customer;

-- ----------------------------------------------------------------------------------------------------------------
-- 2. Number of times letter 'a' is repeated in film descriptions:

-- (just to avoid confusion, converting the complete description to lower cas)

-- SELECT * FROM film;

SELECT SUM(
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', ''))
) AS total_a_count
FROM film;
-- ----------------------------------------------------------------------------------------------------------------
-- 3. Number of times each vowel is repeated in film descriptions:
-- (we'll use the same logic used for the question 2, just we need to add it more 4 times, for e, i, o and u

SELECT film_id,
	LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description),'a','')) AS a_count,
	LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description),'e','')) AS e_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description),'i','')) AS i_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description),'o','')) AS o_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description),'u','')) AS u_count
FROM film;
-- ----------------------------------------------------------------------------------------------------------------
-- 4. Display the payments made by each customer (not done)
--      1. Month wise
--      2. Year wise
-- 		3. Week wise

-- SELECT * FROM payment;

SELECT customer_id, SUM(amount), 
	MONTH(payment_date) AS month,        -- 1. Month wise
	YEAR(payment_date) AS year,          -- 2. Year wise
    WEEK(payment_date) AS no_of_week     -- 3. Week wise
FROM payment
GROUP BY customer_id, MONTH(payment_date), YEAR(payment_date), WEEK(payment_date);

-- some modification: with the below query are trying to display the amount in weekday wise
-- Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.

SELECT customer_id, SUM(amount),
	WEEKDAY(payment_date) AS weekday_no
FROM payment
GROUP BY customer_id, WEEKDAY(payment_date);
-- ----------------------------------------------------------------------------------------------------------------
-- 5. Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select 
-- query with hardcoded date

-- a. Hardcoded date example:

SELECT YEAR("2008-03-17"), 
CASE
	WHEN (YEAR("2008-03-17") % 4 = 0 AND YEAR("2008-03-17") % 100 != 0) OR (YEAR("2008-03-17") % 400 = 0) THEN "Leap year"
    ELSE "Not a LEAP year"
END AS leap_year_check;
-- ----------------------------------------------------------------------------------------------------------------

-- b. Checking for the current date:
SELECT YEAR(CURDATE()),  
CASE
	WHEN (YEAR(CURDATE()) % 4 = 0 AND YEAR(CURDATE()) % 100 != 0) OR (YEAR(CURDATE()) % 400 = 0) THEN "Leap year"
    ELSE "Not a LEAP year"
END AS leap_year_check;

-- ----------------------------------------------------------------------------------------------------------------

-- c. Taking a table from sakila database and checking:
-- Here the database has year only 2006, so we'll only get the output as Not a Leap year.

SELECT payment_date,
CASE
	WHEN (YEAR(payment_date) % 4 = 0 AND YEAR(payment_date) % 100 != 0) OR (YEAR(payment_date)% 400 = 0) THEN "Leap year"
    ELSE "Not a LEAP year"
END AS leap_year_check
FROM payment
GROUP BY payment_date, YEAR(payment_date);
-- ----------------------------------------------------------------------------------------------------------------

-- 6. Display number of days remaining in the current year from today.

SELECT DATEDIFF("2026-12-31", "2026-05-26") AS days_remaining;

-- For the same question if we wanted to calculate the months remaining, we can use the function as period_diff()
-- SELECT PERIOD_DIFF(202612, 202605) AS months_remaining;
-- ----------------------------------------------------------------------------------------------------------------
-- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table. 

-- The QUARTER() function returns the quarter of the year for a given date value (a number from 1 to 4).
-- January-March returns 1
-- April-June returns 2
-- July-Sep returns 3
-- Oct-Dec returns 4

-- SELECT * FROM payment;

SELECT payment_date, MONTH(payment_date) AS only_month,
	QUARTER(payment_date) AS quarter_no
FROM payment;      

-- ----------------------------------------------------------------------------------------------------------------
-- 8. Display the age in year, months, days based on your date of birth. 
--    For example: 21 years, 4 months, 12 days

SELECT CONCAT(
    TIMESTAMPDIFF(YEAR, '2000-02-29', CURDATE()),' years, ',
    TIMESTAMPDIFF(MONTH, '2000-02-29', CURDATE()) % 12, ' months, ',
    DATEDIFF(
        CURDATE(),
        DATE_ADD('2000-02-29',INTERVAL TIMESTAMPDIFF(MONTH, '2000-02-29', CURDATE()) MONTH)
    ),' days'
) AS age;
-- ----------------------------------------------------------------------------------------------------------------
