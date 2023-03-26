# select 
SELECT column1, column2, ...
FROM table_name;

# select distinct
SELECT DISTINCT column1, column2, ...
FROM table_name;

SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);

# where
SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Customers
WHERE CustomerID=1;


Operator       Description
=              Equal    
>              Greater than    
<              Less than    
>=             Greater than or equal    
<=             Less than or equal    
<>             Not equal. Note: In some versions of SQL this operator may be written as !=    
BETWEEN        Between a certain range    
LIKE           Search for a pattern    
IN             To specify multiple possible values for a column

SELECT * FROM Customers
WHERE City LIKE 's%';

SELECT * FROM Customers
WHERE City IN ('Paris','London');

# And, Or, Not
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

# Order by
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

# Insert into
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

# Null
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

# Update
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

# Delete
DELETE FROM table_name 
WHERE condition;

# Select Top
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

# Select Limit
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

# Min
SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

# Max
SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MAX(Price) AS LargestPrice
FROM Products;

# Count
SELECT COUNT(column_name)
FROM table_name
WHERE condition;

# Average
SELECT AVG(column_name)
FROM table_name
WHERE condition;

# Sum
SELECT SUM(column_name)
FROM table_name
WHERE condition;

# Like
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

LIKE Operator                     Description
WHERE CustomerName LIKE 'a%'      Finds any values that start with "a"
WHERE CustomerName LIKE '%a'      Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'    Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'     Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'     Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'    Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'      Finds any values that start with "a" and ends with "o"

# Wildcards
Symbol    Description                                                   Example
%         Represents zero or more characters                            bl% finds bl, black, blue, and blob
_         Represents a single character                                 h_t finds hot, hat, and hit
[]        Represents any single character within the brackets           h[oa]t finds hot and hat, but not hit
^         Represents any character not in the brackets                  h[^oa]t finds hit, but not hot and hat
-         Represents any single character within the specified range    c[a-b]t finds cat and cbt

# In
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

# select case
SELECT   ...,
         CASE WHEN IDParent < 1 THEN ID ELSE IDPArent END AS ColumnName,
         ...
FROM     tableName