-- DATETIME functions: 
-- Let's explore some examples:

-- 1. datediff() and timediff(): We need to give two parameters here and it'll return the date and time difference between them.

SELECT DATEDIFF("2020-09-11", "2016-05-12");   -- we get the output in days as 1583 days
SELECT TIMEDIFF("24:10:11", "12:10:10");       -- output we get is 12:00:01
-- ----------------------------------------------------------------------------------------------------------------
-- 2. dayofweek( ) will give us the weekday index for a given date between 1 to 7.
-- 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=Friday, 7=Saturday.

SELECT DAYOFWEEK(" 2025-09-18");
SELECT DAYNAME(" 2025-09-18");   -- output is thursday

USE sakila;
SELECT payment_date, DAYNAME(payment_date) AS day_name
FROM payment;

-- 2.1 monthname()  will give us the name of the month

SELECT MONTHNAME(CURDATE());
SELECT MONTHNAME("2023-07-14");

SELECT rental_date, MONTHNAME(rental_date) AS month_name
FROM rental;
-- ----------------------------------------------------------------------------------------------------------------

-- 3. NOW()   -- it is for the current date in YYYY-MM-DD format along with time in HH:MM:SS format

SELECT NOW();
-- ----------------------------------------------------------------------------------------------------------------
-- 4. CURDATE() -- it is for the current date in YYYY-MM-DD format

SELECT CURDATE();
-- ----------------------------------------------------------------------------------------------------------------
-- 5. DATE_ADD() and DATE_SUB(): It'll add or substract the days from the given date. We need to pass an Interval parameter here.

SELECT DATE_ADD("2024-04-08", INTERVAL 12 DAY);
SELECT DATE_SUB("2022-06-17", INTERVAL 22 DAY);

USE EXAM;
-- SELECT * FROM student;

SELECT DoB, DATE_ADD(DoB, INTERVAL 8 DAY) AS updated_DoB
FROM student;
-- ----------------------------------------------------------------------------------------------------------------