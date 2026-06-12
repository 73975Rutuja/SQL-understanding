# DAY 1 NOTES

### Q. What is SQL?
- Structured Query language(SQL) is a standard language for accessing and manipulating databases.
    1. SQL stands for Structured Query Language
    2. SQL lets you access and manipulate databases.

- There are different query languages:

1. DDL (Data Definition Language):
These consists of SQL commands that can be used for defining, altering and deleting database structures such as tables.
Ex. are CREATE, ALTER, DELETE, etc.

2. DML (Data Manipulation Language):
These consists of SQL commands that are used to manipulate the data stored in database tables. 
Ex are INSERT, UPDATE, DELETE.

3. DQL (Data QUERY Language):
The one helps use to retrieve and fetch the data.  The main command is SELECT, which retrieves records based on the query. The output is returned as a result set (a temporary table) that can be viewed or used in applications.
Ex. is SELECT

4. DCL (Data Control Language):
It consists of the commands which is used to give certain rights, permissions and other controls of the database systems. Using these commands we can use to control access to data in the database by granting and revoking the permissions.
Ex. are GRANT, REVOKE.

5. TCL (Transaction Control Language):
In a single execution unit there are certain tasks for a transaction to be complete. Each of these transactions begins with a task and it ends when all the tasks inside it are successfully complete. In case, if any of the tasks within them fails, the whole transactions fails. Therefore, there are only two results: success and failure.
Ex. are BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT.

### Q. What is Primary key and Foreign key?

1. Primary Key: 
To uniquely identify the data, we use the Primary key. It is a constraint ensures unique value and cannot contain NULL values (thus is a combination of both the UNIQUE and NOT NULL constraints) Primary keys can either be a single column or a combination of columns.
- Ex 1. Primary key with only 1 column:

CREATE TABLE Student(
	stud_ID int PRIMARY KEY,
	stud_name VARCHAR(50) NOT NULL,
	age int
);

- Ex 2. Primary key with unnamed PRIMARY KEY constraint on multiple columns
CREATE TABLE Cars(
	car_ID int,
	model_no int,
	brand_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (car_ID, model_no)
);

2. Foreign Key: 
It links the relation between the two tables, it also prevents the actions that will destroy the link between them. Also, this key is primary key in other table. The table having Foreign key is called as child table and the table with Primary key is called as parent table.
Ex. CREATE TABLE Department(
	dept_ID int PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (stud_ID)
);

### Q. What is metadata?
It is basically data about data. It has a description and context of the data, which will helps us to find, understand and organize the data. In Relational database the metadata are tables, columns, data types, etc.