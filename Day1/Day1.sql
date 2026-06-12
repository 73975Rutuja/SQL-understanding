CREATE DATABASE school_db;  -- this command is used to create the database

USE school_db;

CREATE TABLE students (				-- to create the tables
    student_id INT PRIMARY KEY,		-- we can see the student_id is a primary key
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id)				-- here the student_id is a foreign key 
    REFERENCES students(student_id)
);

INSERT INTO students VALUES					-- inserting the values in the tables
(1, 'Rutu', 20),
(2, 'Tia', 21),
(3, 'Mark', 22);

INSERT INTO subjects VALUES
(1011, 'Math', 1),
(1012, 'Science', 2),
(1013, 'English', 3);

SELECT * FROM students;					-- checking the data from the students table.

SELECT * FROM subjects;

DELETE FROM students					-- Deleting specific entry
WHERE student_id = 2;

SELECT * FROM students;

TRUNCATE TABLE subjects;				-- TRUNCATE TABLE command deletes the data inside a table, but not the table itself.

SELECT * FROM subjects;
DROP TABLE students;					-- DROP will delete a table from the database
DROP TABLE subjects;

# SELECT * FROM subjects;
