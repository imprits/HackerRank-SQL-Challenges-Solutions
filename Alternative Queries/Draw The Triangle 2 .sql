Solution-1: (MySQL Query):

SET @no_of_lines = 0;

SELECT REPEAT('* ', @no_of_lines := @no_of_lines + 1) 
FROM INFORMATION_SCHEMA.TABLES
WHERE @no_of_lines < 20;

NOTE: 

The INFORMATION_SCHEMA.TABLES view allows you to get information about all tables and views within a database.
 By default it will show you this information for every single table and view that is in the database.

the actual values of INFORMATION_SCHEMA.TABLES is not required as such but for running the sql query it has to 
refer to a table.


Solution-2: (MySQL Query):

SET @no_of_lines = 0;

SELECT REPEAT('* ', @no_of_lines := @no_of_lines + 1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;

NOTE: 

The INFORMATION_SCHEMA.TABLES view allows you to get information about all tables and views within a database. 
By default it will show you this information for every single table and view that is in the database.

the actual values of INFORMATION_SCHEMA.TABLES is not required as such but for running the sql query it has to 
refer to a table.


Solution-3: (MS SQL Query):

DECLARE @i INT = 1
WHILE (@i <= 20) 
BEGIN
   PRINT REPLICATE('* ', @i) 
   SET @i = @i + 1
END


NOTE: 

The DECLARE statement is used to declare a variable in SQL and its value is set to NULL.

SET is for initializing the variable you declared previously, and in MS-SQL, you cannot SET the variable until you DECLARE it.