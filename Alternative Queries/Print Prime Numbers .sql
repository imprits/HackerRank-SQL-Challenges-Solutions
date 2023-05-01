Solution-1: (MS-SQL Query):

DECLARE @table TABLE (PrimeNumber INT)

DECLARE @final AS VARCHAR(1500)
SET @final = ''

DECLARE @counter INT
SET @counter = 2

WHILE @counter <= 1000
  BEGIN
      IF NOT EXISTS (SELECT primenumber
                     FROM   @table
                     WHERE  @counter % primenumber = 0)
        BEGIN
            INSERT INTO @table
            SELECT @counter

            SET @final = @final + Cast(@counter AS VARCHAR(20)) + '&'
        END

      SET @counter = @counter + 1
  END

SELECT Substring(@final, 0, Len(@final));

NOTE: 

The DECLARE statement is used to declare a variable in SQL and its value is set to NULL.

SET is for initializing the variable you declared previously, and you cannot SET the variable until you DECLARE it.

SQL WHILE loop is used to execute the SQL statement(s) repeatedly until the specified condition result turn out to be false.

The EXISTS operator is used to test for the existence of any record in a subquery. The EXISTS operator returns TRUE if the 
subquery returns one or more records.