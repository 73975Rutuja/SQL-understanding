### Day 3 notes:

### 1. Math functions:
- Math function or numeric function are some of the built in functions in SQL, which we use to do mathematical operations.
- There are various functions such as:
    - to find absolute value -ABS(), 
    - to return the smallest integer value before to the number -CEIL(), 
    - to find the logarithm of the number -LOG(), there are log functions to find log10 or log2 of a number too,
    - whenever we wanted to find a maximum value -MAX(), 
    - To find a modulus of a number -MOD(), etc.


### 2. Datetime functions:
- Datetime functions are the built-in functions using which we can retrieve the current date, current time. Further, if we wanted to retrieve the month from some date, day from some date, we can do that.
- Those functions are a built-in data type used to store values containing both a date and a time component in a combined format. The default standard display format across most database systems is YYYY-MM-DD HH:MM:SS.
- Some of the functions are:
    - CURDATE(): It'll just return the date, however NOW() will return the current date and time, so use wsely.
    - DATEDIFF(date1, date2): It'll return the difference of days between the two dates.
    - DATE_ADD(date, interval) or DATE_SUB(date, interval): It'll give add or substract the time interval from the date mentioned and then returns the date.

### 3. Experiments:
- In this section, I have asked CHATGPT to give me some of the problem statements where I can only use the mathematical, datetime functions.