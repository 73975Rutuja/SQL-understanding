-- Math functions: 
-- Let's explore some examples:
-- ----------------------------------------------------------------------------------------------------------------
-- CEI() and FLOOR() can be used to roundoff the values, however based on our usage we can decide where we want to use it.

-- 1. Floor() -- round off the values and it gives a lower limit value

SELECT FLOOR(22.899446);   -- here we get a output as 22, because we get the lower limit value here.

-- 2. CEIL() -- round off the values and it gives a upper limit value

SELECT CEIL(22.899446);  -- here we get the output as 23, as it takes the upper limit value.
-- ----------------------------------------------------------------------------------------------------------------
-- 3. Power() or POW(): It returns the value of a number raised to the power of another number

SELECT POWER(3,2);     -- we get 9
SELECT POWER(13,4);    -- we get 28561
SELECT POW(9,4);       -- we get 6561
-- ------------------------------------------------------------------------------------------------------------------------------------
-- Division operators:
-- 4. DIV: it'll return the integer division of the two number. Basically, we'll get a quotient in this case.

SELECT 90 DIV 4;    -- We get 22
SELECT 778 DIV 3;   -- Ideally, the answer should be 259.33333, however as it is a integer division we get 259.

-- 5. MOD() : This is also used for division, however it'll return the reminder value

SELECT MOD(9,4);    -- output is 1
-- -- ------------------------------------------------------------------------------------------------------------------------------------
-- 6. GREATEST(): It'll return the greatest of the list of arguments. In case of numbers, it'll return the greatest number, 
-- however when passed the strings, it'll compares them alphabetically based on ASCII code, string character-by-character from left to right 

SELECT GREATEST(55, 8, 22, 8903, 77736, 09879);

SELECT GREATEST("RutuB", "Brutuja", "Sunshine", "Tawan", "Zee");
-- ------------------------------------------------------------------------------------------------------------------------------------
-- 7. LOG(): It'll return the log value of the number.

SELECT LOG(17);			-- for natural log
SELECT LOG10(90);		-- for log to base 10	
SELECT LOG2(78);		-- for log to base 2
-- ------------------------------------------------------------------------------------------------------------------------------------
-- 8. MAX(): It'll return the maximum number

USE sakila;
SELECT MAX(amount) AS max_amt FROM payment;
-- ------------------------------------------------------------------------------------------------------------------------------------
-- 9. ROUND(): It'll round of the value to few digits if the number is passed.

SELECT ROUND(amount,1) AS amt_nodecimal FROM payment;	-- the 1 states the place after point
-- ------------------------------------------------------------------------------------------------------------------------------------
-- 10. Rand(): It generates a random number between 0 and 1 (excluded)

SELECT RAND();   -- if seed is not given we get any random values, which changes everytime, we try to run the query
SELECT RAND(3);  -- if seed is given we get the same random value everytime we try to run the query

-- ----------------------------------------------------------------------------------------------------------------