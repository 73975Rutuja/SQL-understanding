 /* Temporary tables: These are the temporary tables in SQL and it does not get any memory allocated in the database.
- That means, these tables are not added to the database; however, it is created in memory.

* It's shortcoming are:
- This table will exist until we kill the session or manually drop the table.
- Scope is till session table

Why these tables are needed?
- Since the subquery and Common Table Expresions (The CTEs) scope are only till the query level, thus we are using temporary tables.
- Also, in some cases, the intermeditate results of any Data analytics process are important and if you wanted to have a quick references for that
intermeditate results and don't want it to be stored in the database.
*/

CREATE DATABASE school_db;

USE school_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

INSERT INTO students VALUES
(1, 'Rutu', 20),
(2, 'Tia', 21),
(3, 'Mark', 22);

INSERT INTO subjects VALUES
(1011, 'Math', 1),
(1012, 'Science', 2),
(1013, 'English', 3);

SELECT * FROM students;

SELECT * FROM subjects;

-- How to create a temporary table?
USE school_db;
SHOW TABLES;    -- this will show the tables available in the school_db already (in our case it is students & subjects).

CREATE TEMPORARY TABLE transfer_student
(	student_id INT,
	student_name VARCHAR(50) NOT NULL,
    department CHAR(50) NOT NULL,
    PRIMARY KEY(student_id)
);

INSERT INTO transfer_student(student_id, student_name, department)
VALUES
(1, "Alice M", "Mathematics"),
(2, "Benjamin Z", "Social Studies"),
(3, "Sophie Christ", "Biology")
;

SHOW TABLES;  -- this will still show us sudents and subjects tables, however the transfer_student tables does show up here.

SELECT * FROM transfer_student;
-- if we run the above command we can see the values inside the transfer_students, however the table is not added to our school_db database.
/* The above temporary table will exist until the session is working, since there is not drop query for it*/

-- ------------------------------------------------------------------------------------------------------------------------------------------

/* Views tables: 
It is basically a virtual table which we create using a query that selects the data from one or more tables.

Why to use the View tables:
- To encapsulate the data, security purposes.  We are trying to protect the original data from the outside world.
- To share the view tables, we need to give the access for that.
- The scope is till global level.

Storage or where to see it:
- It will be stored under views tables and to remove it, we need to drop it using the query.
- In views we give the read only access, if we don't want the end user to make any changes to it. This access can be changed based on the use case

Types of views:
1. Simple view: It is based on single table and it doesn't use any function, joins or group by 
2. Complex View: It can combine multiple tables using joins and can include functions or grouping
3. Force view: This is useful in the temporary table scenario, where it is created even if the underlying tables or columns doesn't exist.
4. Read-only view: As mentioned, view can grant access, so read-only view will allow to be viewed and not to modify the data.
5. Checkpoint view: It'll use a with check option to apply some of the rules so that changes can comply with the view's conditions.
*/

-- 1. How to create a Simple view table:

USE EXAM;

SHOW TABLES;
SELECT * FROM application;
SELECT * FROM college;
SELECT * FROM student;

CREATE VIEW simpleview AS
SELECT sID, sNAME, GPA FROM student;
-- once the above query is run, we can see the simpleview table added under Views table in the EXAM db.

SELECT * FROM simpleview; -- It'll show us the table contents in the simpleview table

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- 2. How to create a Complex view table:
-- We'll try to make a view which will fetch the total rental amount paid by each customer.
USE sakila;

SELECT * FROM payment;

CREATE VIEW complexview AS
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 6.00;

SELECT * FROM complexview;

-- DROP VIEW complexview;

-- ------------------------------------------------------------------------------------------------------------------------------------------