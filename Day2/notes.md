### Day 2 NOTES

### Topic DQL SELECT command:
- SELECT command helps us to select the data from the database. The data which is returned is stored in a result table, called the result set.

- Ex:
1. SELECT * FROM tablename              -- will display all the contains in the tablename
2. SELECT columnname FROM tablename     -- will  display the contains of the column from the tablename

- NULL values: 
- There are instances in a tables when we create a field which can be used later, so in this case we can keep those fields as NULL values.
- We are using it in a condition, where something is NULL.
	- It's not always we need to replace the NULL value, we can give it a new name eg it is returned, not returned, etc

### Additional notes:

- GROUP BY and having, clustering of the data is done by GROUP BY and then if we wanted to filter it, we'll use HAVING
	- whenever we are using GROUP BY using a column, we need to use the same column name in the SELECT query too (MYSQL handled it, however in other servers it'll give us an error)
    - Where clause will do the row level or for each one, however HAVING will do it at aggregate level
    (show an example using combination of all of group by, order by and limit)
    - While using having never use the alias name
- Order of execution:
      from (tables) --> join --> where(raw or single data) --> group by (using group by before having, to reduce the data side, for less computation) --> having(it is on aggregate) --> select --> order by --> Limit

### CASE Statements:

- These are the statements, which we execute to generate results based on conditions in SQL.
- The CASE statements will check each condition and will stop at the first matching condition.
- If no condition matches, it'll execute the ELSE statement
- If the statement doesn't contain any ELSE part it'll just return NULL.
- Syntax:
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE default_result
    END;

### Regular expression (REGEXP):

- In SQL we'll use REGEXP to do the pattern matching.
- It is used to search, store or extract or replace the text based on the specific patterns.
- It is majorly used for text processing.
- Ex. if we wanted to check records from table_name whose column_name starts with A, we'll write as follows:
    SELECT column_name FROM table_name
    WHERE column_name REGEXP "^A"