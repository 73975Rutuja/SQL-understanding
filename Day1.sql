/* Day 1: SQL basic understanding:
- topics covered are: DDL, DML, DQL queries
* DDL (Data Defination Language: The one which defines the data
eg are CREATE, ALTER, etc.
* DML (Data Manipulation Language: The one which helps us to manipulate the data
eg are INSERT, UPDATE, DELECTE, etc.
* DQL (Data QUERY Language: The one helps use to retrieve and fetch the data
eg is SELECT
- What is Primary key and Foreign key?
1. Primary Key: To uniquely identify the data, we use the Primary key.
2. Foreign Key: It links the relation between the two tables. Also, this key is priamry key in other table.
- What is metadata?
it is the data of data.
- Understanding of DROP, DELETE and TRUNCATE queries.
*/

-- Below is the basic database creation, which coveres all the above topics:

CREATE DATABASE school_db;

USE school_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    student_id INT,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

INSERT INTO students VALUES
(1, 'Rutu', 20),
(2, 'Tia', 21),
(3, 'Mark', 22);

INSERT INTO subjects VALUES
(101, 'Math', 1),
(102, 'Science', 2),
(103, 'English', 3);

SELECT * FROM students;

SELECT * FROM subjects;

DELETE FROM students
WHERE student_id = 3;

SELECT * FROM students;

TRUNCATE TABLE subjects;

SELECT * FROM subjects;

DROP TABLE subjects;

SELECT * FROM subjects;
