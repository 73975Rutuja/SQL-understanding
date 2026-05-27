-- Math functions: These are again some of the built-in functions which performs mathematical operations. Let's explore some examples:
-- ----------------------------------------------------------------------------------------------------------------

-- 1. Rand(): It generates a random number between 0 and 1 (excluded)

SELECT RAND();   -- if seed is not given we get any random values, which changes everytime, we try to run the query
SELECT RAND(3);  -- if seed is given we get the same random value everytime we try to run the query
-- ----------------------------------------------------------------------------------------------------------------
-- CEI() and FLOOR() can be used to roundoff the values, however based on our usage we can decide where we want to use it.

-- 2. Floor() -- round off the values and it gives a lower limit value

SELECT FLOOR(22.899446);   -- here we get a output as 22, because we get the lower limit value here.

-- 3. CEIL() -- round off the values and it gives a upper limit value

SELECT CEIL(22.899446);  -- here we get the output as 23, as it takes the upper limit value.
-- ----------------------------------------------------------------------------------------------------------------
-- 4. Power() or POW(): It returns the value of a number raised to the power of another number

SELECT POWER(3,2);     -- we get 9
SELECT POWER(13,4);    -- we get 28561
SELECT POW(9,4);       -- we get 6561
-- ----------------------------------------------------------------------------------------------------------------
-- Division operators:

-- 5. DIV: it'll return the integer division of the two number. Basically, we'll get a quotient in this case.

SELECT 90 DIV 4;    -- We get 22
SELECT 778 DIV 3;   -- Ideally, the answer should be 259.33333, however as it is a integer division we get 259.

-- 5. MOD() : This is also used for division, however it'll return the reminder value

SELECT MOD(9,4);    -- output is 1
-- ----------------------------------------------------------------------------------------------------------------

-- Date and time functions:

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