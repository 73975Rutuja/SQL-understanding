-- Experiments:

/* 1: Lottery System: Goal: Generate a random number between 1 and 100.*/

SELECT FLOOR(RAND() *100) + 1 AS lucky_number ;
-- -------------------------------------------------------------------------------------------------------------------------------------
/* 2. Goal: Student Age Calculator: Calculate approximate age from birth date */

SELECT FLOOR(DATEDIFF(CURDATE(), "2002-03-17") / 365) AS student_age;
-- ---------------------------------------------------------------------------------------------------------------------------------------

/* 3. Employee Work Anniversary Tracker Goal: Find how many days an employee has worked */

SELECT DATEDIFF(CURDATE(), "2016-05-15") AS days_emp_worked;
-- ---------------------------------------------------------------------------------------------------------------------------------------

/* 4. EMI / Compound Interest Simulator: Calculate growth of money.
Example thought:
P = 10,000 invested
R = 10% interest
t = 5 years and n = 1
A = p(1 + r/n ) ^ nt*/
	
SELECT ROUND(POWER((1 + 0.10),5) * 10000,1) AS amount;	-- we'll round the number for 1 digit
-- -------------------------------------------------------------------------------------------------------------------------------------------
/* 5. Distance Between Two Points: Goal: Implement the school-level distance formula.
√((x2-x1)^2 + (y2-y1)^2)
Point A = (2,3)
Point B = (7,9)
*/

SELECT SQRT(
	POWER((9-3), 2) + POWER((7-2), 2)
    ) AS distance;
-- -------------------------------------------------------------------------------------------------------------------------------------------
/* 6. Generate random simulation for 
1. Dice
2. Coin toss
3. Rock-Paper-Scissors
*/

-- 1. Dice roll:
SELECT FLOOR((RAND() * 6)) + 1 AS dice_roll;
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Coin toss:

SELECT toss,
CASE
	WHEN toss = 0 THEN 'TAIL'
	ELSE 'HEAD'
    END AS coin_toss
FROM (
    SELECT FLOOR(RAND() * 2) AS toss
) AS coin;
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Rock-Paper-SCissors:

SELECT choice,
CASE
	WHEN choice = 0 THEN "ROCK"
    WHEN choice = 1 THEN "PAPER"
    ELSE "SCISSORS"
END AS game
FROM (
	SELECT FLOOR(RAND() * 3)  AS choice
) AS ending;
-- -------------------------------------------------------------------------------------------------------------------------------------------